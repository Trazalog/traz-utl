#!/usr/bin/env python
# -*- coding: utf-8 -*-
"""
Internet_status.py - Acceso a internet + latido diario (de 10.142.0.2).

En el original la funcion is_connected() NUNCA se llamaba (`if(is_connected):`
es siempre verdadero), asi que en la practica el script mandaba un mail
"Internet access is alive" tres veces por dia sin comprobar nada. Eso sirve
de "latido": si dejan de llegar esos mails, el servidor o el cron murieron.

Aca se conserva esa idea pero bien hecha:
  * Si hay internet manda el INFO de siempre, con un resumen de disco/RAM/CPU.
  * Si NO hay internet lo registra en el log (no hay como avisar por mail,
    pero Telegram/SMTP se reintentan en la proxima corrida).
Programar en cron 3 veces por dia (08, 16 y 22 h) como en produccion.
Configuracion: seccion [internet].
"""
from __future__ import print_function
import os
import socket
import sys
sys.path.insert(0, os.path.dirname(os.path.realpath(__file__)))
import trz_notify as tn


def is_connected(host, port):
    try:
        sock = socket.create_connection((host, port), 5)
        sock.close()
        return True
    except (socket.error, OSError):
        return False


def snapshot():
    out = []
    try:
        st = os.statvfs('/')
        used = (st.f_blocks - st.f_bfree) * st.f_frsize
        avail = st.f_bavail * st.f_frsize
        out.append('Disk /: %.0f%% usado, libres %s' % (100.0 * used / (used + avail), tn.human(avail)))
    except OSError:
        pass
    try:
        mem = {}
        with open('/proc/meminfo') as handle:
            for line in handle:
                p = line.split()
                mem[p[0].rstrip(':')] = int(p[1]) * 1024
        out.append('RAM disponible: %s de %s' % (tn.human(mem.get('MemAvailable', 0)), tn.human(mem['MemTotal'])))
        out.append('Load: %.2f/%.2f/%.2f' % os.getloadavg())
    except (IOError, OSError, KeyError):
        pass
    return out


def main():
    args = tn.parse_args('Acceso a internet y latido')
    try:
        cfg = tn.load_config(args.config)
    except ValueError as exc:
        sys.stderr.write('ERROR de configuracion: %s\n' % exc)
        return 3
    host = cfg.get('internet', 'host', 'www.google.com')
    port = int(cfg.num('internet', 'port', 80))
    ok = is_connected(host, port)
    print('Internet access: %s (%s:%s)' % ('alive' if ok else 'DOWN', host, port))
    if args.check:
        return 0 if ok else 2
    if not ok:
        tn.log(cfg, 'ATENCION: sin acceso a %s:%s' % (host, port))
        return 0
    if not cfg.flag('internet', 'heartbeat', True):
        return 0
    body = '\n'.join(['Hostname: %s' % socket.gethostname(),
                      'Server: %s' % tn.server_name(cfg),
                      'Client: %s' % cfg.get('general', 'client', 'Google Cloud'),
                      'Type alert: VM Internet Access',
                      'Message: Internet access alive'] + snapshot())
    tn.notify(cfg, 'INFO EVENT: Internet access is alive - %s' % tn.server_name(cfg), body, args.dry_run)
    return 0


if __name__ == '__main__':
    sys.exit(main())
