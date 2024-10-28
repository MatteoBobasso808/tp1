#!/bin/bash
if [ -s $1 ] #Me fijo si el archivo canciones.txt tiene contenido
then
    cancion_reformada=$(grep "^[A-Za-z]" $1 | grep -Evi "[aeiou]{3,}" | grep -v "[0-9]")
    echo "$cancion_reformada" > $2
    sed -i 's/[AEIOUaeiouáéíóú]/X/g' $2

    while read linea; do
        numero_palabras=$(echo "$linea" | wc -w)
        if [ $numero_palabras -lt 5 ]; then
            echo "$linea" | rev
        else
            echo "$linea"
        fi
    done <$2
else
    echo "El archivo $1 esta vacio"
fi

#ciclo while https://stackoverflow.com/questions/1521462/looping-through-the-content-of-a-file-in-bash