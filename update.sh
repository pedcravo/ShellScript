# !bin/bash

CONFIG_FILE=Archive/Files_To_Backup

BASEDEST=Archive/backup

DAY=$(date +%d)
MONTH=$(date +%m)
TIME1=$(date +%k)
TIME2=$(date +%M)

mkdir -p $BASEDEST/$MONTH/$DAY

DESTINATION=$BASEDEST/$MONTH/$DAY/backup$TIME1:$TIME2.tar.gz

echo
echo "STATUS: $CONFIG"

if [ -f $CONFIG_FILE ]
then
    echo "OK"
    echo
    echo "Continuando..."
    echo
else
    echo "ERRO"
    echo "Backup não concluído devido à falta de arquivo de configuração"
    echo
    exit 1
fi

FILE_NO=1
exec < $CONFIG_FILE

read FILE_NAME
while [ $? -eq 0 ]
do
    if [ -f $FILE_NAME -o -d $FILE_NAME ]
    then
        FILE_LIST="$FILE_LIST $FILE_NAME"
    else
        echo "$FILE_NAME, não existe"
        echo "Está listado na linha $FILE_NO do arquivo de configuração."
        echo "Continuando a contruir lista de arquivos..."
        echo
    fi

    FILE_NO=$[$FILE_NO + 1]
    read FILE_NAME

done

echo "Arquivo inicial..."

tar -czf $DESTINATION $FILE_LIST 2> /dev/null

echo
echo "Backup finalizado!"
echo "O arquivo resultante é: $DESTINATION"

exit