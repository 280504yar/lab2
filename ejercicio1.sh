#!/bin/bash
#verificar si es root
if [ $(id -u) -ne 0 ]; then # 0 es el usuario root, -u imprime solo el id del usuario
	echo "error: el usuario no es root"
	exit
fi

#parametros
if [ $# -ne 3 ]; then
	echo "no se recibieron 3 parametros"
fi

usuario=$1
grupo=$2
archivo=$3

#verificar que el archivo existe
if [ -f "$archivo"]; then
	echo "el archivo $archivo existe"
else
	echo "error: el archivo $archivo no existe"
fi

#crear grupo si no existe
if []; then
	echo "el grupo $grupo no existe"
	sudo addgroup "$grupo"
else
	echo "el grupo $grupo ya existe"
fi

#crear usuario si no existe
id "$usuario" > /dev/null
if  [ $? -ne 0 ]; then
	echo "el usuario $usuario no existe"
	sudo adduser "$usuario"
	echo "el usuario $usuario existe, se agrega al grupo $grupo"
	sudo usermod -a -G "$grupo" "$usuario"
fi

#modificar la pertenencia del archivo
chown "$usuario:$grupo" "$archivo"

#dar permisos
chmod 740 "archivo"

