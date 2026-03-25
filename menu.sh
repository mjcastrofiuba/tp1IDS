#!/bin/bash

echo "Ingrese el nombre del archivo (FILENAME): "
read FILENAME
export FILENAME

BASE="$HOME/EPNro1"
ENTRADA="$BASE/entrada"
SALIDA="$BASE/salida"
PROCESADO="$BASE/procesado"

echo "====================================="
echo "BIENVENIDO"
echo "Para eliminar el entorno,"
echo "ejecute el script con el parametro -d"
echo "Ejemplo: bash menu.sh -d"
echo "====================================="
 
while true
do
   echo "      MENU      "
   echo "1 Crear entorno"
   echo "2 Correr proceso"
   echo "3 Listar alumnos"
   echo "4 Top 10 notas"
   echo "5 Buscar padron"
   echo "6 Salir"
   echo "====================================="
   
   read opcion

   case $opcion in
       1)
           mkdir -p "$ENTRADA"
           mkdir -p "$SALIDA"
           mkdir -p "$PROCESADO"
           cp consolidar.sh "$BASE"
           echo "Entorno creado"
           ;;

       2) 
           if [ -f "$BASE"/consolidar.sh ]; then
               cd "$BASE"
               bash consolidar.sh &
               cd ..
               echo "Proceso en segundo plano"
           else 
               echo "Primero crear entorno"
           echo "Proceso en segundo plano"
           fi
           ;;

       3) 
           FILE="$SALIDA/$FILENAME.txt"
           if [ -f "$FILE" ]; then 
               sort -n "$FILE"
           else 
               echo "No existe el archivo"
           fi
           ;;
         
       4) 
           FILE="$SALIDA/$FILENAME.txt"
           if [ -f "$FILE" ]; then
               sort -k5 -nr "$FILE" | head -10
           else 
               echo "No existe el archivo"
           fi
           ;;

       5)
           FILE="$SALIDA/$FILENAME.txt"
           if [ -f "$FILE" ]; then
               echo "Ingrese padron:"
               read padron
               grep "$padron" "$FILE"
           else 
               echo "No existe el archivo"
           fi
           ;;

       6)
           break
           ;;

       *)
           echo "Opcion incorrecta: "
           ;;
   esac
done 

if [ "$1" = "-d" ]; then
   echo "eliminando entorno..."
   rm -rf "$BASE"
   pkill -f consolidar.sh
   echo "Entorno eliminado correctamente"
else 
   echo "El entorno no fue eliminado "
fi
