#!/bin/bash
# A sledge hammer approach to ensuring the menu is updated.

ftp_server="10.184.185.249"
rm -rf /usr/sbin/men*
if [[ ! -f /usr/sbin/menu.sh ]]; then
echo "Updating the Field Diag Menu, Please wait..."
sudo wget -q --directory-prefix=/usr/sbin/ ftp://$ftp_server/menu.sh
sudo chmod +x /usr/sbin/menu.sh
else
echo "Something went wong. All your base are belong to us!" 
fi
