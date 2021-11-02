#!/bin/bash
# This script will look for the menu script on within /usr/sbin and if it doesn't find it pull it from a given FTP server.

ftp_server="4.4.4.4"

if [[ ! -f /usr/sbin/menu.sh ]]; then
echo "Field Diag Menu Does Not Exist, Adding Now"
sudo wget --directory-prefix=/usr/sbin/ ftp://$ftp_server/menu.sh
sudo chmod +x /usr/sbin/menu.sh
else
echo "Field Diag Menu Already Exists, No Changes Made" 
fi
