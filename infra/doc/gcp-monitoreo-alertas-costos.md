# Monitoreo en Google Cloud (proyecto `trazasuite-cloud`): alertas y costos

> Relevado el **2026-10-16**. Las políticas y canales se leyeron con
> `gcloud alpha monitoring policies list` / `channels list` (solo lectura) desde Cloud Shell.

## 1. Cómo funciona hoy

**Un agente en cada VM → métricas `agent.googleapis.com/*` → políticas de alerta → mail.**

### Políticas de alerta existentes (3)

| Política | Métrica | Condición | Alcance |
|---|---|---|---|
| `Alertas de disco` | `agent.googleapis.com/disk/percent_used` (state=used) | > 80 % | **Todas** las VMs (`gce_instance`) del proyecto |
| `Alertas de RAM` | `agent.googleapis.com/memory/percent_used` (state=used) | > 80 % | **Todas** las VMs del proyecto |
| `Alertas de CPU` | `agent.googleapis.com/cpu/utilization` (user) | > 80 % durante 5 min | **Solo una VM** (instance_id `4591617215669184435`) |

Detalles: alineación de 300 s (media), cierre automático a los 7 días (`autoClose 604800s`), notificación al abrirse el incidente.
Creadas en mayo de 2022 y modificadas por última vez el 21/06/2022.

> Consecuencia importante: como disco y RAM **no filtran por instancia**, cualquier VM que **tenga el agente instalado** queda cubierta automáticamente, sin crear políticas nuevas.
> Una VM **sin agente no reporta nada y por lo tanto no genera alertas**: eso fue lo que pasó con 10.142.0.16 cuando se llenó el disco.

### Canales de notificación (todos mail)

| Nombre | Dirección | Asignado a políticas |
|---|---|---|
| Infra | `infra@trazalog.com` | Sí (las 3) |
| `rruiz@trazalog.com` | `rruiz@trazalog.com` | Sí (las 3) |
| `ecastro@trazalog.com` | `ecastro@trazalog.com` | **No** |
| *(canal `…9474432`)* | — | Las 3 políticas lo referencian, pero **ya no existe** (borrado) |

No hay canal de Telegram ni de otro tipo. Cloud Monitoring no trae Telegram nativo (se podría lograr con un *webhook* o Pub/Sub + una función propia, con costo y mantenimiento adicionales).

### Asunto del mail
No se pudo verificar (los avisos van a las casillas de Trazalog, no a la cuenta que se usó para investigar). Por lo conocido: remitente de Google Cloud Alerting y asunto que empieza con `[ALERT]` seguido del nombre de la política (`Alertas de disco`, `Alertas de RAM`, `Alertas de CPU`). Para confirmarlo, buscar en la casilla de `infra@` por esas frases.

## 2. Qué VMs tienen agente (verificado)

| VM | Agente | Observación |
|---|---|---|
| 10.142.0.2 `vm-production-assetplanner-inst1` | **Ops Agent 2.16.0** (CentOS 7.9) | Funciona: servicios `google-cloud-ops-agent-*` activos hace meses. Configuración por defecto. |
| 10.142.0.16 `vm-pruebas-wso2` | **Ninguno** | Solo `google-guest-agent` y `google-osconfig-agent` (no envían métricas de disco/RAM). |
| 10.142.0.4 `ubuntu-remote-desktop-prod` | **Ninguno** | `google-osconfig-agent` únicamente. **Su disco está al ≈92 %** (24 GB, ≈1,9 GB libres) al 2026-10-16. |

Las VMs no se pudieron listar por API: la cuenta de servicio de la VM desde la que se investigó no tiene scopes de Compute/Monitoring. Para completar el inventario, ejecutar desde Cloud Shell:
```bash
gcloud compute instances list --project trazasuite-cloud \
  --format="table(name,zone.basename(),networkInterfaces[0].networkIP,status)"
gcloud alpha monitoring policies list --project trazasuite-cloud
gcloud alpha monitoring channels list --project trazasuite-cloud
```

