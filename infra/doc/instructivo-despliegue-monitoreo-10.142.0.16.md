# Instructivo: desplegar el monitoreo y la limpieza de logs en 10.142.0.16

Destinatario: operador de infraestructura con acceso SSH y `sudo` al servidor.
Tiempo estimado: 30–45 minutos. **No requiere reiniciar nada ni detener WSO2.**

Qué se instala (todo bajo **`/trazaSystems/infra/`**, igual que en producción 10.142.0.2, más un archivo en `/etc/cron.d`):

```
/trazaSystems/infra/bin/     scripts
/trazaSystems/infra/conf/    notify.conf, logs.conf  (carpeta 700, archivos 600; contiene credenciales)
/trazaSystems/infra/state/   estado de las alertas (anti-spam)
/trazaSystems/infra/log/     logs de los propios scripts
```


| Pieza | Función |
|---|---|
| `HD_space_status.py`, `RAM_status.py`, `CPU_usage_status.py`, `Services_status.py`, `Logs_size_status.py`, `Internet_status.py` | Chequeos (la misma familia de scripts de 10.142.0.2) |
| `trz_notify.py` | Envío por **mail y Telegram**, anti-spam y estado |
| `cleanup_logs.sh` | Borra logs > 90 días, comprime los de meses anteriores, rota el log activo de SI |
| `notify.conf`, `logs.conf` | Configuración (credenciales y umbrales) |
| `/etc/cron.d/trazalog-infra` | Programación |

> **Reglas de seguridad de este instructivo**
> - Los scripts de monitoreo **solo leen** el sistema. Solo escriben su estado y su log.
> - `cleanup_logs.sh` **simula por defecto**. Recién borra/comprime con `--apply`, y solo después de que usted revise la simulación.
> - Las credenciales viven **solo** en `/trazaSystems/infra/conf/notify.conf` (permiso 600). Nunca en el repositorio.

---

## 0. Antes de empezar (checklist)

- [ ] Tiene SSH y `sudo` en 10.142.0.16 (`ssh <usuario>@10.142.0.16` y `sudo -v`).
- [ ] Conoce la contraseña SMTP de `infra@trazalog.com` (o de la cuenta que usará para enviar). **Use la contraseña rotada**; la anterior estuvo expuesta.
- [ ] Tiene (o va a crear en el paso 1) un bot de Telegram y un chat/grupo destino.
- [ ] Decidió quiénes reciben los mails (`to =` en `notify.conf`).
- [ ] Leyó [prod-10.142.0.16-wso2-api-manager.md](prod-10.142.0.16-wso2-api-manager.md), en especial el **estado de AM y MI** (§3).

Verificación rápida del servidor (debe dar Python 2.7 y `cron` activo):
```bash
python --version        # Python 2.7.5
systemctl is-active crond
df -h /
```

---

## 1. Preparar Telegram (una sola vez, desde cualquier equipo)

1. En Telegram abrir **@BotFather** → `/newbot` → elegir nombre y usuario (termina en `bot`). Anotar el **token** (`123456:ABC…`). Es una credencial: no la pegue en chats ni en el repositorio.
2. Crear un **grupo** (p. ej. "Infra Alertas Trazalog"), agregar al bot y escribir un mensaje cualquiera en el grupo.
3. Obtener el `chat_id` (los grupos tienen número **negativo**):
   ```bash
   curl -s "https://api.telegram.org/bot<TOKEN>/getUpdates"
   ```
   Buscar `"chat":{"id":-100…}`. Si la respuesta está vacía, vuelva a escribir en el grupo y repita.
4. Anotar `bot_token` y `chat_id` para el paso 4.

---

## 2. Llevar los scripts al servidor

Los scripts están en el repositorio `Trazalog/traz-utl`, carpeta `infra/monitoring-10.142.0.16`.

**Opción A – desde su equipo (recomendada):**
```bash
git clone https://github.com/Trazalog/traz-utl      # o git pull si ya lo tiene
cd traz-utl/infra
tar czf /tmp/trz-monitoring.tgz monitoring-10.142.0.16
scp /tmp/trz-monitoring.tgz <usuario>@10.142.0.16:/tmp/
ssh <usuario>@10.142.0.16
mkdir -p /tmp/trz-deploy && tar xzf /tmp/trz-monitoring.tgz -C /tmp/trz-deploy
cd /tmp/trz-deploy/monitoring-10.142.0.16
```

**Opción B – desde el propio servidor** (ya existe un clon en `/trazaSystems/git/traz-utl`):
```bash
cd /trazaSystems/git/traz-utl && git pull
cd infra/monitoring-10.142.0.16
```

---

## 3. Instalar archivos y carpetas

