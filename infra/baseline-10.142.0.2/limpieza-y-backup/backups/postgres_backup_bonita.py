# ORIGINAL de produccion 10.142.0.2 (copiado 2026-10-16). Credenciales REMOVIDAS (***REDACTED***).
# Solo como referencia/baseline: no ejecutar tal cual.
#################################################################################################################
# Script to postgres mysql databases, excluding databaeses: information_schema, postgres and performance_schema #
#################################################################################################################

import os
import time
os.environ["PGPASSWORD"] = "***REDACTED***"

# START: configuration
# username
username = 'postgres'
# hostname
hostname = 'localhost'
# backup destination directory
dest_folder = '/trazaSystems/backups/postgres/bonita'
# database name
database = 'bonita'
# timestamp
filestamp = time.strftime('%Y%m%d%H%M')
# file name
filename = "%s/%s-%s.sql" % (dest_folder, filestamp, database)
# END: configuration

# backup pg_dump
os.popen("/usr/pgsql-9.4/bin/pg_dump -p 6432 -U%s -h %s -c %s | gzip -c > %s.gz" % (username, hostname, database, filename))
