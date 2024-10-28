#!/bin/bash
if [ -s $1 ] #Me fijo que infractores.csv no este vacio
then
    anio=$(date +%Y) # Agarro el año actual
    anios=($((anio - 4)) $((anio - 3)) $((anio - 2)) $((anio - 1)) $anio) # Armo un array con los ultimos 5 años
    > "infractores.txt" # Creo un archivo vacio infractores.txt, y si se vuelve a ejecutar el comando vacia el infractores.txt ya creado por si utiliza otro archivo de infractores.csv

    for i in "${anios[@]}";do  # Ciclo for con array https://atareao.es/tutorial/scripts-en-bash/arrays-en-bash/
        echo "$(grep -m 3 "$i" $1 | sort -t ',' -k 3 -n)" >> "infractores.txt"
    done
    cat "infractores.txt"

    echo $(sort -t ',' -k 3 -n infractores.txt | head -n 3 > "acertijo3.txt")
    cat "acertijo3.txt"
else    
    echo "El archivo $1 esta vacio"
fi