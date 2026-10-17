# ORIGINAL de produccion 10.142.0.2 (copiado 2026-10-16). Credenciales REMOVIDAS (***REDACTED***).
# Solo como referencia/baseline: no ejecutar tal cual.
#############################################################################################################
# Script to backup mysql databases, excluding databaeses: information_schema, mysql and performance_schema  #
#############################################################################################################

import os
import time

# START: configuration
# username
username = 'root'
# hostname
hostname = 'localhost'
# backup destination directory
dest_folder = '/trazaSystems/backups/mysql/asp2sim'
# database name
database = 'asp2sim'
# timestamp
filestamp = time.strftime('%Y%m%d%H%M')
# file name 
filename = "%s/%s-%s.sql" % (dest_folder, filestamp, database)
# END: configuration

# backup mysqldump
os.popen("mysqldump -u%s -h %s -e --opt -c %s | gzip -c > %s.gz" % (username, hostname, database, filename))
