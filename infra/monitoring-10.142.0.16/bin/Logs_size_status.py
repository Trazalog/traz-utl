#!/usr/bin/env python
# -*- coding: utf-8 -*-
"""
Logs_size_status.py - Tamano de los directorios de logs (NUEVO).

No existia en produccion. Se agrego porque el disco de 10.142.0.16 se lleno
por el carbon.log de WSO2 SI: avisa cuando un directorio de logs crece mas de
lo normal, y en el cuerpo lista los archivos mas grandes para ir directo al
culpable. Configuracion: seccion [logdirs] de notify.conf, una linea por
directorio:   nombre = /ruta | warn_MB | crit_MB
"""
from __future__ import print_function
import os
import sys
sys.path.insert(0, os.path.dirname(os.path.realpath(__file__)))
import trz_notify as tn


def scan(path):
    total = 0
    files = []
    for root, _dirs, names in os.walk(path):
        for name in names:
            full = os.path.join(root, name)
            try:
                size = os.lstat(full).st_size
            except OSError:
                continue
            total += size
            files.append((size, full))
    files.sort(reverse=True)
    return total, files[:5]


def build(cfg):
    out = []
    for name, value in cfg.items('logdirs'):
        parts = [x.strip() for x in value.split('|')]
        path = parts[0]
        warn = float(parts[1]) if len(parts) > 1 and parts[1] else 1000.0
        crit = float(parts[2]) if len(parts) > 2 and parts[2] else 3000.0
        if not os.path.isdir(path):
            out.append(tn.finding('logdir_' + name, 'Logs size', 1, '%s: el directorio no existe' % path))
            continue
        total, top = scan(path)
        mb = total / 1024.0 / 1024.0
        level = 2 if mb >= crit else (1 if mb >= warn else 0)
        summary = '%s: %.0f MB (warn %.0f / crit %.0f)' % (path, mb, warn, crit)
        lines = ['Message: Log directory is growing above metrics thresholds',
                 'Path: %s' % path,
                 'Archivos mas grandes:'] + ['  %9s  %s' % (tn.human(s), f) for s, f in top]
        out.append(tn.finding('logdir_' + name, 'Logs size', level, summary, lines))
    return out


if __name__ == '__main__':
    sys.exit(tn.run('Chequeo de tamano de logs', build))
