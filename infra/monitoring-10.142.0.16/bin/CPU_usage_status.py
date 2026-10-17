#!/usr/bin/env python
# -*- coding: utf-8 -*-
"""
CPU_usage_status.py - Uso de CPU (evolucion del script de 10.142.0.2).

El original usaba `vmstat 1 2` y un umbral de 90%. Aca se mide con /proc/stat
(sin depender de vmstat) y, como esta VM tiene 1 vCPU y un pico corto es
normal, solo avisa si el uso alto se repite `consecutive` corridas seguidas.
Configuracion: seccion [cpu].
"""
from __future__ import print_function
import os
import sys
import time
sys.path.insert(0, os.path.dirname(os.path.realpath(__file__)))
import trz_notify as tn


def cpu_times():
    with open('/proc/stat') as handle:
        vals = [int(x) for x in handle.readline().split()[1:]]
    idle = vals[3] + (vals[4] if len(vals) > 4 else 0)      # idle + iowait
    return idle, sum(vals[:8])


def build(cfg):
    sample = cfg.num('cpu', 'sample_seconds', 5.0)
    idle1, total1 = cpu_times()
    time.sleep(sample)
    idle2, total2 = cpu_times()
    dtotal = total2 - total1
    pct = 100.0 * (1.0 - float(idle2 - idle1) / dtotal) if dtotal > 0 else 0.0
    warn = cfg.num('cpu', 'warn_pct', 80.0)
    crit = cfg.num('cpu', 'crit_pct', 90.0)
    level = 2 if pct >= crit else (1 if pct >= warn else 0)
    try:
        load = 'load %.2f/%.2f/%.2f' % os.getloadavg()
    except (OSError, AttributeError):
        load = ''
    summary = '%.0f%% en %.0fs (%s)' % (pct, sample, load)
    lines = ['Message: CPU Utilization above metrics thresholds',
             'Umbral metrics: warn %.0f%% / crit %.0f%%' % (warn, crit),
             'Current load: %.0f%% %s' % (pct, load)]
    return [tn.finding('cpu', 'CPU overloaded', level, summary, lines,
                       int(cfg.num('cpu', 'consecutive', 3)))]


if __name__ == '__main__':
    sys.exit(tn.run('Chequeo de CPU', build))
