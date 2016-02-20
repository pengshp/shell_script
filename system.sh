#!/bin/bash
#获取操作系统信息
#2016-2
#pengshp

#操作系统类型
os=$(uname -o)
printf "操作系统类型: %s\n" "$os"
#发行版本
os_name=$(cat /etc/issue)
printf "发行版本: %s\n" "$os_name"
#CPU架构
architecture=$(uname -m)
printf "CPU架构: %s\n" "$architecture"
#内核
kernerrelease=$(uname -r)
printf "内核版本: %s\n" "$kernerrelease"
#主机名
hostname=$(uname -n)
printf "主机名: %s\n" "$hostname"
#内网ＩＰ
ip=$(hostname -I |awk -F ' ' '{print $1}')
printf "内网ＩＰ: %s\n" "$ip"
#查看公网ＩＰ
IP=$(curl -s http://ipecho.net/plain)
printf "公网ＩＰ: %s\n" "$IP"
#ＤＮＳ地址
nameservers=$(cat /etc/resolv.conf |grep -E "\<nameserver[ ]+"|awk '{print $NF}')
printf "ＤＮＳ地址: %s\n" "$nameservers"
#判断网络通畅
intnet=$(ping -c 2 www.baidu.com &>/dev/null && echo "Internet Connected!" ||echo "Internet Disconnected!")
printf "网络通畅: %s\n" "$intnet"
#登陆用户数
name_cnt=$(who |wc -l)
printf "登陆用户数: %s\n" "$name_cnt"
#操作系统内存
system_mem_usages=$(awk '/MemTotal/{total=$2}/MemFree/{free=$2}END{print (total-free)/1024}' /proc/meminfo)
printf "操作系统内存: %s\n" "$system_mem_usages"
