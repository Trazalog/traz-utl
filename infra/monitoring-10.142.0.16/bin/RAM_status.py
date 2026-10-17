#!/usr/bin/env python
# -*- coding: utf-8 -*-
"""
RAM_status.py - Memoria RAM (evolucion del script de 10.142.0.2).

Igual que el original mide la memoria libre en MB (libre + cache, que es lo que
el kernel puede recuperar: MemAvailable) y avisa si cae por debajo del umbral.
Agrega un nivel WARNING previo al CRITICAL. Configuracion: seccion [ram].
"""
from __future__ import print_function
import os
import sys
sys.path.insert(0, os.path.dirname(os.path.realpath(__file__)))
import trz_notify as tn


def meminfo():
    info = {}
    with open('/proc/meminfo') as handle:
        for line in handle:
            parts = line.split()
            if len(parts) >= 2:
                info[parts[0].rstrip(':')] = int(parts[1]) / 1024.0      # MB
    return info


def build(cfg):
    info = meminfo()
    total = info.get('MemTotal', 0.0)
    if 'MemAvailable' in info:
        avail = info['MemAvailable']
    else:
        avail = info.get('MemFree', 0.0) + info.get('Buffers', 0.0) + info.get('Cached', 0.0)
    crit = cfg.num('ram', 'crit_free_mb', 1024.0)
    warn = cfg.num('ram', 'warn_free_mb', 2048.0)
    level = 2 if avail <= crit else (1 if avail <= warn else 0)
    used_pct = 100.0 * (total - avail) / total if total else 0.0
    summary = 'disponible %.0f MB de %.0f MB (%.0f%% usado)' % (avail, total, used_pct)
    lines = ['Message: Memory (RAM) available fallen below metrics thresholds',
             'Umbral metrics: warn %.0f MB / crit %.0f MB (memoria disponible)' % (warn, crit),
             'Current free: %.0f MB' % avail]
    return [tn.finding('ram', 'RAM usage', level, summary, lines,
                       int(cfg.num('ram', 'consecutive', 2)))]


if __name__ == '__main__':
    sys.exit(tn.run('Chequeo de memoria RAM', build))
