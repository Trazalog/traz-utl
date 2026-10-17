# Monitoreo y limpieza de logs — 10.142.0.16 (WSO2 API Manager)

Basado en los scripts de producción de 10.142.0.2 (carpeta [`../baseline-10.142.0.2`](../baseline-10.142.0.2/)),
manteniendo sus nombres, asuntos y estilo, y agregando:

- **Telegram** además del mail.
- **Credenciales fuera del código** (`/trazaSystems/infra/conf/notify.conf`, permiso 600; excluir `conf/` de los backups de `/trazaSystems`).
- Todo instalado bajo `/trazaSystems/infra/` (`bin conf state log`), igual que en 10.142.0.2.
- **Anti-spam**: avisa al empezar, repite cada 4 h (CRITICAL) / 24 h (WARNING) y avisa cuando se **resuelve**.
- Umbrales por **porcentaje** (WARNING/CRITICAL) además de MB libres.
- `Logs_size_status.py` (nuevo): vigila el tamaño de los directorios de logs.
- `cleanup_logs.sh`: borra logs > 90 días, comprime meses anteriores y rota el `carbon.log` de SI (la causa del incidente).
- Modos `--check` y `--dry-run` para probar sin avisar a nadie.
- Compatible con **Python 2.7** (el único que hay en el servidor) y 3.x; solo biblioteca estándar.

```
bin/   trz_notify.py  HD_space_status.py  RAM_status.py  CPU_usage_status.py
       Services_status.py  Logs_size_status.py  Internet_status.py  cleanup_logs.sh
conf/  notify.conf.example  logs.conf.example      (copiar y completar; no subir los reales)
cron/  trazalog-infra.cron                         (a /etc/cron.d/trazalog-infra)
```

**Cómo desplegarlo:** [`../doc/instructivo-despliegue-monitoreo-10.142.0.16.md`](../doc/instructivo-despliegue-monitoreo-10.142.0.16.md)
**Cómo es el servidor:** [`../doc/prod-10.142.0.16-wso2-api-manager.md`](../doc/prod-10.142.0.16-wso2-api-manager.md)

Pruebas locales rápidas (no avisan a nadie):
```bash
./bin/HD_space_status.py --config conf/notify.conf --check
./bin/HD_space_status.py --config conf/notify.conf --dry-run
./bin/cleanup_logs.sh --config conf/logs.conf          # simulación; --apply para ejecutar
```
