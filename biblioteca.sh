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
            param_fim=$#
            echo "Parâmetros iniciais: $param_ini."
            echo "Total de parâmetros agora: $param_fim."
            echo Lista de parâmetros:

            for i in "$@"
            do  
                echo $i
            done
            echo ""
            echo "Deseja dar shift em quantos deles?"
            read shift_num
            echo ""
            if [ ${shift_num} -ge  ${param_fim} ]
            then
                echo "Número maior que a quantidade de parâmetros."
                sleep 3
                echo ""
                shift_repete=1
            else
                shift $shift_num
                
                if [[ $# = 0 ]]
                then
                    echo "Lista vazia"
                    shift_repete=0

                else
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
                        shift_repete=0
                    else
                        shift_repete=1
                    fi
                fi
            fi
        done
    fi
}