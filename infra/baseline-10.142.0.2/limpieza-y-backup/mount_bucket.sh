#!/bin/bash
# ORIGINAL de produccion 10.142.0.2 (copiado 2026-10-16). Credenciales removidas si las hubiera.
# Solo como referencia/baseline.

# Verificar si el proceso ya está corriendo
if pgrep -f "/usr/bin/gcsfuse" > /dev/null
then
    echo "El proceso gcsfuse ya está corriendo. No se necesita montar nuevamente."
else
    echo "No se encontró el proceso gcsfuse. Montando el bucket..."
    gcsfuse --key-file /root/bucket/key.json backup-trazalog /mnt/bucket
fi
