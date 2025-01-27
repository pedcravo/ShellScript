# Pensei em fazer um daemon que:
# - Ao iniciar o computador abre um terminal e pergunta qual o projeto git vai usar.
# - A cada n minutos executa o comando "git log" para ver a árvore de commits em "tempo real".
#
# Deixar rodando na tela de fundo.

local=$1
while [ "$local" != "sair" ]
do
    clear

    if [[ ! -d ${local} ]]; then
        cd
        pwd
        echo "Insira o caminho para o repositório Git ou digite 'sair':"
        read -e local;
        ls -la "$local" 2>/dev/null || { if [[ $local == "sair" ]]; then echo "Saindo.."; else echo "Diretório inválido!"; fi; }
    else
        cd ${local}
        echo "Monitorando repositório: $local"
        while true; do
            git --no-pager log --oneline --graph --all || exit 1
            sleep 120
            #clear
        done
    fi
done