#!/bin/bash
if [ -s $1 ] #Me fijo que el archivo registro.txt no este vacio
then
    horario=$(grep -E "(0[0-9]|1[0-9]|2[0-4]):([0-5][1, 3, 5, 7, 9]) 7" $1 | sort -t ':' -k 1 -n | grep -i "\(resbaló\sen\sel\sbarro\|limpió\slas\spezuñas\)" | grep -m 1 ".")

    echo "Hora indicada para capturar a Pato: ${horario:0:5}" > $2
    cat $2
else
    echo "El archivo $1 esta vacio"
fi