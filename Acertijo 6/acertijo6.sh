#!/bin/bash
if [ -s $1 ] #Me fijo que pared.txt no este vacio
then
    sed -e 's/[1 2 9]/X/g' -e 's/[0 8]/_/g' $1 > $2
    echo "" >> $2 # Esta linea hace que no se me junte el final del codigo_secreto.txt 
                # con el inicio de la terminal y se puede ver bien el cat
    cat $2
else
    echo "El archivo $1 esta vacio"
fi