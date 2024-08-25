#!/bin/bash
source color.conf

if [[ $# == 0 ]]
    then        
        chmod +x print.sh
        chmod +x supp.sh
        chmod +x color.sh
        chmod +x color_sys.sh
        bash supp.sh
        bash color.sh
        bash print.sh $column1_background $column1_font_color $column2_background $column2_font_color
        bash color_sys.sh
    
else
    echo "Error, no arguments "
    exit 1
fi


