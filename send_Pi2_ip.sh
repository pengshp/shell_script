#!/usr/bin/bash

smail(){
MAIL=shell_curl@163.com
mail -s "Archlinux_Pi2" $MAIL << EOF
========================
Report Time: `date`
Curent User: `whoami`
IP Address: `ifconfig wlan0 |sed -n '2,2p' |awk '{print substr($2,1)}'`
Enjoy it!
Send by Archlinux Pi2!
========================
EOF
}
smail
