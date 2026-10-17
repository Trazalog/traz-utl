#!/usr/bin/env python
# -*- coding: utf-8 -*-
"""
trz_notify.py - Modulo comun de los scripts *_status.py (mail + Telegram).

Es la evolucion de lo que hoy se repite copiado en cada script de produccion
(10.142.0.2): armar el mensaje y mandarlo por SMTP_SSL. Se le agrego:
  * Canal Telegram (ademas del mail).
  * Credenciales en un archivo de configuracion (NO dentro del codigo).
  * Anti-spam: avisa al detectar el problema, lo repite cada N horas mientras
    siga, y avisa cuando se resuelve. (Los scripts originales mandaban un mail
    cada 10 minutos mientras durara el problema.)
  * Reintento: si ningun canal pudo entregar el aviso, no se da por avisado.
  * Modos --check / --dry-run / --test para probar sin molestar a nadie.

Compatible Python 2.7 (CentOS 7) y 3.x. Solo biblioteca estandar.

Uso directo (pruebas):
  trz_notify.py --config /trazaSystems/infra/conf/notify.conf --test
  trz_notify.py --config ... --send "ASUNTO" "TEXTO"
"""
from __future__ import print_function

import argparse
import json
import os
import re
import smtplib
import socket
import sys
import time

try:                                    # Python 2
    import ConfigParser as configparser
    from urllib2 import urlopen, Request
    from urllib import urlencode
except ImportError:                     # Python 3
    import configparser
    from urllib.request import urlopen, Request
    from urllib.parse import urlencode

from email.mime.text import MIMEText
from email.header import Header
from email.utils import formatdate

LEVELS = ['OK', 'WARNING', 'CRITICAL']
DEFAULT_CONFIG = os.environ.get('TRZ_CONFIG', '/trazaSystems/infra/conf/notify.conf')


# --------------------------------------------------------------------------
# Configuracion
# --------------------------------------------------------------------------
class Cfg(object):
    """Lectura del .conf (sin interpolacion de %, tolera comentarios ' #')."""

    def __init__(self, path):
        self.path = path
        self.cp = configparser.RawConfigParser()
        self.cp.optionxform = str           # respeta mayusculas en los nombres
        if not os.path.isfile(path):
            raise ValueError('no existe el archivo de configuracion: %s' % path)
        self.cp.read(path)

    def get(self, section, option, default=None):
        try:
            value = self.cp.get(section, option)
        except (configparser.NoSectionError, configparser.NoOptionError):
            return default
        if ' #' in value:
            value = value.split(' #', 1)[0]
        return value.strip()

    def num(self, section, option, default=None):
        value = self.get(section, option)
        if value in (None, ''):
            return default
        try:
            return float(value)
        except ValueError:
            raise ValueError('[%s] %s debe ser numerico (es "%s")' % (section, option, value))

    def flag(self, section, option, default=True):
        value = self.get(section, option)
        if value in (None, ''):
            return default
        return value.lower() in ('1', 'yes', 'true', 'si', 'on')

    def items(self, section):
        if not self.cp.has_section(section):
            return []
        out = []
        for name, value in self.cp.items(section):
            if ' #' in value:
                value = value.split(' #', 1)[0]
            out.append((name, value.strip()))
        return out


def load_config(path=None):
    return Cfg(path or DEFAULT_CONFIG)


def server_name(cfg):
    return cfg.get('general', 'server_name', socket.gethostname())


# --------------------------------------------------------------------------
# Log propio (best effort)
# --------------------------------------------------------------------------
def log(cfg, msg):
    path = cfg.get('general', 'log_file')
    if not path:
        return
    line = '%s %s' % (time.strftime('%Y-%m-%d %H:%M:%S'), msg)
    try:
        if os.path.exists(path) and os.path.getsize(path) > 2 * 1024 * 1024:
            os.rename(path, path + '.1')
        with open(path, 'a') as handle:
            handle.write(line + '\n')
    except (IOError, OSError):
        sys.stderr.write('(no se pudo escribir el log %s)\n' % path)


# --------------------------------------------------------------------------
# Canales
# --------------------------------------------------------------------------
def send_email(cfg, subject, body):
    host = cfg.get('email', 'smtp_host') or 'localhost'
    security = (cfg.get('email', 'smtp_security', 'none') or 'none').lower()
    port = int(cfg.num('email', 'smtp_port', 465 if security == 'ssl' else 25))
    user = cfg.get('email', 'smtp_user')
    password = cfg.get('email', 'smtp_password')
    sender = cfg.get('email', 'from') or user
    recipients = [x.strip() for x in (cfg.get('email', 'to') or '').split(',') if x.strip()]
    if not sender or not recipients:
        raise ValueError('[email] faltan "from" o "to"')

    msg = MIMEText(body, 'plain', 'utf-8')
    msg['Subject'] = Header(subject, 'utf-8')
    msg['From'] = sender
    msg['To'] = ', '.join(recipients)
    msg['Date'] = formatdate(localtime=True)

    if security == 'ssl':
        server = smtplib.SMTP_SSL(host, port, timeout=20)
    else:
        server = smtplib.SMTP(host, port, timeout=20)
    try:
        server.ehlo()
        if security == 'starttls':
            server.starttls()
            server.ehlo()
        if user:
            server.login(user, password or '')
        server.sendmail(sender, recipients, msg.as_string())
    finally:
        try:
            server.quit()
        except Exception:
            pass


