# !/bin/bash

inventario() {
    echo "Conta subdiretorios apartir do diretório atual"
    find . -type d | wc -l
    echo

    echo "O uso dos diretórios em ordem crescente"
    find . -type d | du | sort -nr
    echo

    echo "Número de arquivos"
    find . -type f | wc -l
    echo

    echo "O uso do arquivo"
    find . -type f -exec ls -al {} \; | sort -k 5 -nr | sed 's/ \+/\t/g' | cut -f5,9
    echo
}