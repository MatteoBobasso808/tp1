#!/bin/bash
if [ -s $1 ] #Me fijo que papiro.txt no este vacio
then
    sed 's/[^a-zA-Z]//g' $1 | sed -e 's/cueva/doblar/Ig' -e 's/secreta/izquierda/Ig' -e 's/pocos/despues/Ig' -e 's/metros/derecha/Ig' -e 's/arriba/adelante/Ig' -e 's/atras/reversa/Ig' | tr -d '[:space:]' > backup_mensajes.txt
    cat backup_mensajes.txt > $2
    echo "" >> $2 #Le agrego al final un caracter vacio para que la terminal me muestre en linea el cat y debajo la entrada de la terminal 
    cat $2
else
    echo "El archivo $1 esta vacio"
fi

#Fuente: https://www.enmimaquinafunciona.com/pregunta/182823/sed-para-eliminar-los-espacios-en-blanco