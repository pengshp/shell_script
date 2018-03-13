#!/bin/bash  
# Vmware install vmtools  
sudo apt-get update  
sudo apt-get upgrade  
echo "Do go and mount your cdrom from the VMware menu"  
echo "press any key to continue"  
read -n 1 -s  
mount /dev/cdrom  
cd /media/cdrom0  
cp VMwareTools-*.tar.gz /tmp  
cd /tmp  
tar xvzf VMwareTools-*.tar.gz  
cd vmware-tools-distrib/  
sudo apt-get install --no-install-recommends libglib2.0-0  
sudo apt-get install --no-install-recommends build-essential  
sudo apt-get install --no-install-recommends gcc linux-headers-`uname -r`  
sudo ./vmware-install.pl
  
sudo /etc/init.d/networking stop  
sudo rmmod pcnet32  
sudo rmmod vmxnet  
sudo modprobe vmxnet  
sudo /etc/init.d/networking start