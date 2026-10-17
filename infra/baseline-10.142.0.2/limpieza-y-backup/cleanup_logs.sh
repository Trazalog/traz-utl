#!/bin/bash
# ORIGINAL de produccion 10.142.0.2 (copiado 2026-10-16). Credenciales removidas si las hubiera.
# Solo como referencia/baseline.

# Lista de directorios a limpiar
directories=(
    "/var/www/html/sim/traz-prod-assetplanner/application/logs"
	"/var/www/html/tools/traz-prod-assetplanner/application/logs"
	"/var/www/html/sstr/sstr-desa-segdenuncias/application/logs"
	"/var/www/html/traz-comp-dnato/application/logs"
	"/var/www/html/traz-tools/application/logs"
	"/var/www/html/traz-tools/application/modules/traz-comp-calendar/application/logs"
	"/var/www/html/traz-prod-assetplanner-v2.0/application/logs"
)

# Número de días
days=30

# Iterar sobre cada directorio
for dir in "${directories[@]}"; do
    if [ -d "$dir" ]; then
        echo "Cleaning directory: $dir"
        find "$dir" -type f -mtime +$days -exec rm -f {} \;
    else
        echo "Directory not found: $dir"
    fi
done

directories_bucket=(
    "/mnt/bucket/prod/logs/sim-traz-prod-assetplanner"
    "/mnt/bucket/prod/logs/tools-traz-prod-assetplanner"
    "/mnt/bucket/prod/logs/sstr-desa-segdenuncias"
    "/mnt/bucket/prod/logs/traz-comp-dnato"
    "/mnt/bucket/prod/logs/traz-tools"
    "/mnt/bucket/prod/logs/traz-tools-traz-comp-calendar"
    "/mnt/bucket/prod/logs/traz-prod-assetplanner-v2.0"
)

# Iterar sobre cada directorio del bucket
for dir in "${directories_bucket[@]}"; do
    if [ -d "$dir" ]; then
        echo "Cleaning directory: $dir"
        find "$dir" -type f -mtime +$days -exec rm -f {} \;
    else
        echo "Directory not found: $dir"
    fi
done

# Ruta al archivo con la tabla de registros
REG_FILE="/trazaSystems/.directorios.csv"

# Umbral de uso de disco
THRESHOLD=85

# Directorio del archivo de registros
DIR_REG_FILE=$(dirname "$REG_FILE")

# Verificar el espacio ocupado en el sistema de archivos raíz (/)
used_space=$(df / | awk 'NR==2 {print $5}' | sed 's/%//')

# Función para mover archivos
move_old_files() {
    local src_dir=$1
    local dest_dir=$2

    # Crear el directorio de destino si no existe
    mkdir -p "$dest_dir"

    # Mover los archivos de más de 15 días
    find "$src_dir" -type f -mtime +15 -exec mv {} "$dest_dir" \;
}

# Verificar el espacio ocupado y proceder si es mayor al umbral
if [ "$used_space" -gt "$THRESHOLD" ]; then
    echo "Espacio ocupado en /: ${used_space}% (mayor al umbral de ${THRESHOLD}%)"
    
    # Leer el archivo de registros línea por línea
    while IFS=, read -r src_dir dest_dir; do
        echo "Procesando: $src_dir -> $dest_dir"
        move_old_files "$src_dir" "$dest_dir"
    done < "$REG_FILE"
else
    echo "Espacio ocupado en /: ${used_space}% (dentro del umbral)"
fi
