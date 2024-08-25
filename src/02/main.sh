#!/bin/bash

HOSTNAME="$(hostname)"
TIMEZON="$(cat /etc/timezone) $(date +"UTC %-:::z")"
USER="$USER"
OS="$(uname)"
DATA=""$(date '+%d %B %T')
UPTIME="$(uptime -p)"
UPTIME_SEC="$(awk '{print $1}' /proc/uptime)"
IP="$(hostname -I)" 
MASK="$(route -n | sed -n '4'p | awk '{printf $3}')"
GATEWAY="$(ip route | grep "\default via"\ | awk '{print $3}')"
RAM_TOTAL="$(cat /proc/meminfo | awk '$1=="MemTotal:" {printf ("%.3f GB\n", $2/1024^2)}')"
RAM_USED="$(vmstat -s | awk '$3=="used"&&$4=="memory" {printf ("%.3f GB\n", $1/1024^2)}')"
RAM_FREE="$(vmstat -s | awk '$3=="free"&&$4=="memory" {printf ("%.3f GB\n", $1/1024^2)}')"
space_root="$(df -m /root/ | awk '/\/$/ {printf("%.2f MB",$2)}')"
space_root_used="$(df -m /root/ | awk '/\/$/ {printf("%.2f MB",$3)}')"
space_root_free="$(df -hk | grep "\/$" | awk '{printf("%.2f\n",$4 / 1024)}') Mb"

run_func() {
    echo "HOSTNAME = "$HOSTNAME
    echo "TIMEZON = "$TIMEZON
    echo "USER = "$USER
    echo "OS = "$OS
    echo "DATA = "$DATA
    echo "UPTIME = "$UPTIME
    echo "UPTIME_SEC = "$UPTIME_SEC
    echo "IP = "$IP
    echo "MASK = "$MASK
    echo "GATEWAY = "$GATEWAY
    echo "RAM_TOTAL = " $RAM_TOTAL
    echo "RAM_USED = " $RAM_USED
    echo "RAM_FREE = "$RAM_FREE
    echo "SPACE_ROOT = " $space_root
    echo "SPASE_ROOT_USED = "$space_root_used
    echo "SPASE_ROOT_FREE = "$space_root_free
}


choice(){
    echo "Do you want to save the output to a file?"
    read res
    if [[ $res == "Y" || $res == "y" ]]; then
        file=$( date +"%d_%m_%Y_%H_%M_%S".status)
        run_func > $file
    else
        echo "Error"
    fi
}
run_func
choice


