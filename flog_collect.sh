#!/bin/bash
host=$(hostname)
tstamp=$(date +%F-%s)
ftp_server="4.4.4.4"

sudo chmod 777 /var/diags/629-FLD03-2987-510/logs/log*
sudo tar -zcvf /tmp/$host-$tstamp.tar.xz /var/diags/629-FLD03-2987-510/fieldiag.log /var/diags/629-FLD03-2987-510/logs/* /var/diags/629-FLD03-2987-510/dgx/logs*
sudo chmod 777 $host-$tstamp.tar.xz;curl -T /tmp/$host-$tstamp.tar.xz ftp://$ftp_server/logs/
sudo rm $host-$tstamp.tar.xz;sudo rm flog_collect.sh

echo " "
echo " "
echo "+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+ "
echo "| Check ftp://$ftp_server/logs/ for your log files, $host-$tstamp.tar.xz."
echo "| Files cleaned up. Thanks for the fish and don't forget your towel!"
echo "+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+ "
echo " "
echo " "
