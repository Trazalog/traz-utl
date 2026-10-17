#!/bin/bash
#
# cleanup_logs.sh - Mantenimiento de logs de WSO2 (10.142.0.16)
#   Evolucion de /trazaSystems/cleanup_logs.sh de 10.142.0.2 (misma idea: lista de
#   directorios + dias de retencion + find), pero con las politicas pedidas para
#   este servidor y con salvaguardas. Ver infra/doc/.
#
# Politica (configurable en logs.conf):
#   1. BORRAR   logs con mas de RETENTION_DAYS dias (por defecto 90 = 3 meses).
#   2. COMPRIMIR (gzip) los logs de meses ANTERIORES al actual. Los del mes en
#      curso no se tocan.
#   3. (Opcional, por directorio) ROTAR un log ACTIVO que supera N MB:
#      copia comprimida + vaciado del original ("copytruncate"). Pensado para
#      el carbon.log de WSO2 SI, que no rota solo y fue lo que lleno el disco.
#
# SEGURIDAD
#   * Por defecto SIMULA (dry-run): lista lo que haria, no toca nada.
#     Para ejecutar de verdad hay que pasar --apply.
#   * Nunca comprime ni borra un archivo que este abierto por algun proceso
#     (se consulta /proc/*/fd), asi no se pierde el log vivo de un servicio.
#   * Solo trabaja DENTRO de ALLOWED_ROOT y solo en los directorios de LOG_DIRS
#     (sin recursion), solo sobre los patrones listados.
#   * Si la cantidad de archivos a borrar supera MAX_DELETE_FILES, aborta.
#   * Un lock evita dos corridas simultaneas.
#
# Uso:
#   cleanup_logs.sh [--config /trazaSystems/infra/conf/logs.conf] [--apply]
#
# Recomendado en cron:  nice -n 19 ionice -c3 cleanup_logs.sh --apply

set -u
export LC_ALL=C

CONFIG="/trazaSystems/infra/conf/logs.conf"
APPLY=0

while [ $# -gt 0 ]; do
    case "$1" in
        --config) CONFIG="${2:-}"; shift 2 ;;
        --apply)  APPLY=1; shift ;;
        -h|--help) sed -n '2,30p' "$0"; exit 0 ;;
        *) echo "Opcion desconocida: $1" >&2; exit 3 ;;
    esac
done

[ -r "$CONFIG" ] || { echo "ERROR: no puedo leer la configuracion $CONFIG" >&2; exit 3; }

# --- valores por defecto (el .conf los puede pisar) ---
RETENTION_DAYS=90
COMPRESS_PATTERNS=("*.log" "*.out")
DELETE_PATTERNS=("*.log" "*.log.gz" "*.out" "*.out.gz" "*.hprof" "*.hprof.gz")
MAX_DELETE_FILES=10000
ALLOWED_ROOT="/trazaSystems"
INFRA_DIR="/trazaSystems/infra"   # nunca se toca (estado, config y logs de estos scripts)
LOG_DIRS=()
LOG_FILE="/trazaSystems/infra/log/logs_maintenance.log"
LOCK_FILE="/var/lock/trz_logs_maintenance.lock"
NOTIFY="yes"
NOTIFY_MIN_MB=50
NOTIFY_BIN="/trazaSystems/infra/bin/trz_notify.py"
NOTIFY_CONF="/trazaSystems/infra/conf/notify.conf"
SERVER_NAME="$(hostname)"

# shellcheck disable=SC1090
. "$CONFIG"

# --- validaciones basicas ---
case "$RETENTION_DAYS" in ''|*[!0-9]*) echo "ERROR: RETENTION_DAYS invalido" >&2; exit 3 ;; esac
[ "$RETENTION_DAYS" -ge 7 ] || { echo "ERROR: RETENTION_DAYS < 7 no esta permitido" >&2; exit 3; }
[ "${#LOG_DIRS[@]}" -gt 0 ] || { echo "ERROR: LOG_DIRS vacio en $CONFIG" >&2; exit 3; }

if [ "$(id -u)" -ne 0 ] && [ "$APPLY" -eq 1 ] && [ "${TRZ_ALLOW_NONROOT:-0}" != "1" ]; then
    echo "ERROR: --apply requiere root (para detectar archivos abiertos de todos los procesos)." >&2
    exit 3
fi

MODE="SIMULACION (dry-run)"
[ "$APPLY" -eq 1 ] && MODE="APLICANDO"