def send_telegram(cfg, subject, body):
    token = cfg.get('telegram', 'bot_token')
    chat_id = cfg.get('telegram', 'chat_id')
    if not token or not chat_id:
        raise ValueError('[telegram] faltan "bot_token" o "chat_id"')
    text = subject + '\n\n' + body
    if len(text) > 4000:                    # limite de Telegram: 4096
        text = text[:3990] + '\n[...]'
    data = urlencode({'chat_id': chat_id, 'text': text,
                      'disable_web_page_preview': 'true'}).encode('utf-8')
    url = 'https://api.telegram.org/bot%s/sendMessage' % token
    reply = urlopen(Request(url, data), timeout=20).read().decode('utf-8', 'replace')
    if '"ok":true' not in reply.replace(' ', ''):
        raise RuntimeError('Telegram respondio: %s' % reply[:200])


def notify(cfg, subject, body, dry_run=False):
    """
    Envia por todos los canales habilitados.
    Devuelve (entregado_en_al_menos_uno, hubo_algun_fallo).
    Un canal caido no impide usar el otro.
    """
    channels = []
    if cfg.flag('email', 'enabled', False):
        channels.append(('email', send_email))
    if cfg.flag('telegram', 'enabled', False):
        channels.append(('telegram', send_telegram))
    if dry_run:
        print('--- (dry-run) NO se envia por %s ---\nAsunto: %s\n\n%s\n'
              % (', '.join(c[0] for c in channels) or 'ningun canal', subject, body))
        return True, False
    delivered = False
    failed = False
    for name, func in channels:
        try:
            func(cfg, subject, body)
            delivered = True
            log(cfg, 'OK aviso enviado por %s: %s' % (name, subject))
        except Exception as exc:            # un canal roto no corta al otro
            failed = True
            log(cfg, 'ERROR enviando por %s: %s' % (name, exc))
            sys.stderr.write('ERROR enviando por %s: %s\n' % (name, exc))
    if not channels:
        sys.stderr.write('ATENCION: no hay canales habilitados (email/telegram)\n')
    return delivered, failed


# --------------------------------------------------------------------------
# Estado (anti-spam). Un archivo por chequeo => los scripts del cron no se pisan.
# --------------------------------------------------------------------------
def _state_path(cfg, key):
    state_dir = cfg.get('general', 'state_dir', '/trazaSystems/infra/state')
    safe = re.sub(r'[^A-Za-z0-9_.-]+', '_', key)
    return os.path.join(state_dir, safe + '.json')


def _load(path):
    try:
        with open(path) as handle:
            return json.load(handle)
    except (IOError, OSError, ValueError):
        return {'level': 0, 'last_alert': 0, 'bad': 0}


def _save(cfg, path, state):
    tmp = path + '.tmp'
    try:
        d = os.path.dirname(path)
        if not os.path.isdir(d):
            os.makedirs(d)
        with open(tmp, 'w') as handle:
            json.dump(state, handle)
        os.rename(tmp, path)
    except (IOError, OSError) as exc:
        log(cfg, 'ERROR no se pudo guardar el estado %s: %s' % (path, exc))
        sys.stderr.write('ERROR no se pudo guardar el estado %s: %s\n' % (path, exc))


def finding(key, title, level, summary, lines=None, consecutive=1):
    """
    Resultado de un chequeo.
      key      identificador estable (nombre del archivo de estado)
      title    "Drive space", "RAM usage", ... (va en el asunto)
      level    0 OK / 1 WARNING / 2 CRITICAL
      summary  una linea para el modo --check
      lines    lineas extra del cuerpo (estilo de los scripts originales)
    """
    return {'key': key, 'title': title, 'level': level, 'summary': summary,
            'lines': lines or [], 'consecutive': consecutive}


def _body(cfg, fnd, kind):
    out = ['Hostname: %s' % socket.gethostname(),
           'Server: %s' % server_name(cfg),
           'Client: %s' % cfg.get('general', 'client', 'Google Cloud'),
           'Date: %s' % time.strftime('%Y-%m-%d %H:%M:%S %Z'),
           'Type alert: %s' % fnd['title'],
           'Event: %s' % kind,
           'Detail: %s' % fnd['summary']]
    out.extend(fnd['lines'])
    return '\n'.join(out)


