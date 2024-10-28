#!/bin/bash
if [ -s $1 ] #Me fijo que paginaDiario.txt no este vacio
then
    ocurrencias=$(grep -io "\bmisterio\b" $1 | wc -l)
    echo "Cantidad de veces que la palabra misterio es mencionada: $ocurrencias" > $3

    calcular_factorial() {
        local aux=$1
        if [ $aux -lt 1 ]; then
            echo 1
        else
            local factorial=1
            until [ $aux -le 1 ]; do
                factorial=$(($factorial * $aux))
                aux=$(($aux - 1))
            done
            echo $factorial
        fi
    }

    calcular_fibonnaci(){
        local aux=$1
        if [ $aux -le 0 ]; then
            echo 0
        else
            if [ $aux -eq 1 ]; then
                echo 1
            else
                echo $(( $(calcular_fibonnaci $((aux - 1)) ) + $(calcular_fibonnaci $((aux - 2)) ) ))
            fi
        fi
    } #https://stackoverflow.com/questions/19624278/a-recursive-fibonacci-function-in-bash

    calc=$(($2%2))
    if [ $calc -eq 0 ];then
        if [ $2 -lt 0 ]; then
            echo "No se puede calcular el factorial de un numero negativo" >> $3
        else
            resultado_factorial=$(calcular_factorial $2)
            echo "El factorial de $2 es: $resultado_factorial" >> $3
        fi
    else
        resultado_fibonacci=$(calcular_fibonnaci $2)
        echo "El Fibonacci de $2 es: $resultado_fibonacci" >> $3
    fi

    cat $3
else
    echo "El archivo $1 esta vacio"
fi