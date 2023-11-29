#primero copiamos el archivo de entrada con nombre fijo
echo Cargando archivo $1 a Articulos
cp $1 /tmp/ars.dmp
mysql -u root -p assetv2 -Ns < loadar.sql > cargaar.log
cat cargaar.log
