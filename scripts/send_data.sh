#!/bin/bash
#======================
# Autor: Jaime Sanchez
#Team: DevOps
#======================

#=+=+=+= Define Variables =+=+=+=#
#===================================#
#=+=+=+= Colors =+=+=+=#
txtn="\033[0m"
txtr="\033[0;31m"
txtc="\033[0;36m"
txtg="\033[0;32m"
#=+=+=+= Date & Hours =+=+=+=#
fech=`date +%d-%b-%Y`
hor=`date +%H%M`


#=+=+=+= Date & Hours =+=+=+=#

echo -e "${txtg}\n\tIntrocuzca la informacion del producto:${txtn}\n"
echo -e "${txtc}SKU:${txtn}"
read sku
echo -e "${txtc}Name:${txtn}"
read name
echo -e "${txtc}Brand:${txtn}"
read brand
echo -e "${txtc}model:${txtn}"
read model
echo -e "${txtc}Price:${txtn}"
read price
echo -e "${txtc}Descripcion:${txtn}"
read description

cambia_es=`echo $description | sed 's/ /@/g' | sed 's/=//g'`
echo $cambia_es

curl -u admin:password123 -X GET http://127.0.0.1:8000/catalogo/recapcion_productos_catalogo/sku/{$sku}/name/{$name}/brand/{$brand}/model/{$model}/price/{$price}/description/{$cambia_es}/
