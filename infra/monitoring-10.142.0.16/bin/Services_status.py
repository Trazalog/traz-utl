#!/usr/bin/env python
# -*- coding: utf-8 -*-
"""
Services_status.py - Servicios vivos (evolucion del script de 10.142.0.2).

El original buscaba httpd/mysqld/postgres/tomcat/bonita dentro de `ps -ef` y
mandaba un mail cada 10 minutos mientras estuvieran caidos. Aca la lista sale
de la seccion [services] de notify.conf ("nombre = texto a buscar en la linea
de comando"), se avisa una vez al caerse, se repite cada N horas y se avisa
cuando vuelve. Opcionalmente verifica que un puerto responda: "nombre|puerto".
"""
from __future__ import print_function
import os
import socket
import sys
sys.path.insert(0, os.path.dirname(os.path.realpath(__file__)))
import trz_notify as tn


def build(cfg):
    out = []
    for name, value in cfg.items('services'):
        pattern, _sep, port = value.partition('|')
        pattern, port = pattern.strip(), port.strip()
        pids = tn.process_running(pattern)
        level = 0
        if not pids:
            level = 2
            summary = '%s NO esta en ejecucion (busca "%s")' % (name, pattern)
        else:
            summary = '%s en ejecucion (PID %s)' % (name, ','.join(pids[:3]))
            if port:
                try:
                    sock = socket.create_connection(('127.0.0.1', int(port)), 3)
                    sock.close()
                    summary += ', puerto %s responde' % port
                except (socket.error, ValueError):
                    level = 2
                    summary += ', pero el puerto %s NO responde' % port
        lines = ['Message: Service stopped: %s' % name,
                 'Pattern: %s%s' % (pattern, (' / puerto ' + port) if port else '')]
        out.append(tn.finding('service_' + name, 'Service is stopped', level, summary, lines,
                              int(cfg.num('general', 'service_consecutive', 1))))
    return out


if __name__ == '__main__':
    sys.exit(tn.run('Chequeo de servicios', build))