```bash
sudo install -d -m 755 /trazaSystems/infra/bin
sudo install -d -m 700 /trazaSystems/infra/conf
sudo install -d -m 755 /trazaSystems/infra/state
sudo install -d -m 755 /trazaSystems/infra/log

sudo install -m 755 bin/*.py bin/cleanup_logs.sh /trazaSystems/infra/bin/
ls -l /trazaSystems/infra/bin/
```
Debe listar 8 archivos: `trz_notify.py` (módulo común), los 6 chequeos `*_status.py` y `cleanup_logs.sh`.

---

## 4. Configurar credenciales y umbrales

```bash
sudo cp conf/notify.conf.example /trazaSystems/infra/conf/notify.conf
sudo chown root:root /trazaSystems/infra/conf/notify.conf
sudo chmod 600 /trazaSystems/infra/conf/notify.conf
sudo vi /trazaSystems/infra/conf/notify.conf
```

Completar como mínimo:

| Sección | Campo | Valor |
|---|---|---|
| `[email]` | `smtp_password` | contraseña SMTP (rotada) de `infra@trazalog.com` |
| `[email]` | `to` | destinatarios, separados por coma |
| `[telegram]` | `bot_token`, `chat_id` | del paso 1 |

Revisar el resto (ya vienen valores pensados para este servidor de 20 GB / 1 vCPU / 8 GB):
- `[disk]`: 80 % WARNING, 90 % CRITICAL, y CRITICAL si quedan < 2048 MB.
- `[services]`: solo `wso2si`. **AM y MI vienen comentados** (ver estado en la documentación del servidor). Si el equipo confirma que deben estar levantados, descomentar sus líneas.
- Si no quiere uno de los canales, ponga `enabled = no` en su sección.
- Un valor no puede contener ` #` (se tomaría como comentario).

---

## 5. Probar los canales (debe llegar mail Y Telegram)

```bash
sudo /trazaSystems/infra/bin/trz_notify.py --test
echo "codigo de salida: $?"
```
- Código `0` y llegan **ambos** mensajes ("INFO EVENT: test message …").
- Código `4`: falló algún canal; el error sale en pantalla y en `/trazaSystems/infra/log/notify.log`. Causas típicas: contraseña SMTP incorrecta, `chat_id` equivocado, el bot no está en el grupo.

No continúe hasta que ambos canales funcionen.

---

## 6. Probar cada chequeo (solo lectura, no avisa)

```bash
for s in HD_space_status RAM_status CPU_usage_status Services_status Logs_size_status Internet_status; do
  echo "== $s"; sudo /trazaSystems/infra/bin/$s.py --check; echo "   salida=$?"
done
```
Resultado esperado hoy (ejemplo): disco ≈32 % OK, RAM OK, CPU OK, `wso2si` en ejecución, directorios de logs OK, internet alive.
Códigos de salida de `--check`: `0` OK, `1` WARNING, `2` CRITICAL, `3` error de configuración.

Prueba de un aviso real **sin tocar el servidor** (usa una configuración temporal con umbrales exagerados y su propio estado):
```bash
sudo cp /trazaSystems/infra/conf/notify.conf /tmp/notify-test.conf
sudo sed -i 's#^state_dir.*#state_dir = /tmp/trz-test-state#; s#^warn_pct *= *80#warn_pct = 1#' /tmp/notify-test.conf
sudo /trazaSystems/infra/bin/HD_space_status.py --config /tmp/notify-test.conf
```
Deben llegar por mail y Telegram un `WARNING EVENT: Drive space - WSO2 API Manager PROD (10.142.0.16)`. Ejecutarlo de nuevo **no** debe mandar otro (anti-spam). Luego limpiar:
```bash
sudo rm -rf /tmp/notify-test.conf /tmp/trz-test-state
```
(`--dry-run` en cualquier script muestra el aviso que mandaría sin enviarlo.)

---

## 7. Activar el monitoreo (cron)

```bash
sudo install -m 644 cron/trazalog-infra.cron /etc/cron.d/trazalog-infra
sudo cat /etc/cron.d/trazalog-infra
```
`crond` toma `/etc/cron.d` automáticamente; no hace falta reiniciarlo. Verificar a los 5–10 minutos:
```bash
sudo tail -n 20 /var/log/cron | grep trazalog          # se ven las ejecuciones
sudo ls -l /trazaSystems/infra/state/               # aparecen archivos de estado
sudo tail /trazaSystems/infra/log/notify.log            # solo registra envíos o errores
```
Programación instalada:

| Cuándo | Qué |
|---|---|
| cada 5 min | disco, RAM, CPU, servicios |
| cada 30 min | tamaño de logs |
| 08:00, 16:00, 22:00 | latido `Internet_status.py` (mail/Telegram "estoy vivo") |
| 02:30 (**comentado**) | `cleanup_logs.sh --apply` — se activa en el paso 9 |

