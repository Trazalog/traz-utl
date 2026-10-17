# Producción 10.142.0.16 — WSO2 API Manager (`vm-pruebas-wso2`)

> Documento para el **operador de infraestructura**.
> Relevado el **2026-10-16** solo con comandos de lectura. No se modificó nada en el servidor.
>
> **Aviso de nombre:** la instancia se llama `vm-pruebas-wso2` ("pruebas") pero **es el servidor productivo** del API Manager de Trazalog.
> El nombre fue un error del administrador original y se decidió **dejarlo así**. No lo tome como un entorno de prueba.

## 1. Ficha rápida

| Ítem | Valor |
|---|---|
| Nombre de instancia / hostname | `vm-pruebas-wso2` |
| IP interna | 10.142.0.16 |
| Proyecto GCP | `trazasuite-cloud` |
| Tipo de máquina | `custom-1-8192-ext` → **1 vCPU, 8 GB de RAM** (7,6 GB visibles) |
| Sistema operativo | CentOS Linux 7 (kernel 3.10.0-1160.76.1.el7). **Fin de vida desde 30/06/2024** |
| Uptime al relevar | 91 días (último arranque: **16/07/2026 23:12**) |
| Disco | **Uno solo**: `/dev/sda2`, **20 GB**, montado en `/` (32 % usado, 14 GB libres). `/trazaSystems` **no** es un disco aparte |
| Python | **2.7.5 únicamente** (no hay `python3`). Sin `mail`/`mailx`/`sendmail`, sin `bzip2`, sin `logrotate` en el PATH |
| Correo local | `postfix` activo, escuchando solo en `127.0.0.1:25` (no es confiable para salir a internet desde GCP) |
| Agente GCP de monitoreo | **Ninguno** (solo `google-guest-agent` y `google-osconfig-agent`) |
| Permisos de la VM (scopes) | `monitoring.write`, `logging.write`, `pubsub`, `devstorage.read_only`, `trace.append`, `servicecontrol` |
| Acceso | SSH con usuario personal (grupo `google-sudoers`, sudo sin contraseña) |
| Cron | `crond` activo. **Sin crontabs de usuario**; `/etc/cron.d` solo tiene `0hourly`. Hay `logrotate` diario del sistema pero **sin reglas para WSO2** |

### Conectividad saliente verificada (TCP)
`smtp.gmail.com:587` ✔ · `mauriper.ferozo.com:465` ✔ · `api.telegram.org:443` ✔
Es decir, desde este servidor se puede enviar mail por SMTP externo y avisar por Telegram.

## 2. Qué hay instalado (`/trazaSystems`, ≈3 GB)

| Carpeta | Tamaño aprox. | Contenido |
|---|---|---|
| `wso2am-4.1.0` | 1,1 GB | WSO2 **API Manager** 4.1.0 |
| `wso2mi-4.1.0` | 0,6 GB | WSO2 **Micro Integrator** 4.1.0 |
| `wso2mi-dashboard-4.1.0` | 67 MB | Dashboard de Micro Integrator |
| `wso2si-4.1.0` | 0,3 GB | WSO2 **Streaming Integrator** 4.1.0 |
| `medios` | 0,75 GB | Archivos varios (no analizado) |
| `git` | 0,35 GB | Clones locales, entre ellos `traz-utl` y `traz-int` |
| `ssl` | 12 KB | Certificados/llaves (no se leyeron) |

Los productos WSO2 **no están registrados como servicios de systemd** (no hay unidades `wso2*`): se inician a mano o por algún script. El SI se vio ejecutándose como `root` con `carbon.sh`.

## 3. Estado de los servicios al relevar (importante)

| Producto | ¿En ejecución? | Evidencia |
|---|---|---|
| WSO2 SI | **Sí**. Proceso `java` (heap `-Xms256m -Xmx1024m`) levantado el 16/10/2026 ≈12:30 | `ps`, puertos 7070, 7443, 7611, 7711, 9090, 9493, 9691 y 9791 escuchando |
| WSO2 AM | **No** (indicios fuertes) | Sin proceso; sin puerto 9443/8243/8280; su último log se escribió el **16/07/2026 21:53**, antes del reinicio del equipo (16/07 23:12) |
| WSO2 MI | **No** (indicios fuertes) | Sin proceso; último log el **16/07/2026 20:24** |

> **Hay que confirmar con el equipo si AM y MI deben estar levantados.** Si es así, llevan ≈3 meses caídos tras el último reinicio y los scripts de monitoreo del instructivo los traen **desactivados** para no generar una alerta permanente hasta decidir.
> Cuando se levanten, quedan sin registro de arranque automático: tras otro reinicio del equipo volverán a quedar caídos (considerar unidades systemd).

## 4. Logs

