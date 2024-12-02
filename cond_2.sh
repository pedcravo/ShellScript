#!/bin/bash
# ./cond.sh para executar o shell

source biblioteca.sh || { echo "Erro ao carregar biblioteca.sh"; exit 1; }
source inventario.sh || { echo "Erro ao carregar inventario.sh"; exit 1; }
source monitorCPU.sh || { echo "Erro ao carregar monitorCPU.sh"; exit 1; }
source filtrar.sh || { echo "Erro ao carregar filtrar.sh"; exit 1; }

repete=1
while [ "$repete" != 0 ]
do
    clear
    
    echo ""
    echo "__________               .__             .__  .__ "
    echo "\______   \_____    _____|  |__     ____ |  | |__|"
    echo " |    |  _/\__  \  /  ___/  |  \  _/ ___\|  | |  |"  # Documentação: https://mange.ifrn.edu.br/shell-script-wikipedia/20-operadores-relacionais.html
    echo " |    |   \ / __ \_\___ \|   Y  \ \  \___|  |_|  |"  # Arte feita com: https://patorjk.com/software/taag/#p=display&f=Graffiti&t=Bash%20cli
    echo " |______  /(____  /____  >___|  /  \___  >____/__|"
    echo "        \/      \/     \/     \/       \/         2.0 "
    echo ""

    echo "Digite uma opção:"
    echo " 1 = História com IF e parâmetros prédefinidos"
    echo " 2 = História parâmetros prédefinidos e padrão"
    echo " 3 = Contador de parâmetros e caracteres com FOR"
    echo " 4 = Contador decrescente com FOR"
    echo " 5 = Contador crescente com WHILE"
    echo " 6 = Loop de cli com WHILE"
    echo " 7 = Verificar se arquivo ou diretório existe IF"
    echo " 8 = Visualizar o que há no arquivo ou diretório com IF, CAT e LS"
    echo " 9 = Criar diretório e arquivo temporários com IF e MKTEMP"
    echo "10 = Criar diretório e arquivo no local ${PWD} com IF, MKDIR e TOUCH"
    echo "11 = Faz backup de arquivos por filtragem com biblioteca, IF e CP"
    echo "12 = Mostra o uso do diretório atual e tudo que há nele com biblioteca"
    echo "13 = Monitor veloz e prático de status da CPU, memória e espaço no disco com comandos encadeiados"
    echo "14 = Monitor eficiente e completo de CPU, RAM, SWAP, disco e banda com biblioteca e SAR"
    echo "15 = Reverter palavras com REV e IF"
    echo "16 = Mostrar e apagar parâmetros com biblioteca importada, função e SHIFT"
    echo "17 = Mostrar o ID do usuário atual"
    echo " 0 = Sair"
    read num
    echo ""

    case "$num" in
        1)  echo " 1 = História com IF e parâmetros prédefinidos"

            char=$1
            local=$2
            food=$3

            if test -z ${char}; then read -p "Qual o nome do personagem? " char; fi
            echo "Personagem = $char"

            if test -z ${local}; then echo ""; read -p "Qual é o nome do local? " local; fi
            echo "Local = $local"

            if test -z ${food}; then echo ""; read -p "Qual a sua comida favorita? " food; fi
            echo "Comida = $food"

            echo ""
            echo "Recentemente, ${char} foi visto em ${local} comendo ${food}!"
            echo ""
            num=0
        ;;
        2)  echo " 2 = História parâmetros prédefinidos e padrão"

            char=${1:-Pedro}
            local=${2:-Vv}
            food=${3:-Pizza}

            echo "Personagem = $char"
            echo "Local = $local"
            echo "Comida = $food"
            echo ""
            echo "Recentemente, ${char} foi visto em ${local} comendo ${food}!"
            echo ""
            num=0
        ;;
        3)  echo " 3 = Contador de parâmetros e caracteres com FOR"

            echo O primeiro parâmetros é ${1:?Parâmetro 1 não fornecido!}
            echo O segundo parâmetros é ${2:?Parâmentro 2 não fornecido!}
            echo O terceiro parâmetros é ${3:?Parâmentro 3 não fornrcido!}
            echo ""
            echo Você usou os seguintes $# parâmetros:
            count=(0)

            for i in "$@"
            do  
                echo $i
                count=$((count+${#i}))
            done
            echo Total de caracteres: $count
            echo ""
            num=0
        ;;
        4)  echo " 4 = Contador decrescente com FOR"

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
        ;;
        5)  echo " 5 = Contador crescente com WHILE"
            
            i=1
            while (( $i <= 100 ))
                do
                if [ $i = 50 ]
                then
                    echo "\$i = $i <--------------------"
                else
                    echo "\$i = $i"
                fi
                i=$(( i+1 ))
            done
            echo ""
            num=0
        ;;
        6)  echo " 6 = Loop de cli com WHILE"
            
            string_repete=loop
            i=1
            while [[ ${string_repete,,} != "sair" ]]
                do
                echo "Quantidade de vezes vistas: $i"
                echo "Você pode inserir qualquer texto e pressionar Enter quantas vezes quiser."
                echo "(Digite \"sair\" para sair do loop)"
                read string_repete
                echo ""
                echo "Ultima palavra digitada: $string_repete"
                i=$(( i+1 ))
            done
            echo ""
            num=0
        ;;            
        7)  echo " 7 = Verificar se arquivo ou diretório existe IF"

            echo "Seu diretório atual é $PWD"
            echo "Me diga o caminho do diretório ou arquivo e te direi se ele existe:"
            read pala
            echo ""

            if test -f $pala
            then
                echo "$pala existe e é um arquivo"
            
                #test -d ${pala}
                #test_r=$?
                #[ -d ${pala} ]
                #simple_r=$?
                #[[ -d ${pala} ]]
                #extended_r=$?
                #echo "Os códigos de retorno são: ${test_r}, ${simple_r}, ${extended_r}."

            elif [ -d $pala ]
            then
                echo "$pala existe e é um diretório"
    
            else
                echo "Não encontrei o arquivo ou diretório $pala."
            fi
            
            echo ""
            num=0
        ;;
        8)  echo " 8 = Visualizar o que há no arquivo ou diretório com IF, CAT e LS"
    
            echo "Seu diretório atual é ${PWD}"
            echo "Use ele como exemplo para escrever o caminho do arquivo ou diretório."
            echo "Qual o arquivo ou diretório?"
            read arquivo
            echo ""

            if [[ ! -e ${arquivo} ]]; then
                echo "O caminho do arquivo ou diretório deve estar errado, verifique com a opção 7."
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
        ;;
        9)  echo " 9 = Criar diretório e arquivo temporários com IF e MKTEMP"
    
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
                mktemp -d ${dirtemp}XXX
                mktemp_dir=$?
                echo ""

                echo "O comando mktemp retornou: ${mktemp_dir}"
                if [[ $mktemp_dir = 0 ]]
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

                mktemp ${arqtemp}XXX
                mktemp_arq=$?
                echo ""

                echo "O comando mktemp retornou: ${mktemp_arq}"
                if [[ $mktemp_arq = 0 ]]
                then
                    echo "Foi possivel criar o arquivo temporário."
                else
                    echo "Não foi possivel criar o arquivo temporário. "
                fi

            elif [ $temp = duo ]
            then
                echo "Qual vai ser o nome do diretório temporário?"
                read dirtemp
                echo ""

                mktemp -d ${dirtemp}XXX
                mktemp_dir=$?
                echo ""

                echo "O comando mktemp retornou: ${mktemp_dir}"
                if [[ $mktemp_dir = 0 ]]
                then
                    echo "Foi possivel criar o diretório temporário."
                    echo ""

                    echo "Qual vai ser o nome do arquivo temporário?"
                    read arqtemp
                    echo ""

                    mktemp ${arqtemp}XXX
                    mktemp_arq=$?
                    echo ""

                    echo "O comando mktemp retornou: ${mktemp_arq}"
                    if [[ $mktemp_arq = 0 ]]
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
        ;;
        10) echo "10 = Criar diretório e arquivo no local ${PWD} com IF, MKDIR e TOUCH"

            diretorio=$1
            arquivo=$2

            if [ $# -ne 2 ]
            then
                echo "Seu local atual é ${PWD}"
                echo "Vamos criar o diretório neste local."
                echo "Qual vai ser o nome do diretório?"
                read diretorio
                echo " "

                mkdir ${PWD}/${diretorio}
                mkdir_rc=$?

                echo "O comando mkdir retornou: $mkdir_rc"
                if [[ $mkdir_rc = 0 ]]
                then
                    echo "Foi possivel criar o diretório $diretorio."

                    test -d ${PWD}/${diretorio}
                    test_rc=$?
                else
                    echo "Não foi possivel criar o diretório $diretorio."
                    echo ""

                    echo "Verificando se o diretório já existe ..."
                    test -d ${PWD}/${diretorio}
                    test_rc=$?
                    echo ""
                fi
            
                if [[ $test_rc = 0 ]]
                then
                    echo "O diretório $diretorio existe."
                    echo ""

                    echo "Qual vai ser o nome do arquivo?"
                    read arquivo
                    echo " "

                    touch ${PWD}/${diretorio}/${arquivo}
                    touch_rc=$?

                    echo "O comando touch retornou: ${touch_rc}"
                    if [[ $touch_rc -eq 0 ]]
                    then
                        echo "Arquivo $arquivo criado com sucesso."
                    else
                        echo "Não foi possivel criar o arquivo $arquivo."
                    fi
                else
                    echo "O diretório $diretorio não existe."
                fi

            else
                echo "Deseja criar um diretório com o nome $diretorio e um arquivo com nome $arquivo?"
                echo "(Digite \"sim\" para cria-los)"
                read criardir
                echo ""

                if [[ ${criardir,,} = sim || ${criardir,,} = s ]]
                then
                    mkdir ${PWD}/${diretorio}
                    mkdir_rc=$?

                    echo "O comando mkdir retornou: $mkdir_rc"
                    if [[ $mkdir_rc = 0 ]]
                    then
                        echo "Foi possivel criar o diretório $diretorio."

                        test -d ${PWD}/${diretorio}
                        test_rc=$?
                    else
                        echo "Não foi possivel criar o diretório $diretorio."
                        echo ""

                        echo "Verificando se o diretório já existe ..."
                        test -d ${PWD}/${diretorio}
                        test_rc=$?
                        echo ""
                    fi

                    if [[ $test_rc = 0 ]]
                    then
                        echo "O diretório $diretorio existe."
                        echo " "

                        touch ${PWD}/${diretorio}/${arquivo}
                        touch_rc=$?
                        
                        echo "O comando touch retornou: ${touch_rc}"
                        if [[ $touch_rc -eq 0 ]]
                        then
                            echo "Arquivo $arquivo criado com sucesso."
                        else
                            echo "Não foi possivel criar o arquivo $arquivo."
                        fi
                    else
                        echo "O diretório $diretorio não existe."
                    fi

                else
                    echo "Seu local atual é ${PWD}"
                    echo "Vamos criar o diretório neste local."
                    echo "Qual vai ser o nome do diretório?"
                    read diretorio
                    echo " "

                    mkdir ${PWD}/${diretorio}
                    mkdir_rc=$?
                    echo ""

                    echo "O comando mkdir retornou: $mkdir_rc"
                    if [[ $mkdir_rc = 0 ]]
                    then
                        echo "Foi possivel criar o diretório $diretorio."

                        test -d ${PWD}/${diretorio}
                        test_rc=$?
                    else
                        echo "Não foi possivel criar o diretório $diretorio."
                        echo ""

                        echo "Verificando se o diretório já existe ..."
                        test -d ${PWD}/${diretorio}
                        test_rc=$?
                        echo ""
                    fi

                    if [[ $test_rc = 0 ]]
                    then
                        echo "O diretório $diretorio existe."
                        echo ""

                        echo "Qual vai ser o nome do arquivo?"
                        read arquivo
                        echo " "

                        touch ${PWD}/${diretorio}/${arquivo}
                        touch_rc=$?

                        echo "O comando touch retornou: ${touch_rc}"
                        if [[ $touch_rc -eq 0 ]]
                        then
                            echo "Arquivo $arquivo criado com sucesso."
                        else
                            echo "Não foi possivel criar o arquivo $arquivo."
                        fi
                    else
                        echo "O diretório $diretorio não existe."
                    fi
                fi
            fi
            echo ""
            num=0
        ;;
        11) echo "11 = Faz backup de arquivos por filtragem com biblioteca, IF e CP"
              
            filtrar_cp

            echo ""
            num=0
        ;;
        12) echo "12 = Mostra o uso do diretório atual e tudo que há nele com biblioteca"
    
            inventario
            
            echo ""
            num=0
        ;;
        13) echo "13 = Monitor veloz e prático de status da CPU, memória e espaço no disco com comandos encadeiados"

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
                echo ""
                date +%H:%M:%S
                echo "Uso da CPU: $(top -bn1 | grep -i cpu'(s)' | awk '{print $2}')"
                echo "Uso da memória: $(free -h | grep -i mem | awk '{print $3}')"
                echo "Espaço no disco /: $(df -h | grep /$ | awk '{print $4}')"
                echo ""

                if (( i!= (rep-1) ))
                then
                    echo "----------------------------------------------------------------------------------------------------------"
                    echo ""
                    echo "Delay de ${seg}s . . ."
                    sleep $seg
                    echo ""
                    echo "----------------------------------------------------------------------------------------------------------"
                fi
            done
            num=0
        ;;            
        14) echo "14 = Monitor eficiente e completo de CPU, RAM, SWAP, disco e banda com biblioteca e SAR"
        
            echo "Quantas vezes gostaria de repetir o monitoramento da CPU?"
            echo "OBS: Deve ser > 0"
            read rep
            echo ""
            echo "Qual o intervalo em segundos entre os monitoramentos?"
            echo "OBS: Ideal que seja > 1"
            read seg

            for (( i=0; i<rep; i++ ))
            do  
                echo ""
                func_monitorar
                echo ""

                if (( i!= (rep-1) ))
                then
                    echo "----------------------------------------------------------------------------------------------------------"
                    echo ""
                    echo "Delay de ${seg}s . . ."
                    sleep $seg
                    echo ""
                    echo "----------------------------------------------------------------------------------------------------------"
                fi
            done
            num=0
        ;;
        15) echo "15 = Reverter palavras com REV e IF"
    
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
            echo "Total de caracteres: ${#pala}"

            echo ""
            num=0
        ;;
        16) echo "16 = Mostrar e apagar parâmetros com biblioteca importada, função e SHIFT"

            shift_param $@
            echo ""
            num=0
        ;;
        17) echo "17 = Mostrar o ID do usuário atual"   
            
            echo "Seu ID: $EUID"
            echo "Seu usuário é $USER"
            if [ $EUID -eq 0 ]
            then
                echo "Lembre-se que com grandes poderes vem grandes responsabilidades!!"
            else
                echo "Você é um usuário comum, fique de boas."
            fi

            echo ""
            num=0
        ;;
    esac
        if [ $num -eq 0 ]
        then
            echo "Deseja sair e fechar o cli?"
            read sair
            echo 

            if [[ ${sair,,} = sair || ${sair,,} = sim || ${sair,,} = s || ${sair,,} = yes || ${sair,,} = y ]]
            then
                echo "Cli feito por @pedcravo"
                echo "Cabô"
                repete=0
            fi
        fi
done
exit 0