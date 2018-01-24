#!/bin/bash
# 检查一个IP地址是否合法

function check_ip(){
    local IP=$1
    VALID_CHECK=$(echo $IP |awk -F. '$1<=255&&$2<=255&&$3<=255$4<=255{print "yes"}')
    if echo $IP |grep -E "^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$" >/dev/null;then
        if [ $VALID_CHECK=="yes" ];then
            echo "IP $IP available."
            return 0
        else
            echo "IP $IP is not available!"
            return 1
        fi
    else
        echo "IP farmat error!"
        return 1
    fi
}

while true;do
    read -p "Please enter IP: " IP
    check_ip $IP
    [ $? -eq 0 ] && break
done