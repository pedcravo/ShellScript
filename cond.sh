#!/bin/bash
# ./cond.sh para executar o shell

while :
do
    while [ "$repete" != 0 ]
    do
        clear
        echo ""
        echo "__________               .__             .__  .__ "
        echo "\______   \_____    _____|  |__     ____ |  | |__|"
        echo " |    |  _/\__  \  /  ___/  |  \  _/ ___\|  | |  |"
        echo " |    |   \ / __ \_\___ \|   Y  \ \  \___|  |_|  |"  # Arte feita com: https://patorjk.com/software/taag/#p=display&f=Graffiti&t=Bash%20cli
        echo " |______  /(____  /____  >___|  /  \___  >____/__|"
        echo "        \/      \/     \/     \/       \/         "
        echo ""

        echo "Digite uma opção:"
        echo " 1 = História com if"
        echo " 2 = Loop for 1"
        echo " 3 = Loop for 2"
        echo " 4 = Loop while 1"
        echo " 5 = Loop while 2"
        echo " 6 = Loop while 3"
        echo " 7 = Verificar se há arquivo com if"
        echo " 8 = Verificar arquivo o tem no arquivo com if"
        echo " 9 = Criação de arquivo temporário com mktemp"
        echo "10 = Criação de arquivo e diretório"
        echo "11 = Status da CPU com for"
        echo "12 = Reversão de palavras com rev"
        echo " 0 = Sair"
        read num
        echo ""

        if [ $num -eq 1 -o $num -eq 2 -o $num -eq 3 -o $num -eq 4 -o $num -eq 5 -o $num -eq 6 -o $num -eq 7 -o $num -eq 8 -o $num -eq 9 -o $num -eq 10 -o $num -eq 11 -o $num -eq 12 -o $num -eq 0 ]
        then repete=0    
        else
            repete=1
        fi
    done

    if [ $num -eq 1 ]
    then
        char=$1
        local=$2
        food=$3

        if test -z ${char}; then read -p "Qual o nome do personagem? " char; fi
        echo "Personagem = $char"
        echo ""

        if test -z ${local}; then read -p "Qual é o nome do local? " local; fi
        echo "Local = $local"
        echo ""

        if test -z ${food}; then read -p "Qual a sua comida favorita? " food; fi
        echo "Comida = $food"
        echo ""

        echo "Recentemente, ${char} foi visto em ${local} comendo ${food}!"
        echo ""
        num=0
    
    elif [ $num -eq 2 ]
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
        num=0

    elif [ $num -eq 3 ]
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
        num=0

    elif [ $num -eq 4 ]
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
        num=0

    elif [ $num -eq 5 ]
    then
        while :
        do
            echo "Você pode inserir texto e pressionar Enter quantas vezes quiser."
            echo "(Sair somente usando Ctrl+c)"
            read someText
            echo "Você digitou $someText"
            echo ""
        done
        echo ""
        num=0

    elif [ $num -eq 6 ]
    then
        someString=begin
        while [ "$someString" != "quit" ]
            do
            echo ""
            echo "Loop while"
            echo "Você pode inserir texte e pressionar Enter quantas vezes quiser."
            echo "(Digite \"quit\" para sair do loop)"
            read someString
            echo "Você digitou $someString"
            echo ""
        done
        echo ""
        num=0
    
    elif [ $num -eq 7 ]
    then
        read -p "Me diga o que você quer que eu descubra: " pala
        echo ""

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
        num=0

    elif [ $num -eq 8 ]
    then
        echo "Seu diretório atual é ${PWD}"
        echo "Use ele como base para o caminho do arquivo ou diretório."
        echo "Qual o arquivo ou diretório?"
        read arquivo
        echo ""

        if [[ ! -e ${arquivo} ]]; then
            echo "O caminho do arquivo ou diretório deve estar errado."
        else
            if [[ ! -d ${arquivo} ]]; then
                echo "O arquivo existe, mostrando agora o que há nele:"
                cat  ${arquivo}
            else
                echo "O diretório existe, mostrando agora o que tem nele:"
                ls -la  ${arquivo}
            fi
        fi
        echo ""
        num=0

    elif [ $num -eq 9 ]
    then
        echo "Deseja criar um diretório temp, um arquivo temp ou os dois?"
        echo "dir = Diretório temporário"
        echo "arq = Arquivo temporário"
        echo "duo = Diretório e arquivo temporários"
        read temp
        echo ""

        if [ $temp = dir ]
        then
            echo "Qual vai ser o nome do diretório temporário?"
            read dirtemp
            
            echo ""
            echo "Diretório criado com o nome: "
            mktemp -d ${dirtemp}XXX
            mktemp_rc=$?
            echo ""
            echo "O comando mktemp retornou: ${mktemp_rc}"
            if [[ $mktemp_rc = 0 ]]
            then
                echo "Foi possivel criar o diretório temporário."
            else
                echo "Não foi possivel criar o diretório temporário. "
            fi

        elif [ $temp = arq ]
        then
            echo "Qual vai ser o nome do arquivo temporário?"
            read arqtemp
            echo ""
            echo "Arquivo criado com o nome: ${arqtemp}"
            mktemp ${arqtemp}XXX
            mktemp_rc=$?
            echo ""
            echo "O comando mktemp retornou: ${mktemp_rc}"
            if [[ $mktemp_rc = 0 ]]
            then
                echo "Foi possivel criar o arquivo temporário."
            else
                echo "Não foi possivel criar o arquivo temporário. "
            fi

        else
            echo "Qual vai ser o nome do diretório temporário?"
            read dirtemp
            echo ""
            echo "Arquivo criado com o nome: ${dirtemp}"
            mktemp -d ${dirtemp}XXX
            mktemp_rc=$?
            echo ""
            echo "O comando mktemp retornou: ${mktemp_rc}"
            if [[ $mktemp_rc = 0 ]]
            then
                echo "Foi possivel criar o diretório temporário."
                echo ""

                echo "Qual vai ser o nome do arquivo temporário?"
                read arqtemp
                echo ""
                echo "Arquivo criado com o nome: ${arqtemp}"
                mktemp ${arqtemp}XXX
                mktemp_rc=$?
                echo ""
                echo "O comando mktemp retornou: ${mktemp_rc}"
                if [[ $mktemp_rc = 0 ]]
                then
                    echo "Foi possivel criar o arquivo temporário."
                else
                    echo "Não foi possivel criar o arquivo temporário. "
                fi

            else
                echo "Não foi possivel criar o diretório temporário. "
            fi
        fi
        echo ""
        num=0

    elif [ $num -eq 10 ]
    then
        if [ $# -ne 2 ]
        then
            echo "Seu diretório atual é ${PWD}"
            echo "Qual vai ser o nome do diretório?"
            read diretorio
            echo " "

            mkdir ${PWD}/${diretorio}
            mkdir_rc=$?
            echo ""
            echo "O comando mkdir retornou: $mkdir_rc"
            if [[ $mkdir_rc = 0 ]]
            then
                echo "Foi possivel criar o diretório ${diretorio}."
            else
                echo "Não foi possivel criar o diretório ${diretorio}."
            fi

            test -d ${PWD}/${diretorio}
            test_rc=$?
            echo ""
            echo "Já o test retornou: ${test_rc}"
            if [[ $test_rc = 0 ]]
            then
                echo "O diretório ${diretorio} existe."
            else
                echo "O diretório ${diretorio} não existe."
            fi
            echo ""

            echo "Qual vai ser o nome do arquivo?"
            echo "O arquivo vai ser criado dentro do ${PWD}/${diretorio}."
            read arquivo

            touch ${PWD}/${diretorio}/${arquivo}
            touch_rc=$?
            echo ""
            echo "O comando touch retornou: ${touch_rc}"
            if [[ $touch_rc -eq 0 ]]
            then
                echo "Foi possivel criar o arquivo ${arquivo}."
            else
                echo "Não foi possivel criar o arquivo ${arquivo}."
            fi

        else
            echo "Deseja criar um diretório com o nome $1 e um arquivo com $2?"
            echo "(Digite \"sim\" para cria-los)"
            read criardir
            echo ""

            if [[ $criardir = sim ]]
            then
                mkdir ${PWD}/${1}
                mkdir_rc=$?
                echo ""
                echo "O comando mkdir retornou: $mkdir_rc"
                if [[ $mkdir_rc = 0 ]]
                then
                    echo "Foi possivel criar o diretório ${1}."
                else
                    echo "Não foi possivel criar o diretório ${1}."
                fi

                test -d ${PWD}/${1}
                test_rc=$?
                echo ""
                echo "Já o test retornou: ${test_rc}"
                if [[ $test_rc = 0 ]]
                then
                    echo "O diretório ${1} existe."

                    touch ${PWD}/${diretorio}/${2}
                    touch_rc=$?
                    echo ""
                    echo "O comando touch retornou: ${touch_rc}"
                    if [[ $touch_rc -eq 0 ]]
                    then
                        echo "Foi possivel criar o arquivo ${2}."
                    else
                        echo "Não foi possivel criar o arquivo ${2}."
                    fi
                else
                    echo "O diretório ${diretorio} não existe."
                fi
                echo ""
            else
                echo "Seu diretório atual é ${PWD}"
                echo "Qual vai ser o nome do diretório?"
                read diretorio
                echo " "

                mkdir ${PWD}/${diretorio}
                mkdir_rc=$?
                echo ""
                echo "O comando mkdir retornou: $mkdir_rc"
                if [[ $mkdir_rc = 0 ]]
                then
                    echo "Foi possivel criar o diretório ${diretorio}."
                else
                    echo "Não foi possivel criar o diretório ${diretorio}."
                fi

                test -d ${PWD}/${diretorio}
                test_rc=$?
                echo ""
                echo "Já o test retornou: ${test_rc}"
                if [[ $test_rc = 0 ]]
                then
                    echo "O diretório ${diretorio} existe."
                else
                    echo "O diretório ${diretorio} não existe."
                fi
                echo ""

                echo "Qual vai ser o nome do arquivo?"
                echo "O arquivo vai ser criado dentro do ${PWD}/${diretorio}."
                read arquivo

                touch ${PWD}/${diretorio}/${arquivo}
                touch_rc=$?
                echo ""
                echo "O comando touch retornou: ${touch_rc}"
                if [[ $touch_rc -eq 0 ]]
                then
                    echo "Foi possivel criar o arquivo ${arquivo}."
                else
                    echo "Não foi possivel criar o arquivo ${arquivo}."
                fi
            fi
        fi
        echo ""
        num=0

    elif [ $num -eq 11 ]
    then
        echo "Quantas vezes gostaria de repetir o monitoramento da CPU?"
        echo "OBS: Deve ser > 0"
        read rep
        echo ""
        echo "Qual o intervalo em segundos entre os monitoramentos?"
        echo "OBS: Ideal que seja > 1"
        read seg
        echo ""
        date +'%A %d/%b/%y'

        for (( i=0; i<rep; i++ ))
        do
            date +%H:%M:%S
            echo "Uso da CPU: $(top -bn1 | grep -i cpu'(s)' | awk '{print $2}')"
            echo "Uso da memória: $(free -h | grep -i mem | awk '{print $3}')"
            echo "Espaço no disco /: $(df -h | grep /$ | awk '{print $4}')"
            echo ""
            if (( i!= (rep-1) ))
            then
                sleep $seg
            fi
        done
        num=0
    elif [ $num -eq 12 ]
    then
        rev_p=nao
        if [[ $# > 1 ]]
        then
            echo "Tem $# paramentros, que são:"
            for i in "$@"   # for (( i=1; i<$@; i++ ))
            do
                echo $i
            done
            echo ""

            echo "Deseja concatenar e usar esses $# parametros?"
            read rev_p
            echo ""

        elif [[ $# = 1 ]]
        then
            echo "Tem 1 parametro"
            echo "Deseja reverter $1?"
            read rev_p
            echo ""

        else
            echo "Não tem parametros"
            echo ""
        fi
        
        if [[ ${rev_p,,} != sim && ${rev_p,,} != s && ${rev_p,,} != yes && ${rev_p,,} != y ]]
        then
            echo "Qual vai ser a palavra revertida?"
            read pala
            echo ""
        else
            pala=$@
        fi

        echo "Sua palavra revertida é:"
        rev <<< $pala

        echo ""
        num=0

    elif [ $num -eq 0 ]
    then
        echo "Deseja sair?"
        read sair
        echo ""

        if [[ ${sair,,} != sair && ${sair,,} != sim && ${sair,,} != s && ${sair,,} != yes && ${sair,,} != y ]]
        then
            repete=1
        else
            echo "Cabô"
            exit 0
        fi
    fi
done