## 3. Sumar una VM al sistema

Instalar el **Ops Agent** en la VM. La VM necesita los scopes `monitoring.write` y `logging.write` (10.142.0.16 y 10.142.0.2 ya los tienen).
Si el agente reporta, las políticas de disco y RAM la cubren; para CPU habría que crear una política (la actual es de una sola VM).

**Compatibilidad con CentOS 7:** la [documentación del Ops Agent](https://docs.cloud.google.com/stackdriver/docs/solutions/agents/ops-agent) ya **no lista CentOS/RHEL 7** como soportados (sí RHEL/Rocky 8–10, Debian 12–13, Ubuntu 22.04–26.04, SLES 12/15).
En la práctica, 10.142.0.2 lo corre en CentOS 7.9 con la versión 2.16.0, y el repositorio `google-cloud-ops-agent-el7-x86_64-all` seguía publicado al 2026-10-16 con versiones hasta ≈2.48. Es decir: **funciona pero sin respaldo oficial**; no se probaron versiones nuevas sobre CentOS 7.

**Decisión actual (2026-10-16):** para 10.142.0.16 se resolvió empezar con scripts propios (ver `infra/monitoring-10.142.0.16`), a la espera de observar el comportamiento en producción. Sumar el Ops Agent queda como paso posterior opcional.

## 4. Costos

Fuentes: [precios de Google Cloud Observability](https://cloud.google.com/products/observability/pricing) y [blog de costos de Cloud Monitoring](https://cloud.google.com/blog/products/management-tools/learn-to-understand-and-reduce-cloud-monitoring-costs/).

| Concepto | Costo |
|---|---|
| Métricas del **Ops Agent** | Se cobran por volumen ingerido: **US$ 0,258 por MiB** en el primer tramo, **150 MiB gratis por mes y por cuenta de facturación**. Sin cargo extra por retención. |
| Métricas propias de GCP (CPU de la VM, etc.) | No cobrables. **No incluyen disco ni memoria** (esas vienen del agente). |
| Logs (Ops Agent los envía por defecto: `/var/log/syslog`, `/var/log/messages`) | Primeros 50 GiB por proyecto y mes gratis (según la página de precios de Logging). |
| **Alertas** | Google anunció cobrar por política (por *metric reference* de cada condición y por puntos devueltos). **No se pudo confirmar el precio ni la fecha de inicio**: las fuentes dan fechas distintas (mayo/septiembre de 2026) y las páginas oficiales consultadas no traen la tarifa. Verificar en la página de precios y en los *ejemplos de alertas*. |
| Notificaciones por mail | Sin costo conocido (no verificado). |

**Estimación para sumar una VM:** una VM con unas 100 series cada 60 s envía ≈33 MiB/mes (cálculo propio; el volumen real depende de la cantidad de series). Si la cuenta ya consume menos de 150 MiB/mes en total, el costo adicional es **≈ US$ 0**; si ya excede el tramo gratuito, cada VM suma unos pocos dólares al mes. El consumo real se ve en la consola: *Monitoring → Metrics Diagnostics → Metric Data Ingested*.
Como las políticas de disco y RAM ya existen para todas las VMs, **agregar una VM no suma políticas nuevas** (sí suma puntos evaluados).

## 5. Recomendaciones

1. Confirmar que los mails de GCloud llegan (casillas `infra@` y `rruiz@`) y limpiar el canal inexistente de las 3 políticas.
2. Asignar el canal `ecastro@` o eliminarlo.
3. Evaluar bajar el umbral de disco en VMs con discos chicos (en 10.142.0.16, 80 % de 20 GB deja ≈4 GB).
4. Crear una política de CPU para todas las VMs (hoy cubre una sola).
5. Considerar Cloud Monitoring *uptime checks* o un canal Telegram vía webhook si se quiere unificar.
