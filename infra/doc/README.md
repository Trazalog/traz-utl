# Documentación de infraestructura (Trazalog)

Documentos para el **operador de infraestructura**. Relevamiento hecho el **2026-10-16** con
comandos de solo lectura; ninguna credencial se transcribe en estos documentos.

| Documento | Para qué sirve |
|---|---|
| [prod-10.142.0.2-assetplanner.md](prod-10.142.0.2-assetplanner.md) | Cómo es el servidor de producción 10.142.0.2: software, discos, cron, backups, limpieza de logs, monitoreo, hallazgos y procedimientos |
| [prod-10.142.0.16-wso2-api-manager.md](prod-10.142.0.16-wso2-api-manager.md) | Cómo es el servidor WSO2 API Manager (10.142.0.16): instalación, estado de AM/MI/SI, logs, riesgos |
| [gcp-monitoreo-alertas-costos.md](gcp-monitoreo-alertas-costos.md) | Alertas actuales de Google Cloud, qué VMs tienen agente, cómo sumar una VM y cuánto cuesta |
| [instructivo-despliegue-monitoreo-10.142.0.16.md](instructivo-despliegue-monitoreo-10.142.0.16.md) | Paso a paso para instalar el monitoreo, las alertas (mail + Telegram) y la limpieza de logs en 10.142.0.16 |

Código relacionado:
- [`../baseline-10.142.0.2`](../baseline-10.142.0.2/) — scripts de producción de 10.142.0.2 (saneados, sin credenciales).
- [`../monitoring-10.142.0.16`](../monitoring-10.142.0.16/) — scripts para 10.142.0.16, derivados de los anteriores.

## Servidores conocidos (proyecto GCP `trazasuite-cloud`)

| IP | Instancia | Rol | SO | Agente GCP | Documento |
|---|---|---|---|---|---|
| 10.142.0.2 | `vm-production-assetplanner-inst1` | Apps PHP + MySQL + PostgreSQL + Bonita | CentOS 7.9 | Ops Agent 2.16.0 | [doc](prod-10.142.0.2-assetplanner.md) |
| 10.142.0.16 | `vm-pruebas-wso2` (**es producción**) | WSO2 API Manager / MI / SI | CentOS 7 | ninguno | [doc](prod-10.142.0.16-wso2-api-manager.md) |
| 10.142.0.4 | `ubuntu-remote-desktop-prod` | Escritorio remoto / administración | Ubuntu 20.04 | ninguno | solo mencionado (disco ≈92 %) |

## Reglas de trabajo en producción

1. Primero **solo consulta** (`df`, `du`, `ls`, `cat`, `systemctl status`…). Todo lo que borre, mueva, instale o reinicie requiere **autorización explícita** del responsable.
2. Los scripts que borran **simulan por defecto** y exigen `--apply`.
3. **Nunca** poner contraseñas en el código ni subirlas al repositorio: van en archivos `chmod 600` fuera del repo (`.gitignore` ya excluye `notify.conf` y `logs.conf`).
4. Al medir disco con `du`, usar `sudo`; sin root se omiten carpetas y se subestima.
