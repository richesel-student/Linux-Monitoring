#!/bin/bash

argv[0]=$1
argv[1]=$2
argv[2]=$3
argv[3]=$4

for (( i = 0; i <$#; i++ ))
do 
    if [[ ${argv[i]} -le 0 || ${argv[i]} -ge 7 ]]
        then
        echo -e "1-white, 2-red, 3-green, 4-blue, 5-puprle, 6-black\nRestart run the script"
        exit 1
    fi
done

if [[ $# == 4 ]]
    then
    if [[ $1 -eq $2 || $3 -eq $4 ]]
        then
        echo -e "Error\nRun the script again"
       exit 1
        else
        chmod +x print.sh
        chmod +x supp.sh
        chmod +x color.sh
        bash supp.sh
        bash color.sh
        bash print.sh $1 $2 $3 $4
    fi
else
    echo "Error, the scriot cannot be run whit 4 parametrs "
    exit 1
fi


