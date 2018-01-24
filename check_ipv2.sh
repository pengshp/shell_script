#!/bin/bash
CheckIPAddr()
{
	echo $1|grep "^[0-9]\{1,3\}\.\([0-9]\{1,3\}\.\)\{2\}[0-9]\{1,3\}$" > /dev/null; 
	#IP地址必须为全数字 
    if [ $? -ne 0 ] 
    then 
        return 1 
    fi 
    ipaddr=$1 
    a=`echo $ipaddr|awk -F . '{print $1}'`  #以"."分隔，取出每个列的值 
    b=`echo $ipaddr|awk -F . '{print $2}'` 
    c=`echo $ipaddr|awk -F . '{print $3}'` 
    d=`echo $ipaddr|awk -F . '{print $4}'` 
    for num in $a $b $c $d 
    do 
        if [ $num -gt 255 ] || [ $num -lt 0 ]    #每个数值必须在0-255之间 
        then 
            return 1 
        fi 
    done 
         return 0 
} 
if [ $# -ne 1 ];then            #判断传参数量 
    echo "Usage: $0 ipaddress." 
    exit 
else 
	CheckIPAddr $1 
fi
