#!/bin/bash

dpkg -s net-tools &> /dev/null
if [[ $? != 0 ]]
    then
        echo "Need to install net-tools [y/n]"
        read answer
        if [[ $answer == "Y" || $answer == "y" ]]
            then
            sudo apt install net-tools &>/dev/null
        else
            bash main.sh
        fi
fi