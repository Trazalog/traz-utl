#!/bin/sh
# Script para desplegar trazalog tools
# debe estar en el directorio de htdocs
# por ejemplo /var/www/html o en htdocs
# @author rruiz

#exportea la rama default para este ambiente
if [ -z "$1" ]
then
#       en ambientes de desarrollo, cambiar por origin/develop
        export tag=origin/master
else
# podria informar un tag de release
        export tag=$1
fi

#exporteo el producto a desplegar
if [ -z "$2" ]
then
   export product=traz-tools
else
   export product=$2
fi
echo "=============TRAZALOG==============="
echo " "
echo ">>>> Desplegando......"
echo ">>>> Rama/Tag: $tag"
echo ">>>> Producto: $product"

#si no existe el directorio de backup lo genero
if [ ! -d "bk/$product" ]
then
   mkdir bk/$product
fi


#backupeo archivos de configuracion
cp $product/application/config/database.php bk/$product/  2>&1 >>./$product.log
cp $product/application/config/config.php bk/$product/ 2>&1 >>./$product.log
cp $product/application/config/constants.php bk/$product/ 2>&1 >>./$product.log
cp $product/.htaccess bk/$product/ 2>&1 >>./$product.log

#descargargo de github el
#producto en la rama solicitada o
#sino en develop por default

cd $product
git pull 2>&1 >>../$product.log
git reset $tag --hard 2>&1 >>../$product.log
if [ -d "application/modules" ]
then
   echo ">>>> Actualizando submodulos"
   cd application/modules
   git submodule foreach git reset --hard 2>&1 >>../../../$product.log
   git submodule update --init 2>&1 >>../../../$product.log
   cd ../..
fi
git status
git status 2>&1 >>../$product.log
cd ..

echo ">>>> git reset finalizado"
echo ">>>> restaurando configuracion"

cp bk/$product/database.php $product/application/config/ 2>&1 >>./$product.log
cp bk/$product/config.php $product/application/config/ 2>&1 >>./$product.log
cp bk/$product/constants.php $product/application/config/ 2>&1 >>./$product.log
cp bk/$product/.htaccess $product/ 2>&1 >>./$product.log

echo ">>>> actualizando permisos"
chown apache:apache $product/ -R 2>&1 >>./$product.log
chmod ugo+rx $product/ -R 2>&1 >>./$product.log
chmod 777 $product/assets/ -R 2>&1 >>./$product.log
echo ">>>> hecho"

