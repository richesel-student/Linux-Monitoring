#!/bin/bash
#Цвет тексата
white='\033[97m'
red='\033[91m'
green='\033[92m'
blue='\033[94m'
purple='\033[95m'
black='\033[30m'

#Цвет фона
f_white='\033[107m'
f_red='\033[101m'
f_green='\033[102m'
f_blue='\033[104m'
f_purple='\033[105m'
f_black='\033[40m'
f_normal='\e[0m'

argv[0]=$1
argv[1]=$2
argv[2]=$3
argv[3]=$4

for i in 0 2
do 
if [[ ${argv[$i]} -eq 1 ]]
    then
    parametr[i]=$f_white
fi

if [[ ${argv[$i]} -eq 2 ]]
    then
    parametr[i]=$f_red
fi

if [[ ${argv[$i]} -eq 3 ]]
    then
    parametr[i]=$f_green
fi

if [[ ${argv[$i]} -eq 4 ]]
    then
    parametr[i]=$f_blue
fi

if [[ ${argv[$i]} -eq 5 ]]
    then
    parametr[i]=$f_purple
fi

if [[ ${argv[$i]} -eq 6 ]]
    then
    parametr[i]=$f_black
fi
done

for i in 1 3
do
if [[ ${argv[$i]} -eq 1 ]]
    then
    parametr[i]=$white
fi

if [[ ${argv[$i]} -eq 2 ]]
    then
    parametr[i]=$red
fi


if [[ ${argv[$i]} -eq 3 ]]
    then
    parametr[i]=$green
fi


if [[ ${argv[$i]} -eq 4 ]]
    then
    parametr[i]=$blue
fi


if [[ ${argv[$i]} -eq 5 ]]
    then
    parametr[i]=$purple
fi


if [[ ${argv[$i]} -eq 6 ]]
    then
    parametr[i]=$black
fi
done


    
    
    