def process(cfg, findings, dry_run=False):
    """Aplica la logica anti-spam a cada hallazgo y envia los avisos que correspondan."""
    now = time.time()
    repeat = {1: cfg.num('general', 'repeat_warning_hours', 24.0),
              2: cfg.num('general', 'repeat_critical_hours', 4.0)}
    for fnd in findings:
        path = _state_path(cfg, fnd['key'])
        prev = _load(path)
        plevel = prev.get('level', 0)
        bad = prev.get('bad', 0) + 1 if fnd['level'] > 0 else 0
        if fnd['level'] == 0 or bad >= fnd['consecutive']:
            eff = fnd['level']
        else:
            eff = plevel                    # todavia no se confirma (rebote corto)
        kind = None
        if eff > plevel:
            kind = 'NEW' if plevel == 0 else 'ESCALATED'
        elif eff == plevel and eff > 0:
            if now - prev.get('last_alert', 0) >= repeat[eff] * 3600:
                kind = 'REMINDER'
        elif eff < plevel:
            kind = 'RESOLVED' if eff == 0 else 'DOWNGRADED'

        new_state = {'level': eff, 'bad': bad, 'last_alert': prev.get('last_alert', 0)}
        if kind:
            if eff == 2:
                head = 'CRITICAL EVENT'
            elif eff == 1:
                head = 'WARNING EVENT'
            else:
                head = 'INFO EVENT'
            suffix = ' - RESOLVED' if eff == 0 else ''
            subject = '%s: %s%s - %s' % (head, fnd['title'], suffix, server_name(cfg))
            delivered, _failed = notify(cfg, subject, _body(cfg, fnd, kind), dry_run)
            if delivered:
                new_state['last_alert'] = now
            else:
                new_state['level'] = plevel      # reintentar en la proxima corrida
                log(cfg, 'ATENCION: nadie recibio el aviso "%s"; se reintenta' % subject)
        if not dry_run:
            _save(cfg, path, new_state)


# --------------------------------------------------------------------------
# Envoltorio comun para los scripts *_status.py
# --------------------------------------------------------------------------
def parse_args(description):
    parser = argparse.ArgumentParser(description=description)
    parser.add_argument('--config', default=DEFAULT_CONFIG,
                        help='ruta del notify.conf (default: %s)' % DEFAULT_CONFIG)
    parser.add_argument('--check', action='store_true',
                        help='muestra el estado y sale (0 OK, 1 WARNING, 2 CRITICAL); no avisa')
    parser.add_argument('--dry-run', action='store_true',
                        help='simula: muestra el aviso que mandaria, no envia ni guarda estado')
    return parser.parse_args()


def run(description, build_findings):
    """
    Ciclo estandar de un script: lee config, mide, y avisa (o muestra con --check).
    build_findings(cfg) -> lista de finding().
    """
    args = parse_args(description)
    try:
        cfg = load_config(args.config)
        findings = build_findings(cfg)
    except (ValueError, configparser.Error) as exc:
        sys.stderr.write('ERROR de configuracion: %s\n' % exc)
        return 3
    if args.check:
        for fnd in findings:
            print('[%-8s] %s: %s' % (LEVELS[fnd['level']], fnd['title'], fnd['summary']))
        return max([f['level'] for f in findings] or [0])
    for fnd in findings:                    # salida estilo scripts originales
        print('%s: %s' % (fnd['title'], fnd['summary']))
    process(cfg, findings, args.dry_run)
    return 0


# --------------------------------------------------------------------------
# Utilidades de medicion compartidas
# --------------------------------------------------------------------------
def human(nbytes):
    value = float(nbytes)
    for unit in ('B', 'KB', 'MB', 'GB', 'TB'):
        if value < 1024 or unit == 'TB':
            return '%d B' % value if unit == 'B' else '%.1f %s' % (value, unit)
        value /= 1024.0


def process_running(pattern):
    """PIDs cuya linea de comando contiene `pattern` (no cuenta a los scripts de monitoreo)."""
    me = str(os.getpid())
    found = []
    for pid in os.listdir('/proc'):
        if not pid.isdigit() or pid == me:
            continue
        try:
            with open('/proc/%s/cmdline' % pid, 'rb') as handle:
                cmd = handle.read().replace(b'\0', b' ').decode('utf-8', 'replace')
        except (IOError, OSError):
            continue
        if pattern in cmd and '_status.py' not in cmd and 'trz_notify' not in cmd:
            found.append(pid)
    return found


# --------------------------------------------------------------------------
# CLI propia: pruebas de canales
# --------------------------------------------------------------------------
def main():
    parser = argparse.ArgumentParser(description='Prueba de canales de aviso')
    parser.add_argument('--config', default=DEFAULT_CONFIG)
    parser.add_argument('--test', action='store_true', help='manda un mensaje de prueba')
    parser.add_argument('--send', nargs=2, metavar=('ASUNTO', 'TEXTO'), help='manda un mensaje libre')
    args = parser.parse_args()
    try:
        cfg = load_config(args.config)
    except (ValueError, configparser.Error) as exc:
        sys.stderr.write('ERROR de configuracion: %s\n' % exc)
        return 3
    if args.test:
        subject = 'INFO EVENT: test message - %s' % server_name(cfg)
        body = ('Mensaje de prueba de trz_notify.py.\nSi lo lees, el canal funciona.\n'
                'Hostname: %s\nDate: %s' % (socket.gethostname(), time.strftime('%Y-%m-%d %H:%M:%S %Z')))
    elif args.send:
        subject, body = args.send
    else:
        parser.print_help()
        return 3
    delivered, failed = notify(cfg, subject, body)
    return 0 if delivered and not failed else 4


if __name__ == '__main__':
    sys.exit(main())