# --- logging ---
LOG_OK=1
mkdir -p "$(dirname "$LOG_FILE")" 2>/dev/null
touch "$LOG_FILE" 2>/dev/null || LOG_OK=0
log() {
    local line
    line="$(date '+%F %T') $*"
    echo "$line"
    [ "$LOG_OK" -eq 1 ] && echo "$line" >> "$LOG_FILE"
}

# --- lock ---
if ! exec 9>"$LOCK_FILE" 2>/dev/null; then
    if [ "$APPLY" -eq 1 ]; then
        echo "ERROR: no puedo crear el lock $LOCK_FILE" >&2; exit 3
    fi
else
    flock -n 9 || { echo "Ya hay otra corrida en curso, salgo."; exit 0; }
fi

# --- archivos abiertos (una sola vez) ---
OPEN_LIST="$(mktemp)"
trap 'rm -f "$OPEN_LIST"' EXIT
find /proc/[0-9]*/fd -maxdepth 1 -type l -printf '%l\n' 2>/dev/null | sed 's/ (deleted)$//' | sort -u > "$OPEN_LIST"
is_open() { grep -qxF -- "$1" "$OPEN_LIST"; }

# --- contadores ---
DEL_N=0; DEL_BYTES=0
CMP_N=0; CMP_SAVED=0
ROT_N=0; ROT_BYTES=0
SKIP_OPEN=0
ERRORS=0
MONTH_START="$(date +%Y-%m-01)"

fsize() { stat -c %s -- "$1" 2>/dev/null || echo 0; }

log "=== cleanup_logs | $MODE | retencion=${RETENTION_DAYS}d | comprimir anteriores a $MONTH_START ==="

for entry in "${LOG_DIRS[@]}"; do
    dir="${entry%%|*}"
    rotate_mb=0
    [ "$entry" != "$dir" ] && rotate_mb="${entry##*|}"
    case "$rotate_mb" in ''|*[!0-9]*) rotate_mb=0 ;; esac

    real="$(readlink -f -- "$dir" 2>/dev/null || true)"
    if [ -z "$real" ] || [ ! -d "$real" ]; then
        log "AVISO: directorio inexistente, lo salto: $dir"; continue
    fi
    case "$real" in
        "$INFRA_DIR"|"$INFRA_DIR"/*)
            log "ERROR: $real pertenece a INFRA_DIR ($INFRA_DIR); no se limpia"
            ERRORS=$((ERRORS+1)); continue ;;
        "$ALLOWED_ROOT"/*/*) ;;     # al menos dos niveles por debajo de la raiz permitida
        *) log "ERROR: $real esta fuera de ALLOWED_ROOT ($ALLOWED_ROOT) o es demasiado general; lo salto"
           ERRORS=$((ERRORS+1)); continue ;;
    esac
    before_kb="$(du -sk -- "$real" 2>/dev/null | cut -f1)"
    log "--- $real (antes: $((before_kb/1024)) MB)"

    # ---------- 1) BORRAR por antiguedad ----------
    declare -A seen=()
    to_delete=()
    for pat in "${DELETE_PATTERNS[@]}"; do
        while IFS= read -r -d '' f; do
            [ -n "${seen[$f]:-}" ] && continue
            seen[$f]=1
            if is_open "$f"; then SKIP_OPEN=$((SKIP_OPEN+1)); log "  (abierto, no se borra) $f"; continue; fi
            to_delete+=("$f")
        done < <(find "$real" -maxdepth 1 -type f -name "$pat" -mtime +"$RETENTION_DAYS" -print0 2>/dev/null)
    done
    unset seen
    if [ "${#to_delete[@]}" -gt "$MAX_DELETE_FILES" ]; then
        log "ERROR: $real tiene ${#to_delete[@]} archivos a borrar (> MAX_DELETE_FILES=$MAX_DELETE_FILES). Aborto este directorio."
        ERRORS=$((ERRORS+1)); continue
    fi
    for f in "${to_delete[@]}"; do
        sz="$(fsize "$f")"
        if [ "$APPLY" -eq 1 ]; then
            if rm -f -- "$f"; then DEL_N=$((DEL_N+1)); DEL_BYTES=$((DEL_BYTES+sz)); log "  BORRADO  $f ($((sz/1024)) KB)"
            else ERRORS=$((ERRORS+1)); log "  ERROR al borrar $f"; fi
        else
            DEL_N=$((DEL_N+1)); DEL_BYTES=$((DEL_BYTES+sz)); log "  [dry] borraria   $f ($((sz/1024)) KB)"
        fi
    done

    # ---------- 2) COMPRIMIR meses anteriores ----------
    declare -A planned=()
    for f in "${to_delete[@]}"; do planned[$f]=1; done      # no comprimir lo que ya se va a borrar
    declare -A seen2=()
    for pat in "${COMPRESS_PATTERNS[@]}"; do
        while IFS= read -r -d '' f; do
            [ -n "${seen2[$f]:-}" ] && continue
            seen2[$f]=1
            [ -n "${planned[$f]:-}" ] && continue
            if is_open "$f"; then SKIP_OPEN=$((SKIP_OPEN+1)); continue; fi
            if [ -e "$f.gz" ]; then log "  (ya existe $f.gz, no se comprime) $f"; continue; fi
            sz="$(fsize "$f")"
            if [ "$APPLY" -eq 1 ]; then
                if gzip -- "$f"; then
                    nsz="$(fsize "$f.gz")"
                    CMP_N=$((CMP_N+1)); CMP_SAVED=$((CMP_SAVED+sz-nsz))
                    log "  COMPRIMIDO $f ($((sz/1024)) KB -> $((nsz/1024)) KB)"
                else ERRORS=$((ERRORS+1)); log "  ERROR al comprimir $f"; fi
            else
                CMP_N=$((CMP_N+1)); log "  [dry] comprimiria $f ($((sz/1024)) KB)"
            fi
        done < <(find "$real" -maxdepth 1 -type f -name "$pat" ! -newermt "$MONTH_START" -size +0 -print0 2>/dev/null)
    done
    unset seen2 planned

    # ---------- 3) ROTAR log activo grande (opcional) ----------
    if [ "$rotate_mb" -gt 0 ]; then
        while IFS= read -r -d '' f; do
            sz="$(fsize "$f")"
            [ "$sz" -gt $((rotate_mb*1024*1024)) ] || continue
            ts="$(date +%Y%m%d-%H%M%S)"
            dest="${f%.log}-$ts.log.gz"
            if [ "$APPLY" -eq 1 ]; then
                if gzip -c -- "$f" > "$dest" && [ -s "$dest" ] && : > "$f"; then
                    ROT_N=$((ROT_N+1)); ROT_BYTES=$((ROT_BYTES+sz))
                    log "  ROTADO   $f ($((sz/1024/1024)) MB) -> $dest"
                else ERRORS=$((ERRORS+1)); rm -f -- "$dest"; log "  ERROR al rotar $f (el original NO se vacio si fallo la copia)"; fi
            else
                ROT_N=$((ROT_N+1)); ROT_BYTES=$((ROT_BYTES+sz))
                log "  [dry] rotaria  $f ($((sz/1024/1024)) MB > ${rotate_mb} MB) -> $dest"
            fi
        done < <(find "$real" -maxdepth 1 -type f -name "*.log" -print0 2>/dev/null)
    fi

    after_kb="$(du -sk -- "$real" 2>/dev/null | cut -f1)"
    log "    despues: $((after_kb/1024)) MB"
