#!/bin/bash

clear

while [ "$repete" != 0 ]
do
    echo "Digite uma opção:"
    echo "1 = O que é isso? com if"
    echo "2 = História com if"
    echo "3 = Loop for 1"
    echo "4 = Loop for 2"
    echo "5 = Loop while 1"
    echo "6 = Loop while 2"
    echo "7 = Loop while 3"
    echo "8 = Verificar arquivo com if"
    echo "9 = Criação de arquivo temporário com mktemp"
    read -p " " num
    echo ""

    if [ $num -eq 1 -o $num -eq 2 -o $num -eq 3 -o $num -eq 4 -o $num -eq 5 -o $num -eq 6 -o $num -eq 7 -o $num -eq 8 -o $num -eq 9 ]
    then repete=0    
    else
        repete=1
    fi
done

if [ $num -eq 1 ]
then
    read -p "Me diga o que você quer que eu descubra: " pala

    if test -f $pala
    then
        echo "$pala é um arquivo"
        
        #test -d ${pala}
        #test_r=$?
        #[ -d ${pala} ]
        #simple_r=$?
        #[[ -d ${pala} ]]
        #extended_r=$?
        #echo "Os códigos de retorno são: ${test_r}, ${simple_r}, ${extended_r}."

    elif [ -d $pala ]
    then
        echo "$pala é um diretório"

    else
        echo "Não sei o que \$pala ($pala) é"
    fi
    echo ""

elif [ $num -eq 2 ]
then
    char=$1
    local=$2
    food=$3

    if test -z ${char}; then read -p "Qual o nome do personagem? " char; fi
    echo "Personagem = $char"

    if test -z ${local}; then read -p "Qual é o nome do local? " local; fi
    echo "Local = $local"
 
    if test -z ${food}; then read -p "Qual a sua comida favorita? " food; fi
    echo "Comida = $food"

    echo ""
    echo "Recentemente, ${char} foi visto em ${local} comendo ${food}!"
    echo ""

elif [ $num -eq 3 ]
then
    for (( COUNTER=100; COUNTER>0; COUNTER-- )) do
        if [ $COUNTER -eq 50 ]
        then
            echo "Chegamos na metade do \$COUNTER: $COUNTER""º"
        else
            echo $COUNTER"º"
        fi
    done
    echo ""

elif [ $num -eq 4 ]
then
    echo O primeiro argumento é $1
    echo O segundo argumento é $2
    echo O terceiro argumento é $3
    echo Você usou $# arumentos
    echo ""

    for i in "$@"
    do
	    echo $i
    done
    echo ""

elif [ $num -eq 5 ]
then
    d=1
    while (( $d <= 100 ))
        do
        if [ $d = 50 ]
        then
            echo "\$d = $d <--------------------"
        else
            echo "\$d = $d"
        fi
        d=$(( d+1 ))
    done
    echo ""

elif [ $num -eq 6 ]
then
    while :
        do
        echo "Você pode inserir texto e pressionar Enter quantas vezes quiser."
        echo "(Sair somente usando Ctrl+c)"
        read someText
        echo "Você digitou $someText"
        echo ""
    done

elif [ $num -eq 7 ]
then
    someString=begin
    while [ "$someString" != "quit" ]
        do
        echo "Você pode inserir texte e pressionar Enter quantas vezes quiser."
        echo "(Digite \"quit\" para sair)"
        read someString
        echo "Você digitou $someString"
        echo ""
    done
elif [ $num -eq 8 ]
then
    echo "Qual o caminho do arquivo ou diretório?"
    echo "Exemplo: /home/pedro/Downloads"
    read arquivo

    if [[ ! -e ${arquivo} ]]; then
        echo "O arquivo ou diretório não existe."
    else
        if [[ ! -d ${arquivo} ]]; then
            echo "O arquivo existe, mostrando agora o que tem nele:"
            cat  ${arquivo}
        else
            echo "O diretório existe, mostrando agora o que tem nele:"
            ls -la  ${arquivo}
        fi
    fi
    echo ""

else
    echo "Qual vai ser o nome do diretório?"
    read diretorio

    mktemp
    mktemp_rc=$?

    mkdir ${diretorio}
    mkdir_rc=$?

    test -d ${diretorio}
    test_rc=$?

    echo " "
    echo "O comando mktemp retornou: ${mktemp_rc}"
    echo "Já o mkdir retornou: $mkdir_rc"
    echo "Por fim o test retornou: ${test_rc}"
    echo ""

    echo "Qual vai ser o nome do arquivo?"
    echo "OBS: com caminho apara o diretório"
    read arquivo

    touch ${arquivo}
    touch_rc=$?

    echo "O comando touch retornou: ${touch_rc}"

fi

echo "Cabô"

exit 0