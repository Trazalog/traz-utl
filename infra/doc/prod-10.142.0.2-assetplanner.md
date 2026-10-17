# Producción 10.142.0.2 — `vm-production-assetplanner-inst1`

> Documento para el **operador de infraestructura**.
> Relevado el **2026-10-16** solo con comandos de lectura (SSH, `df`, `du`, `cat`, `systemctl`, `rpm -q`…).
> No se modificó nada en el servidor. Las credenciales encontradas **no** se transcriben acá.

## 1. Ficha rápida

| Ítem | Valor |
|---|---|
| Nombre de instancia | `vm-production-assetplanner-inst1` |
| IP interna | 10.142.0.2 |
| Proyecto GCP | `trazasuite-cloud` |
| Sistema operativo | CentOS Linux 7.9.2009 (**fin de vida desde 30/06/2024**) |
| Uptime al relevar | **608 días** sin reiniciar (el kernel instalado probablemente no está parcheado) |
| CPU / RAM | 2 vCPU / ~9,8 GB (≈5 GB usados, ≈4,5 GB caché) |
| Disco | **Un solo disco** `/dev/sda1`, 55 GB, **91 % usado (5,1 GB libres)** |
| Swap | Disco persistente aparte (`swap-prod`) |
| Bucket montado | `backup-trazalog` en `/mnt/bucket` (gcsfuse, solo root) |
| Acceso | SSH con usuario personal; sudo **sin contraseña** por el grupo `google-sudoers` |
| Agente GCP | Google Cloud **Ops Agent 2.16.0** (instalado 20/06/2022) |
| Hora del servidor | UTC−3 (Argentina) |

## 2. Qué corre en el servidor

Es un servidor "todo en uno":

- **Apache httpd + PHP**: aplicaciones en `/var/www/html` (≈2,8 GB): `traz-tools`, `traz-prod-assetplanner` (sim, tools, v2.0), `traz-comp-dnato`, `sstr-desa-segdenuncias`, `traz-comp-calendar`.
- **MySQL**: `/var/lib/mysql` (≈5,7 GB; la base `asp2tecn` ocupa ≈5,3 GB).
- **PostgreSQL**: `/var/lib/pgsql` (≈15,6 GB): instancia **9.4** (≈12,6 GB, puerto 6432 según los scripts de backup) y **11** (≈2,5 GB).
- **Bonita Community 7.7.0 (Tomcat 8.5.31)** en `/trazaSystems/bonita`.
- **postfix** y `mailx` instalados (los scripts de alerta **no** los usan: salen por un SMTP externo).
- Repositorios yum configurados: MariaDB, EPEL, Remi (PHP 5.4 a 8.0, GLPI), PGDG, WANdisco git, gcsfuse, Google Cloud.

## 3. Uso de disco (2026-10-16, disco raíz: 52 GB usados de 57 GB)

| Carpeta | Tamaño | Comentario |
|---|---|---|
| `/var/lib/pgsql` | 15,6 GB | `9.4` = 12,6 GB, `11` = 2,5 GB |
| `/trazaSystems` | 11,8 GB | de los cuales `backups` = **11,1 GB** (postgres 7,1 + mysql 4,0) |
| `/var/lib/mysql` | 5,7 GB | `asp2tecn` = 5,3 GB |
| `/usr` | 4,8 GB | sistema |
| `/var/www` | 2,8 GB | aplicaciones PHP |
| resto | < 1 GB | `/home`, `/opt`, `/boot`, `/root`, `/etc` |

Notas:
- Medido con `du` como root. Sin root, `du` omite carpetas sin permiso y subestima mucho (`/var/lib/pgsql` no se veía).
- La suma por carpetas (≈42 GB) queda ≈10 GB por debajo de lo que informa `df` (52 GB). Se vieron 16 archivos WAL de PostgreSQL (`pg_xlog`) borrados pero todavía abiertos por procesos; son pocos y chicos, no explican la diferencia. **Causa de la diferencia no determinada.**

## 4. Cadena de backups (crontab de root)

```
02:00 y @reboot  mount_bucket.sh            monta el bucket backup-trazalog en /mnt/bucket
03:00            6 scripts de dump          mysql: asp2sim, asp2tecn | postgres: bonita_db, trazalog_tools, bonita_bdm, bonita
04:00            retencion_15_dias_backups.sh   borra de /trazaSystems/backups lo de > 15 días (find -mtime +15)
04:15            retencion_30_dias_bucket.sh    borra de /mnt/bucket/prod lo de > 30 días
04:30            sync_backups_bucket.sh         rsync -r /trazaSystems/backups/ → /mnt/bucket/prod
```

