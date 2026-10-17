# Baseline: scripts de producción de 10.142.0.2

Copia **de referencia** de los scripts que hoy corren en `vm-production-assetplanner-inst1`
(`/trazaSystems`, `/root/bucket`), tomada el **2026-10-16** con comandos de solo lectura.

> **Las credenciales fueron removidas** (`***REDACTED***`): contraseña SMTP de `infra@trazalog.com`
> y contraseña de PostgreSQL. Por eso los archivos de esta carpeta **no son ejecutables tal cual**.
> No suba al repositorio las versiones con credenciales reales.

Sirven como punto de partida y para comparar contra lo que se despliegue en otros servidores
(ver [`../monitoring-10.142.0.16`](../monitoring-10.142.0.16/), que parte de estos scripts).

| Carpeta / archivo | Contenido |
|---|---|
| `crontab_root.txt` | Crontab de root tal cual está en producción |
| `monitoreo/` | `HD_space_status.py`, `RAM_status.py`, `CPU_usage_status.py`, `Services_status.py`, `Internet_status.py` |
| `limpieza-y-backup/cleanup_logs.sh`, `directorios.csv` | Limpieza de logs de las apps PHP (+ movimiento al bucket si el disco supera 85 %) |
| `limpieza-y-backup/retencion_15_dias_backups.sh`, `retencion_30_dias_bucket.sh`, `sync_backups_bucket.sh`, `mount_bucket.sh` | Retención y copia de backups al bucket |
| `limpieza-y-backup/backups/` | Los 6 scripts de dump programados (MySQL: asp2sim, asp2tecn; PostgreSQL: bonita, bonita_db, bonita_bdm, trazalog_tools) |

## Comportamiento y defectos conocidos de los originales

- **Sin memoria de estado**: HD/RAM/Services mandan un mail **cada 10 minutos** mientras dure el problema.
- `Internet_status.py`: `if(is_connected):` nunca llama a la función → manda "Internet access is alive" 3 veces por día **siempre**.
- `Services_status.py`: busca subcadenas en `ps -ef`; mezcla tabuladores y espacios (falla en Python 3).
- `CPU_usage_status.py`: no está programado en el cron.
- `HD_space_status.py`: solo mide MB libres de `/trazaSystems` (umbral 2048 MB); los otros scripts mandan solo a `infra@`.
- Todos los envíos van por SMTP SSL a `mauriper.ferozo.com:465` con la contraseña **dentro del código**.
- Backups: usan `os.popen` y no verifican el resultado; `postgres_backup_*` ponen la contraseña en el código; `mysqldump` corre sin contraseña (depende de la configuración del usuario).
- `sync_backups_bucket.sh`: `rsync -r` sin `-t` → vuelve a subir todo cada noche.

Más detalle y recomendaciones: [`../doc/prod-10.142.0.2-assetplanner.md`](../doc/prod-10.142.0.2-assetplanner.md).