| Producto | Directorio de logs | Tamaño | Archivos | Más antiguo |
|---|---|---|---|---|
| AM | `/trazaSystems/wso2am-4.1.0/repository/logs` | 420 MB | 1.180 | 2024-03 |
| MI | `/trazaSystems/wso2mi-4.1.0/repository/logs` | 382 MB | 2.623 | 2022-09 |
| MI Dashboard | `/trazaSystems/wso2mi-dashboard-4.1.0/logs` | 0,3 MB | 16 | — |
| SI | `/trazaSystems/wso2si-4.1.0/wso2/server/logs` | 58 MB | 4 | 2022-03 |

- **AM y MI rotan solos** (log4j2: `wso2carbon-MM-dd-yyyy-N.log`, `http_access_*`, `wso2-apigw-*`, `wso2-mi-api-*`, `audit-*`). Crecen poco: AM 5–15 MB/mes, MI 9–28 MB/mes. **No son el problema.**
- **SI NO rota**: escribe todo en un único `carbon.log` que crece sin límite. **Esa fue la causa de que se llenara el disco.** Tras vaciarlo el 16/10/2026, `carbon.log` crece ≈1 MB/hora (≈24 MB/día).
- Hay dos **heap dumps** (volcados por falta de memoria, `OutOfMemoryError`): AM `heap-dump.hprof` 364 MB (22/05/2024) y SI `heap-dump.hprof` 57 MB (24/08/2023). Son diagnósticos de caídas antiguas.

## 5. Monitoreo

**Hasta el 16/10/2026: ninguno.** No hay agente de Google, ni scripts, ni crons. Por eso nadie fue avisado cuando se llenó el disco.

A partir del instructivo [instructivo-despliegue-monitoreo-10.142.0.16.md](instructivo-despliegue-monitoreo-10.142.0.16.md), el servidor tendrá:

| Script | Frecuencia | Avisa cuando… |
|---|---|---|
| `HD_space_status.py` | 5 min | Disco ≥ 80 % (WARNING) o ≥ 90 % / < 2 GB libres (CRITICAL) |
| `RAM_status.py` | 5 min | Memoria disponible ≤ 2 GB (WARNING) o ≤ 1 GB (CRITICAL) |
| `CPU_usage_status.py` | 5 min | CPU ≥ 80 % / 90 % durante 3 corridas seguidas |
| `Services_status.py` | 5 min | Un servicio listado (hoy WSO2 SI) no está en ejecución |
| `Logs_size_status.py` | 30 min | Un directorio de logs supera 1 GB (WARNING) / 3 GB (CRITICAL) |
| `Internet_status.py` | 08, 16, 22 h | Es el "latido": mail/Telegram de "estoy vivo" con resumen del equipo |
| `cleanup_logs.sh` | diario 02:30 | Borra logs > 90 días, comprime meses anteriores, rota el `carbon.log` de SI cuando supera 100 MB |

Los avisos salen **por mail y por Telegram**, con anti-spam (avisa al empezar, repite cada 4 h si es CRITICAL y cada 24 h si es WARNING, y avisa cuando se resuelve).

## 6. Riesgos y observaciones

| # | Severidad | Observación |
|---|---|---|
| 1 | **Alta** | Disco único de 20 GB compartido por sistema y datos: cualquier log descontrolado puede dejarlo fuera de servicio. |
| 2 | **Alta** | AM y MI aparentan estar caídos desde el último reinicio (16/07/2026). Confirmar si es lo esperado. |
| 3 | Alta | CentOS 7 sin soporte; Python 2.7 sin soporte. |
| 4 | Media | Sin arranque automático de WSO2 tras reinicio (sin unidades systemd). |
| 5 | Media | SI sin rotación de `carbon.log`. Solución de fondo: configurar `log4j2` de SI con `RollingFile` (tamaño/fecha). El script de limpieza es un parche operativo mientras tanto. |
| 6 | Media | El nombre `vm-pruebas-wso2` puede inducir a error a quien opere el servidor (decisión: no cambiarlo). |
| 7 | Info | 1 vCPU: los picos de CPU cortos son normales; por eso la alerta de CPU exige 3 corridas seguidas. |

## 7. Procedimiento de emergencia: disco lleno por logs (resumen)

1. Identificar (solo lectura): `df -h /` y `sudo du -xk --max-depth=2 /trazaSystems | sort -rn | head`.
2. Casi siempre será `wso2si-4.1.0/wso2/server/logs/carbon.log`. Mientras SI esté corriendo, **no borrar** el archivo (el espacio no se libera): **vaciarlo** (`sudo sh -c ': > /trazaSystems/wso2si-4.1.0/wso2/server/logs/carbon.log'`). *Acción que modifica: requiere autorización del responsable.* Conviene guardar antes una copia comprimida si hay que investigar.
3. Con el monitoreo instalado, `cleanup_logs.sh` hace esa rotación automáticamente cuando el log pasa los 100 MB.