**Importante:** si dejan de llegar los latidos de las 08/16/22 h, el servidor o el cron tienen un problema.

---

## 8. Limpieza de logs: primero SIMULAR

```bash
sudo cp conf/logs.conf.example /trazaSystems/infra/conf/logs.conf
sudo chmod 600 /trazaSystems/infra/conf/logs.conf
sudo /trazaSystems/infra/bin/cleanup_logs.sh                 # SIN --apply = simulación
```
Lea la salida completa (también queda en `/trazaSystems/infra/log/logs_maintenance.log`). Cada línea `[dry]` es algo que **haría**.

Qué se espera de la primera simulación (estimado al 2026-10-16, política 90 días):

| Directorio | Borraría | Comentario |
|---|---|---|
| `wso2am-4.1.0/repository/logs` | ≈1.178 archivos, ≈417 MB | Casi todo: **AM no escribe logs desde el 16/07/2026**, por eso todo supera los 90 días. Incluye el `heap-dump.hprof` de 364 MB (2024). |
| `wso2mi-4.1.0/repository/logs` | ≈2.621 archivos, ≈377 MB | Idem para MI. |
| `wso2mi-dashboard-4.1.0/logs` | 16 archivos, <1 MB | |
| `wso2si-4.1.0/wso2/server/logs` | 2 archivos, ≈55 MB | El `heap-dump.hprof` de 2023. El `carbon.log` activo **no** se borra. |

> **Decisión que debe tomar usted antes de aplicar:** la primera pasada eliminará prácticamente **todo el histórico de AM y MI** (≈800 MB) porque están detenidos hace más de 90 días. Si ese histórico o los heap dumps le sirven para alguna investigación, cópielos antes (`scp`) o quite `"*.hprof"` / `"*.hprof.gz"` de `DELETE_PATTERNS` en `logs.conf`. Liberar ≈0,8 GB no es urgente con 14 GB libres.

Qué debe verificar en la simulación:
- Que **no** aparezcan rutas fuera de los 4 directorios de logs.
- Que el `carbon.log` de SI figure como `rotaria` solo cuando supere 100 MB (hoy ≈2,5 MB: no aparece).
- Que los archivos "abiertos" se omitan (`(abierto, no se borra)`).

Salvaguardas incluidas: nunca toca archivos abiertos por algún proceso, solo trabaja dentro de `/trazaSystems`, solo en los 4 directorios listados (sin recursión), solo con las extensiones configuradas, se niega a borrar más de `MAX_DELETE_FILES` (10.000) por directorio y evita ejecuciones simultáneas.

---

## 9. Aplicar la limpieza y programarla

Solo si la simulación fue correcta y tomó la decisión del paso 8:
```bash
sudo /trazaSystems/infra/bin/cleanup_logs.sh --apply
df -h /
```
Revise el resumen (borrados, comprimidos, rotados, errores). Si borró o liberó ≥ 50 MB, o hubo errores, **también llega por mail y Telegram**.

Luego programar (quitar el `#` de la última línea):
```bash
sudo vi /etc/cron.d/trazalog-infra
#   30 2 * * * root nice -n 19 ionice -c3 /trazaSystems/infra/bin/cleanup_logs.sh --apply
```

Qué hará todos los días a las 02:30 (configurable en `logs.conf`):
1. **Borra** logs de **más de 90 días** (3 meses).
2. **Comprime con gzip** los logs de **meses anteriores al actual** (conserva la fecha original del archivo, así la regla de 90 días sigue valiendo).
3. **Rota** el `carbon.log` activo de SI cuando supera **100 MB** (guarda una copia `.gz` y lo vacía). Es la protección contra la causa del incidente original.

Los logs del mes en curso no se comprimen ni se borran.

---

## 10. Pruebas de aceptación

| Prueba | Resultado esperado |
|---|---|
| `trz_notify.py --test` | Llega mail **y** Telegram |
| Paso 6 (umbral exagerado) | Llega el WARNING; repetirlo no manda otro |
| Latido de las 08/16/22 h | Llega `INFO EVENT: Internet access is alive` |
| `ls /trazaSystems/infra/state/` | Archivos de estado actualizándose |
| `tail /var/log/cron` | Se ven las ejecuciones cada 5 min |
| Primer ciclo de `cleanup_logs.sh --apply` | Resumen en el log; aviso si liberó ≥ 50 MB |

---

## 11. Operación diaria

