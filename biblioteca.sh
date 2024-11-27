#!/bin/bash

shift_param() {
    shift_repete=1
    
    if [[ $# -lt 1 ]]
    then 
        echo "Menos de um parâmetro recebido"
        
    else
        param_ini=$#
        while [[ $shift_repete != 0 ]]
        do  
            echo "Parâmetros iniciais: $param_ini."
            echo "Total de parâmetros agora: $#."
            echo ""
            echo Lista de parâmetros:

            for i in "$@"
            do  
                echo $i
            done
            echo ""

            echo "Deseja dar shift em quantos deles?"
            read shift_num
            echo ""
            if [[ $shift_num > $# ]]
            then
                echo "Número maior que a quantidade de parâmetros."
                echo ""
                shift_repete=1
            else
                shift $shift_num
                echo Nova lista de parâmetros:
                for i in "$@"
                do
                    echo $i
                done
                
                echo ""
                echo "Deseja dar shift novamente?"
                read shift_conf

                if [[ ${shift_conf,,} != sim && ${shift_conf,,} != s ]]
                then
                    echo "Finalizando código da biblioteca..."
                    shift_repete=0
                else
                    echo "Repetindo..."
                    echo ""
                    shift_repete=1
                fi
            fi
        done
    fi
}