#!/bin/bash

BASE="$HOME/EPNro1"
ENTRADA="$BASE/entrada"
SALIDA="$BASE/salida"
PROCESADO="$BASE/procesado"

if [ -z "$FILENAME" ]; then
   echo "Error: variable FILENAME no definida."
   exit 1
fi

FILE="$SALIDA/$FILENAME.txt"

> "$FILE"

for f in "$ENTRADA"/*; do

   if [ -f "$f" ];then
      cat "$f" >> "$FILE"
      mv "$f" "$PROCESADO/"
   fi
done

 