- Cada dump queda en `/trazaSystems/backups/{mysql,postgres}/<base>/AAAAMMDDHHMM-<base>.sql.gz`.
- Volumen: ≈0,7 GB por día (asp2tecn ≈257 MB, bonita ≈418 MB, trazalog_tools ≈40 MB, asp2sim ≈2,5 MB).
- **No hay política de "mover" al bucket**: el `rsync` **copia**. Lo local solo se borra por la regla de 15 días. Por eso quedaban ≈11 GB (≈16 días × 0,7 GB).
- El bucket conserva ≈30 días **contados desde la última subida** (ver hallazgo 3).
- El operador indicó haber reducido la retención local a 7 días el 2026-10-16. **Verificar** el valor real de `-mtime` en `retencion_15_dias_backups.sh` (para conservar exactamente 7 días corresponde `-mtime +6`).

## 5. Limpieza de logs

`/trazaSystems/cleanup_logs.sh`, cron diario 00:00:
1. Borra logs de **más de 30 días** de 7 carpetas `application/logs` de las apps PHP, tanto locales como sus copias en `/mnt/bucket/prod/logs/...`.
2. Si `/` supera el **85 %**, **mueve** al bucket los logs de más de 15 días de esas carpetas (según `/trazaSystems/.directorios.csv`).

**No cubre** logs de MySQL, PostgreSQL, Tomcat/Bonita ni `/var/log`. Solo hay además el `logrotate` diario estándar del sistema.

## 6. Monitoreo existente

### 6.1 Scripts propios (cron de root)

| Script | Frecuencia | Qué hace | Asunto del mail |
|---|---|---|---|
| `HD_space_status.py` | 10 min | Avisa si quedan **< 2048 MB libres en `/trazaSystems`** | `CRITICAL EVENT: Drive space` |
| `RAM_status.py` | 10 min | Avisa si la memoria libre (libre + caché) es **≤ 1024 MB** | `CRITICAL EVENT: RAM usage` |
| `Services_status.py` | 10 min | Busca `httpd`, `mysqld`, `postgres`, `tomcat`, `bonita` en `ps -ef` | `FATAL EVENT: Service is stopped` |
| `Internet_status.py` | 08, 16, 22 h | Debería chequear internet (ver hallazgo 7) | `INFO EVENT: Internet access is alive` |
| `CPU_usage_status.py` | **no está en el cron** | Umbral 90 % con `vmstat` | `CRITICAL EVENT: CPU overloaded` |

- Todos envían por SMTP SSL (`mauriper.ferozo.com:465`) desde `infra@trazalog.com`.
- Destinatarios: `HD_space_status.py` → `infra@`, `rnsanchez@`, `pmarrelli@`, `ramos@trazalog.com`. Los demás → solo `infra@trazalog.com`.
- Mandan **un mail cada 10 minutos mientras dure el problema** (no tienen memoria de estado).
- Copias saneadas (sin credenciales) en [`infra/baseline-10.142.0.2/`](../baseline-10.142.0.2/).

### 6.2 Alertas de Google Cloud
Ver [gcp-monitoreo-alertas-costos.md](gcp-monitoreo-alertas-costos.md). Este servidor tiene el **Ops Agent**, por eso queda cubierto por las políticas de disco y RAM al 80 %.

## 7. Otros crons

- Usuario `trazalog`: `* * * * * python2.7 /trazaSystems/test.py` (**cada minuto**, desde 2018; parece un resto de pruebas).
- `/etc/cron.d`: solo `0hourly`. `/etc/cron.daily`: `logrotate`, `man-db`, `0yum-daily`.
- Hay en `/trazaSystems` más scripts de backup **sin programar** (`mysql_backup_alm`, `_assetplanner`, `_aspstage`, `_sstrsegdenuncias`, `_usuarios`, y `postgres_backup_*` de otras bases).

## 8. Hallazgos y riesgos (ordenados por urgencia)

