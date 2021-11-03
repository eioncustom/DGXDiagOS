#!/bin/bash
ftp_server="4.4.4.4"
menuSum=$(md5sum /usr/sbin/menu.sh|awk '{print $1}')
sudo wget -q --directory-prefix=/tmp/ ftp://$ftp_server/menu.sh
menuCheck=$(md5sum /tmp/menu.sh|awk '{print $1}')

if [[ ! -f /usr/sbin/menu.sh ]]; then
echo "Field Diag Menu Does Not Exist, Adding Now"
sudo wget -q --directory-prefix=/usr/sbin/ ftp://$ftp_server/menu.sh
sudo chmod +x /usr/sbin/menu.sh
elif [[ $md5sum == $menuCheck ]]; then
	echo "Field Diag Menu Already Exists, Measuring Checksum" 
	sleep 2
	echo "Field Diag Menu is Current, Continuing..."
elif [[ $md5sum != $menuCheck ]]; then
	echo "Field Diag Menus is not current release, updating..."
	sudo rm -rf /usr/sbin/menu.sh
	sudo wget -q --directory-prefix=/usr/sbin/ ftp://$ftp_server/menu.sh
sleep 3
echo "Field Diag Menu System is ready for use."
fi
