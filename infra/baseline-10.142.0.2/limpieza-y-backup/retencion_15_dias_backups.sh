#!/bin/bash
# ORIGINAL de produccion 10.142.0.2 (copiado 2026-10-16). Credenciales removidas si las hubiera.
# Solo como referencia/baseline.

find /trazaSystems/backups -mtime +6 -type f -exec rm -f {} \;
