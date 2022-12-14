#! /bin/bash
#
# Coded by Khai Phan
#
# Email: khaiphan9x@gmail.com
#
# Auto installer script for 
# dropbear
#
#

clear
cd /tmp
echo "Ban dang su dung script tu dong cai dat Dropbear cho Debian va Ubuntu duoc viet boi Khai Phan"
echo "================================================="
echo "" 
echo "Dang cap nhat tai nguyen..."
apt-get update  > /dev/null 2>&1
echo ""
echo "Bat dau cai dat Dropbear"
echo ""
apt-get -y install dropbear ssh
sed -i 's/NO_START\=1/NO_START\=0/g' /etc/default/dropbear
sed -i 's/DROPBEAR_PORT\=22/DROPBEAR_PORT\=442/g' /etc/default/dropbear
sed -i 's/DROPBEAR_EXTRA_ARGS\=/DROPBEAR_EXTRA_ARGS\=\"\-p 442 \-p 80 \-p 8080 \-p 8484 \-p 143 \-p 109\"/g' /etc/default/dropbear
sed -i 's/#PermitRootLogin prohibit\-password/PermitRootLogin yes/g' /etc/ssh/sshd_config
sed -i 's/PermitRootLogin without\-password/PermitRootLogin yes/g' /etc/ssh/sshd_config
sed -i 's/#PermitRootLogin no/PermitRootLogin yes/g' /etc/ssh/sshd_config
sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config
service dropbear start
service sshd restart
echo ""
echo ""
echo "Da hoan thanh cai dat Dropbear"
echo "Dropbear dang chay tren port: 442, 80, 8080, 8484, 143, 109"
echo "Hay tao 1 user moi de su dung"
echo ""
echo "Dang khoi dong lai server..."
echo ""
sleep 5 ; reboot
