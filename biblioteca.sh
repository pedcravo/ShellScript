#!/bin/bash

mostrar_param() {
    if [[ $# -lt 1 ]]
    then 
        echo "Menos de um parâmetro recebido"
    else
        param_ini=$#
        while [[ $shift_repete != 0 ]]
        do  
            echo "Você me passou $# parâmetros."
            echo "Deseja dar shift em quantos deles?"
            read shift_num
            echo ""
            if [[ $shift_num > $@ ]]
            then
                echo "Número maior que a quantidade de parâmetros."
                echo ""
                shift_repete=1
            else
                shift $shift_num
                for i in "$@"
                do
                    echo $i
                done
                shift_repete=0
            fi
        done
    fi
}