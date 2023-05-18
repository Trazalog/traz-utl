#!/bin/sh
# Script para desplegar trazalog tools
# debe estar en el directorio de htdocs
# por ejemplo /var/www/html o en htdocs
# @author rruiz
# v2.0 agregador de deploy de dss, detección de distribución  y mejoras varias
# v3.0 utiliza wso2 mi 4.2 y codeigniter 3, despliega archivos .car en carbonapps en lugar de solo dbs (CUIDADO despliega apis y cualquier objeto dentro del .car). Al momento de armarse el despliegue debe incluirse en backend/api/deploy con el mismo numero de tag un archivo tag.car con los objetos a desplegar


#exporteo versión WSO2MI
export WSO2VER="4.2.0"

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
date

echo "=============TRAZALOG==============="  >>./$product.log
echo " "  >>./$product.log
echo ">>>> Desplegando......"  >>./$product.log
echo ">>>> Rama/Tag: $tag"  >>./$product.log
echo ">>>> Producto: $product"  >>./$product.log
date  >>./$product.log


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
cp $product/app/Config/Database.php bk/$product/  2>&1 >>./$product.log
cp $product/app/Config/App.php bk/$product/ 2>&1 >>./$product.log
cp $product/app/Config/Constants.php bk/$product/ 2>&1 >>./$product.log
cp $product/app/Config/Logger.php bk/$product/ 2>&1 >>./$product.log
cp $product/app/Config/Routes.php bk/$product/ 2>&1 >>./$product.log
cp $product/app/Config/Autoload.php bk/$product/ 2>&1 >>./$product.log
cp $product/.htaccess bk/$product/ 2>&1 >>./$product.log
cp $product/.env bk/$product/ 2>&1 >>./$product.log

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
if [ -d "app/Modules" ]
then
   echo ">>>> Actualizando submodulos"
   cd app/Modules
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
if [ ! -d "/trazaSystems/wso2mi-$WSO2VER" ]
then
	 if [ ! -d "/trazaSystems/wso2mi-$WSO2VER" ]
         then
		 echo "FATAL, no se encuentra WSO2 $WSO2VER en /trazaSystems/"
	 else
		export WSO2CAR="/trazaSystems/wso2mi-$WSO2VER/repository/deployment/server/carbonapps"
	 fi
else
		export WSO2CAR="/trazaSystems/wso2mi-$WSO2VER/repository/deployment/server/carbonapps"
fi

echo ">>>> instalando dataservices en $WSO2CAR"
#elimino los dataservices viejos y despliego los nuevos dss
if [ ! -d $WSO2CAR ]
then
        echo ">>>> creando directorio $WSO2CAR"
	mkdir $WSO2CAR
fi

echo ">>>> Generando artefactos wso2 de $product/backend/api/deploy"
cp $product/backend/api/deploy/$tag.car $WSO2CAR 2>&1 >>./$product.log


#también copio todos los artefactos de los submodulos
for dire in $product/app/Modules/*
do 
        if [ -d $dire/backend/api/deploy ]
        then
		if [ -f $dire/backend/api/deploy/*car ] 
        	then 
			echo ">>>> instalando artefactos de $dire"
			cp $dire/backend/api/deploy/$tag.car $WSO2CAR 2>&1 >>./$product.log

        	fi
	fi
done


echo ">>>> restaurando configuracion"

cp bk/$product/Database.php $product/app/Config/ 2>&1 >>./$product.log
cp bk/$product/App.php $product/app/Config/ 2>&1 >>./$product.log
cp bk/$product/Constants.php $product/app/Config/ 2>&1 >>./$product.log
cp bk/$product/Routes.php $product/app/Config/ 2>&1 >>./$product.log
cp bk/$product/Logger.php $product/app/Config/ 2>&1 >>./$product.log
cp bk/$product/Autoload.php $product/app/Config/ 2>&1 >>./$product.log
cp bk/$product/.htaccess $product/ 2>&1 >>./$product.log
cp bk/$product/.env $product/ 2>&1 >>./$product.log
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

