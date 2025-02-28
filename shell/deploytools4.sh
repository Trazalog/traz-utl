#!/bin/sh
# Script para desplegar trazalog tools
# debe estar en el directorio de htdocs
# por ejemplo /var/www/html o en htdocs
# @author rruiz
# v2.0 agregador de deploy de dss, detección de distribución  y mejoras varias

#exporteo versión WSO2
export WSO2VER="6.6.0"

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
export DISTRO=`cat /etc/*-release|grep DISTRIB_ID`

echo "=============TRAZALOG==============="
echo " "
echo ">>>> Desplegando......"
echo ">>>> Rama/Tag: $tag"
echo ">>>> Producto: $product"


#si no existe el directorio de backup lo genero
if [ ! -d "bk" ]
then
   mkdir bk
fi
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
then
	cp $product/manifest.json bk/$product/ 2>&1 >>./$product.log
fi

#backupeo service workers
for sw in "$product/sw*js"
do 
        if [ $sw != "$product/sw*js" ]; 
        then
	      cp $sw bk/$product/ 2>&1 >>./$product.log
        fi
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
if [ ! -d "/trazaSystems/wso2/wso2ei-$WSO2VER" ]
then
	 if [ ! -d "/trazaSystems/wso2/wso2ei-$WSO2VER" ]
         then
		 echo "FATAL, no se encuentra WSO2 $WSO2VER ni en usr/lib64 ni en usr/lib"
	 else
		export WSO2DSS="/trazaSystems/wso2/wso2ei-$WSO2VER/repository/deployment/server/dataservices"
	 fi
else
		export WSO2DSS="/trazaSystems/wso2/wso2ei-$WSO2VER/repository/deployment/server/dataservices"
fi

echo ">>>> instalando dataservices en $WSO2DSS"
#elimino los dataservices viejos y despliego los nuevos dss
if [ ! -d $WSO2DSS ]
then
        echo ">>>> creando directorio $WSO2DSS"
	mkdir $WSO2DSS
fi

echo ">>>> Generando dataservices de $product/_backend"
rm -f "$WSO2DSS/*dbs"
cp $product/_backend/api/dataservice/*dbs $WSO2DSS

#también copio todos los dataservices de los submodulos
for dire in $product/application/modules/*
do 
        if [ -d $dire/api/dataservice ]
        then
		if [ -f $dire/api/dataservice/*dbs ] 
        	then 
			echo ">>>> instalando DSS de $dire"
			cp $dire/api/dataservice/*dbs $WSO2DSS
        	fi
	fi
done


echo ">>>> restaurando configuracion"

cp bk/$product/database.php $product/application/config/ 2>&1 >>./$product.log
cp bk/$product/config.php $product/application/config/ 2>&1 >>./$product.log
cp bk/$product/constants.php $product/application/config/ 2>&1 >>./$product.log
cp bk/$product/.htaccess $product/ 2>&1 >>./$product.log
if [ -f bk/$product/sw*js ]; then cp bk/$product/sw*.js $product/ 2>&1 >>./$product.log; fi
if [ -f bk/$product/manifest.js ]; then cp bk/$product/manifest.json $product/ 2>&1 >>./$product.log; fi

echo ">>>> actualizando permisos"

if [ ! -z $DISTRO ]
then
    if [ $DISTRO = "DISTRIB_ID=Ubuntu" ]
    then
	chown www-data:www-data $product/ -R 2>&1 >>./$product.log
    else
	chown apache:apache $product/ -R 2>&1 >>./$product.log
    fi 
else
    chown apache:apache $product/ -R 2>&1 >>./$product.log
fi

chmod ugo+rx $product/ -R 2>&1 >>./$product.log
if [ -d $product/assets/ ]
then
        echo ">>>> cambiando permiso a asssets"
	chmod 777 $product/assets/ -R 2>&1 >>./$product.log
fi
echo ">>>> hecho"

