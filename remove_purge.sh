#!/bin/bash
#Function:卸载不必要的配置文件
#说明：请以root 运行
date
echo "正在清除......"
sudo dpkg -l|grep "^rc"|awk '{print $2}' |xargs aptitude -y purge
sudo apt-get autoremove
sudo apt-get clean
echo "残留的配置文件已清除！"
