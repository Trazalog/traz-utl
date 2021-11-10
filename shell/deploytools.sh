#!/bin/sh
# Script para desplegar trazalog tools
# debe estar en el directorio de htdocs
# por ejemplo /var/www/html o en htdocs
# @author rruiz

#exporteo versión WSO2
export WSO2VER = "6.5.0"

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

#Detecto S.O.
UNAME=$(uname | tr "[:upper:]" "[:lower:]")
# If Linux, try to determine specific distribution
if [ "$UNAME" == "linux" ]; then
    # If available, use LSB to identify distribution
    if [ -f /etc/lsb-release -o -d /etc/lsb-release.d ]; then
        export DISTRO=$(lsb_release -i | cut -d: -f2 | sed s/'^\t'//)
    # Otherwise, use release info file
    else
        export DISTRO=$(ls -d /etc/[A-Za-z]*[_-][rv]e[lr]* | grep -v "lsb" | cut -d'/' -f3 | cut -d'-' -f1 | cut -d'_' -f1)
    fi
fi

echo "=============TRAZALOG==============="
echo " "
echo ">>>> Desplegando......"
echo ">>>> Rama/Tag: $tag"
echo ">>>> Producto: $product"
echo ">>>> Sis.Op. : $UNAME"
echo ">>>> Distrub.: $DISTRO"


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

#backupeo si hay manifest
if [ -f "$product/manifest.json" ]
	cp $product/manifest.json bk/$product/ 2>&1 >>./$product.log
fi

#backupeo service workers
for sw in `ls $product/sw*js -1` 
do 
	cp $product/$sw bk/$product/ 2>&1 >>./$product.log
done

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
echo ">>>> copiando dataservices"

#chequeo donde esta instalado WSO2
if [! -d "/usr/lib64/wso2/wso2ei/$WSO2VER" ]
then
	 if [! -d "/usr/lib/wso2/wso2ei/$WSO2VER"]
		 echo "FATAL, no se encuentra WSO2 $WSO2VER ni en usr/lib64 ni en usr/lib"
	 else
		export $WSO2DSS = "/usr/lib/wso2/wso2ei/$WSO2VER/repository/deployment/server/dataservices"
	fi
else
		export $WSO2DSS = "/usr/lib64/wso2/wso2ei/$WSO2VER/repository/deployment/server/dataservices"
fi

#elimino los dataservices viejos y despliego los nuevos dss
if [-z $WSO2DSS]
then
	mkdir $WSO2DSS
fi

echo "Generando dataservices de $product/_backend"
rm -f "$WSO2DSS/*dbs"
cp "$product/_backend/api/dataservices/*dbs" $WSO2DSS

#también copio todos los dataservices de los submodulos
for dire in `ls $product/application/modules -1` 
do 
	echo "Generando dataservices de $dire"
	cp $product/application/modules/$dire/api/dataservices/*dbs $WSO2DSS
done


echo ">>>> restaurando configuracion"

cp bk/$product/database.php $product/application/config/ 2>&1 >>./$product.log
cp bk/$product/config.php $product/application/config/ 2>&1 >>./$product.log
cp bk/$product/constants.php $product/application/config/ 2>&1 >>./$product.log
cp bk/$product/.htaccess $product/ 2>&1 >>./$product.log

echo ">>>> actualizando permisos"

if [ $DISTRO == 'Ubuntu']
then
	chown www-data:www-data $product/ -R 2>&1 >>./$product.log
else
	chown apache:apache $product/ -R 2>&1 >>./$product.log
fi 
chmod ugo+rx $product/ -R 2>&1 >>./$product.log
if [ -d $product/assets/ ]
then
	chmod 777 $product/assets/ -R 2>&1 >>./$product.log
fi
echo ">>>> hecho"

