#!/bin/bash
source color.sh $1 $2 $3 $4


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

echo -e "${parametr[0]}${parametr[1]}HOSTNAME = ${f_normal}${parametr[2]}${parametr[3]}$HOSTNAME${f_normal}"
echo -e "${parametr[0]}${parametr[1]}TIMEZONE = ${f_normal}${parametr[2]}${parametr[3]}$TIMEZON${f_normal}"
echo -e "${parametr[0]}${parametr[1]}USER = ${f_normal}${parametr[2]}${parametr[3]}$USER${f_normal}"
echo -e "${parametr[0]}${parametr[1]}OS = ${f_normal}${parametr[2]}${parametr[3]}$OS${f_normal}"
echo -e "${parametr[0]}${parametr[1]}DATA = ${f_normal}${parametr[2]}${parametr[3]}$DATA${f_normal}"
echo -e "${parametr[0]}${parametr[1]}UPTIME = ${f_normal}${parametr[2]}${parametr[3]}$UPTIME${f_normal}"
echo -e "${parametr[0]}${parametr[1]}UPTIME_SEC = ${f_normal}${parametr[2]}${parametr[3]}$UPTIME_SEC${f_normal}"
echo -e "${parametr[0]}${parametr[1]}IP = ${f_normal}${parametr[2]}${parametr[3]}$IP${f_normal}"
echo -e "${parametr[0]}${parametr[1]}MASK = ${f_normal}${parametr[2]}${parametr[3]}$MASK${f_normal}"
echo -e "${parametr[0]}${parametr[1]}GATWAY = ${f_normal}${parametr[2]}${parametr[3]}$GATEWAY${f_normal}"
echo -e "${parametr[0]}${parametr[1]}RAM_TOTAL = ${f_normal}${parametr[2]}${parametr[3]}$RAM_TOTAL${f_normal}"
echo -e "${parametr[0]}${parametr[1]}RAM_USED = ${f_normal}${parametr[2]}${parametr[3]}$RAM_USED${f_normal}"
echo -e "${parametr[0]}${parametr[1]}RAM_FREE = ${f_normal}${parametr[2]}${parametr[3]}$RAM_FREE${f_normal}"
echo -e "${parametr[0]}${parametr[1]}SPASE_ROOT = ${f_normal}${parametr[2]}${parametr[3]}$space_root${f_normal}"
echo -e "${parametr[0]}${parametr[1]}SPASE_ROOT_USER = ${f_normal}${parametr[2]}${parametr[3]}$space_root_used${f_normal}"
echo -e "${parametr[0]}${parametr[1]}SPASE_ROOT_FREE = ${f_normal}${parametr[2]}${parametr[3]}$space_root_free${f_normal}"