| Necesidad | Cómo |
|---|---|
| Ver el estado ahora | `sudo /trazaSystems/infra/bin/HD_space_status.py --check` (idem otros) |
| Ver qué avisó | `sudo tail -n 50 /trazaSystems/infra/log/notify.log` |
| Cambiar un umbral | Editar `/trazaSystems/infra/conf/notify.conf` (se aplica en la próxima corrida; no hay que reiniciar nada) |
| Silenciar temporalmente | Comentar la línea del script en `/etc/cron.d/trazalog-infra` |
| Agregar un servicio a vigilar | Sección `[services]`: `nombre = texto_de_la_linea_de_comando [| puerto]` |
| Cambiar destinatarios | `to =` en `[email]` |
| Rotar la contraseña SMTP | Editar `smtp_password` y correr `trz_notify.py --test` |
| Vigilar AM / MI | Descomentar sus líneas en `[services]` cuando estén levantados |

### Qué significa cada aviso
- `WARNING EVENT: …` → atender pronto. `CRITICAL EVENT: …` → atender ya.
- `INFO EVENT: … - RESOLVED` → el problema se resolvió solo o fue corregido.
- Los CRITICAL se repiten cada 4 h y los WARNING cada 24 h mientras sigan igual.
- El asunto siempre incluye el nombre del servidor: `… - WSO2 API Manager PROD (10.142.0.16)`.

---

## 12. Marcha atrás (desinstalar)

```bash
sudo rm -f /etc/cron.d/trazalog-infra                  # detiene todo
sudo rm -rf /trazaSystems/infra/bin /trazaSystems/infra/state
# Opcional: conservar credenciales/logs o borrarlos
sudo rm -rf /trazaSystems/infra/conf /trazaSystems/infra/log
# Si ya no queda nada: sudo rmdir /trazaSystems/infra
```
`cleanup_logs.sh` ya habrá borrado/comprimido lo que se aplicó: esos cambios **no** se revierten (por eso se simula antes).

---

## 13. Problemas frecuentes

| Síntoma | Causa probable | Qué hacer |
|---|---|---|
| `--test` da 4 y el mail falla con `Authentication` | Contraseña SMTP incorrecta/rotada | Corregir `smtp_password` |
| `--test` da 4 y Telegram `401 Unauthorized` | Token inválido | Revisar `bot_token` (sin la palabra `bot` delante) |
| Telegram `400 Bad Request: chat not found` | `chat_id` mal o el bot no está en el grupo | Repetir paso 1, punto 3 |
| No llegan mails pero hay "OK aviso enviado" en el log | Spam / filtros del destinatario | Revisar spam y reglas |
| `ERROR de configuración` (salida 3) | Falta `notify.conf` o valor no numérico | Comparar con `notify.conf.example` |
| Alerta permanente "Service is stopped" de `wso2am`/`wso2mi` | Descomentó el servicio y está caído | Levantar el producto o volver a comentarlo |
| `cleanup_logs.sh: --apply requiere root` | Se ejecutó sin `sudo` | Usar `sudo` |
| Nada en `/var/log/cron` | `crond` detenido | `systemctl status crond` |

## 14. Limitaciones conocidas

- Si el servidor **se apaga por completo**, no hay quién avise (los scripts viven en él). El latido de las 08/16/22 h es la señal: si deja de llegar, investigar. Para cubrir esto se puede sumar más adelante el agente de Google Cloud o un chequeo externo (ver [gcp-monitoreo-alertas-costos.md](gcp-monitoreo-alertas-costos.md)).
- Si el servidor no tiene salida a internet, no pueden salir ni mails ni Telegram (el estado queda "pendiente" y se reintenta en la próxima corrida).
- La rotación del `carbon.log` activo es "copytruncate": en el instante de la copia puede perderse alguna línea. La solución de fondo es configurar la rotación en `log4j2` de WSO2 SI.
- El estado de la instalación no fue probado en el servidor real: las pruebas se hicieron en un entorno de laboratorio con Python 3 y se validó la **sintaxis** bajo Python 2.7.5 del propio servidor. Siga el orden de los pasos 5 y 6 antes de activar el cron.

---

## Apéndice: por qué todo está en `/trazaSystems/infra`

Se eligió esta ubicación (y no `/opt`, `/etc`, `/var`) para ser consistente con 10.142.0.2 y tener todo en un solo lugar. Consecuencias a tener en cuenta:

- **`conf/` contiene credenciales** (SMTP, token de Telegram). Mantenerla en 700/600 y **excluirla de cualquier backup, copia o compresión de `/trazaSystems`** que se suba al bucket o salga del servidor.
- `cleanup_logs.sh` **se niega a trabajar** dentro de `/trazaSystems/infra` (ni su estado ni sus logs se pueden borrar/comprimir por error).
- Si se reinstala o restaura `/trazaSystems`, hay que volver a copiar `infra/` (o conservarlo aparte).
- Los logs de los propios scripts (`log/`) son chicos; si crecen, `Logs_size_status.py` puede vigilarlos agregando la carpeta a `[logdirs]`.
