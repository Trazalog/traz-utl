#!/usr/bin/env python
# -*- coding: utf-8 -*-
"""
HD_space_status.py - Espacio en disco (evolucion del script de 10.142.0.2).

Igual que el original avisa cuando quedan menos de `min_free_mb` MB libres
(2048 por defecto), y agrega umbrales por porcentaje (WARNING/CRITICAL) para
poder actuar ANTES de llegar al limite. Soporta varias rutas.
Configuracion: seccion [disk] de notify.conf.
"""
from __future__ import print_function
import os
import sys
sys.path.insert(0, os.path.dirname(os.path.realpath(__file__)))
import trz_notify as tn


def build(cfg):
    paths = [p.strip() for p in (cfg.get('disk', 'paths', '/') or '/').split(',') if p.strip()]
    warn = cfg.num('disk', 'warn_pct', 80.0)
    crit = cfg.num('disk', 'crit_pct', 90.0)
    min_free = cfg.num('disk', 'min_free_mb', 2048.0)
    out = []
    for path in paths:
        try:
            st = os.statvfs(path)
        except OSError as exc:
            out.append(tn.finding('disk_' + path, 'Drive space', 2, '%s: no se pudo leer (%s)' % (path, exc)))
            continue
        used = (st.f_blocks - st.f_bfree) * st.f_frsize
        avail = st.f_bavail * st.f_frsize
        total = used + avail
        pct = 100.0 * used / total if total else 0.0
        free_mb = avail / 1024.0 / 1024.0
        level = 2 if pct >= crit else (1 if pct >= warn else 0)
        if free_mb < min_free:
            level = 2
        summary = '%s %.0f%% usado, libres %s de %s' % (path, pct, tn.human(avail), tn.human(total))
        lines = ['Message: Drive space fallen below metrics thresholds',
                 'Path: %s' % path,
                 'Umbral metrics: warn %.0f%% / crit %.0f%% / min libre %.0f MB' % (warn, crit, min_free),
                 'Current free space: %.0f MB (%.0f%% usado)' % (free_mb, pct)]
        out.append(tn.finding('disk_' + path, 'Drive space', level, summary, lines))
    return out


if __name__ == '__main__':
    sys.exit(tn.run('Chequeo de espacio en disco', build))