| # | Severidad | Hallazgo | Acción sugerida |
|---|---|---|---|
| 1 | **Alta** | Disco raíz al **91 %** y sin crecimiento controlado de las bases. La política de GCloud (80 %) ya debería estar alertando. | Confirmar que los mails de GCloud llegan a `infra@`/`rruiz@`; liberar espacio (ver §9). |
| 2 | **Alta** | Contraseñas en texto plano: SMTP de `infra@trazalog.com` en 5 scripts; contraseña de PostgreSQL en 4 scripts de backup; clave de cuenta de servicio en `/root/bucket/key.json`. | Rotarlas y moverlas a archivos `chmod 600` fuera del código. **Dos de ellas se expusieron en una sesión de trabajo el 2026-10-16: rotar.** |
| 3 | Media | `rsync -r` (sin `-t`/`-a`) **re-sube todo cada noche**: se verificó que los 96 archivos locales tenían fecha de hoy en el bucket. Además renueva la fecha, así que el bucket retiene ≈30 días desde la **última** subida. | Cambiar a `rsync -rt` (o `-a`) y revisar costos de operaciones del bucket. |
| 4 | Media | Dumps casi vacíos: `bonita_db` (296 B) y `bonita_bdm` (481 B) por día. | Verificar si esas bases están vacías o si el dump falla en silencio. |
| 5 | Media | Los scripts de backup usan `os.popen` sin comprobar el resultado: una falla no se detecta. `mysqldump` corre sin contraseña (depende de `~/.my.cnf`, no verificado). | Validar tamaño/éxito y alertar si falta el backup del día. |
| 6 | Media | Software fuera de soporte: CentOS 7 (06/2024), PostgreSQL 9.4 (02/2020) y 11 (11/2023), Bonita 7.7.0, PHP hasta 5.4 disponible en repos. 608 días sin reiniciar. | Plan de actualización/migración. |
| 7 | Baja | `Internet_status.py`: `if(is_connected):` nunca llama a la función, así que **manda el mail 3 veces por día sin comprobar nada**. (Hace de "latido" involuntario.) | Corregir (ver la versión nueva en `monitoring-10.142.0.16`). |
| 8 | Baja | `Services_status.py` repite el mail cada 10 min y busca por subcadena en `ps -ef`. | Usar la versión con anti-spam. |
| 9 | Baja | `HD_space_status.py` mide MB libres solo de `/trazaSystems`; destinatarios distintos que los de GCloud. | Unificar umbrales y destinatarios. |
| 10 | Baja | `CPU_usage_status.py` existe pero no corre; `trazalog` ejecuta `test.py` cada minuto. | Decidir si se activan/eliminan. |
| 11 | Info | Hay 16 archivos WAL borrados que siguen abiertos por procesos postgres. | Observar; no diagnosticado. |
| 12 | Info | PostgreSQL 9.4 pesa 12,6 GB (más que la 11). | Confirmar si sigue en uso; es la mayor oportunidad de espacio. |

## 9. Procedimientos para el operador

### 9.1 Ver el estado (solo lectura)
```bash
df -h /                                   # ocupación
sudo nice -n 19 ionice -c3 du -xk --max-depth=1 / | sort -rn | head      # qué ocupa (usar sudo; ver §3)
sudo ls -la /var/spool/cron/              # crontabs de root y trazalog
sudo cat /var/spool/cron/root
systemctl status google-cloud-ops-agent-opentelemetry-collector google-cloud-ops-agent-fluent-bit
```

### 9.2 Disco lleno o casi lleno
Orden recomendado (cada acción que borre o mueva requiere autorización del responsable):
1. Backups locales que ya estén en el bucket (verificar primero que existan allí: `ls /mnt/bucket/prod/mysql/<base>/`). Reducir la retención en `retencion_15_dias_backups.sh`.
2. Logs de `cleanup_logs.sh` / `/var/log`.
3. Revisar PostgreSQL 9.4 y `/var/cache/yum` (≈360 MB).
4. Archivos borrados que siguen abiertos: `sudo ls -l /proc/[0-9]*/fd 2>/dev/null | grep deleted`.

### 9.3 Verificar que el bucket está montado y recibe backups
```bash
mount | grep bucket                      # debe aparecer backup-trazalog (fuse.gcsfuse)
sudo ls /mnt/bucket/prod                 # logs  mysql  postgres  traz-tools
sudo find /mnt/bucket/prod -path '*postgres*' -type f -printf '%TY-%Tm-%Td\n' | sort | uniq -c | tail -3
```
Si no está montado: `sudo sh /root/bucket/mount_bucket.sh` (modifica el estado del sistema; autorizar).

### 9.4 Dónde llegan los avisos
- Scripts propios: asunto `CRITICAL EVENT: …` desde `infra@trazalog.com`.
- Google Cloud: ver [gcp-monitoreo-alertas-costos.md](gcp-monitoreo-alertas-costos.md).