done

freed_mb=$(( (DEL_BYTES + CMP_SAVED + ROT_BYTES) / 1024 / 1024 ))
SUMMARY="Modo: $MODE
Borrados (> ${RETENTION_DAYS} dias): $DEL_N archivos, $((DEL_BYTES/1024/1024)) MB
Comprimidos (meses anteriores): $CMP_N archivos, ahorro $((CMP_SAVED/1024/1024)) MB
Rotados (log activo grande): $ROT_N archivos, $((ROT_BYTES/1024/1024)) MB
Omitidos por estar abiertos: $SKIP_OPEN
Errores: $ERRORS
Espacio liberado estimado: ${freed_mb} MB"
log "--- RESUMEN ---"
echo "$SUMMARY" | while IFS= read -r l; do log "  $l"; done

# --- aviso (solo si se aplico algo relevante o hubo errores) ---
if [ "$APPLY" -eq 1 ] && [ "$NOTIFY" = "yes" ] && [ -x "$NOTIFY_BIN" ] && [ -r "$NOTIFY_CONF" ]; then
    if [ "$ERRORS" -gt 0 ] || [ "$freed_mb" -ge "$NOTIFY_MIN_MB" ]; then
        level="INFO"; [ "$ERRORS" -gt 0 ] && level="WARNING"
        "$NOTIFY_BIN" --config "$NOTIFY_CONF" \
            --send "$level EVENT: Logs cleanup - $SERVER_NAME" "$SUMMARY" || log "AVISO: no se pudo enviar el resumen por mail/Telegram"
    fi
fi

[ "$ERRORS" -eq 0 ] || exit 1
exit 0
