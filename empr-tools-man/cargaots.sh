#primero copiamos el archivo de entrada con nombre fijo
echo Cargando archivo $1 a Ordenes de Trabajo
cp $1 /tmp/ots.dmp
mysql -u root -p assetv2 -Ns < loadot.sql > cargaot.log
cat cargaot.log
