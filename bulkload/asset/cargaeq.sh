#primero copiamos el archivo de entrada con nombre fijo
echo Cargando archivo $1 a Equipos
cp $1 /tmp/eq.dmp
mysql -u root -p asp2tecn -Ns < loadeq.sql > cargaeq.log
cat cargaeq.log
