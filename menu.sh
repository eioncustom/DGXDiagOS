#!/bin/bash
## This script is desiged to help a Server Engineer Test, Diagnose and Gather Logs from the Nvidia DGX-2 DiagOS
## The script will prompt the user for what testing they would like to perform. Runs the tests and upon completion will package then upload the test results to a FTP Server
## The log file can also be uploaded to another server with SCP or your favorite transport protocol

ftp_server="4.4.4.4/logs/"
SerNum=$(sudo dmidecode -s system-serial-number)
dt=$(date '+%d.%m.%Y.%H.%M')
host=$(hostname)


gpumemFunc () {
echo "Starting GPU Memory Testing, please wait..."
sudo ./fieldiag.sh --run_on_error --test gpumem
sudo tar -zcf /tmp/$host.$SerNum.$dt.tar.xz /var/diags/629-FLD03-2987-510/fieldiag.log /var/diags/629-FLD03-2987-510/logs/* /var/diags/629-FLD03-2987-510/dgx/logs*
chmod 777 $host.$SerNum.$dt.tar.xz;curl -T /tmp/$host.$SerNum.$dt.tar.xz ftp://$ftp_server

echo " "
echo " "
echo "+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+"
echo "| Check ftp://$ftp_server for your log files, $host.$SerNum.$dt.tar.xz."
echo "| Files cleaned up. Thanks for the fish and don't forget your towel!"
echo "+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+"
echo " "
echo " "
}

gpuperFunc () {
echo "Starting GPU Performance Switch Testing, please wait..."
sudo ./fieldiag.sh --run_on_error --test gpuperfswitch
sudo tar -zcf /tmp/$host.$SerNum.$dt.tar.xz /var/diags/629-FLD03-2987-510/fieldiag.log /var/diags/629-FLD03-2987-510/logs/* /var/diags/629-FLD03-2987-510/dgx/logs*
chmod 777 $host.$SerNum.$dt.tar.xz;curl -T /tmp/$host.$SerNum.$dt.tar.xz ftp://$ftp_server

echo " "
echo " "
echo "+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+"
echo "| Check ftp://$ftp_server for your log files, $host.$SerNum.$dt.tar.xz."
echo "| Files cleaned up. Thanks for the fish and don't forget your towel!"
echo "+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+"
echo " "
echo " "
}

cudacoresFunc () {
echo "Starting Cuda Core Testing, please wait..."
sudo ./fieldiag.sh --run_on_error --test cudacores
sudo tar -zcf /tmp/$host.$SerNum.$dt.tar.xz /var/diags/629-FLD03-2987-510/fieldiag.log /var/diags/629-FLD03-2987-510/logs/* /var/diags/629-FLD03-2987-510/dgx/logs*
chmod 777 $host.$SerNum.$dt.tar.xz;curl -T /tmp/$host.$SerNum.$dt.tar.xz ftp://$ftp_server

echo " "
echo " "
echo "+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+"
echo "| Check ftp://$ftp_server for your log files, $host.$SerNum.$dt.tar.xz."
echo "| Files cleaned up. Thanks for the fish and don't forget your towel!"
echo "+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+"
echo " "
echo " "
}

nvlinkFunc () {
echo "Starting NVLink Testing, please wait..."
sudo ./fieldiag.sh --run_on_error --test nvlink
sudo tar -zcf /tmp/$host.$SerNum.$dt.tar.xz /var/diags/629-FLD03-2987-510/fieldiag.log /var/diags/629-FLD03-2987-510/logs/* /var/diags/629-FLD03-2987-510/dgx/logs*
chmod 777 $host.$SerNum.$dt.tar.xz;curl -T /tmp/$host.$SerNum.$dt.tar.xz ftp://$ftp_server

echo " "
echo " "
echo "+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+"
echo "| Check ftp://$ftp_server for your log files, $host.$SerNum.$dt.tar.xz."
echo "| Files cleaned up. Thanks for the fish and don't forget your towel!"
echo "+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+"
echo " "
echo " "
}

nvswitchFunc () {
echo "Starting NV Switch Testing, please wait..."
sudo ./fieldiag.sh --run_on_error --test nvswitch
sudo tar -zcf /tmp/$host.$SerNum.$dt.tar.xz /var/diags/629-FLD03-2987-510/fieldiag.log /var/diags/629-FLD03-2987-510/logs/* /var/diags/629-FLD03-2987-510/dgx/logs*
chmod 777 $host.$SerNum.$dt.tar.xz;curl -T /tmp/$host.$SerNum.$dt.tar.xz ftp://$ftp_server

echo " "
echo " "
echo "+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+"
echo "| Check ftp://$ftp_server for your log files, $host.$SerNum.$dt.tar.xz."
echo "| Files cleaned up. Thanks for the fish and don't forget your towel!"
echo "+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+"
echo " "
echo " "
}

gpustressFunc () {
echo "Starting GPU Stress Testing, please wait..."
sudo ./fieldiag.sh --run_on_error --test gpustress
sudo tar -zcf /tmp/$host.$SerNum.$dt.tar.xz /var/diags/629-FLD03-2987-510/fieldiag.log /var/diags/629-FLD03-2987-510/logs/* /var/diags/629-FLD03-2987-510/dgx/logs*
chmod 777 $host.$SerNum.$dt.tar.xz;curl -T /tmp/$host.$SerNum.$dt.tar.xz ftp://$ftp_server

echo " "
echo " "
echo "+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+"
echo "| Check ftp://$ftp_server for your log files, $host.$SerNum.$dt.tar.xz."
echo "| Files cleaned up. Thanks for the fish and don't forget your towel!"
echo "+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+"
echo " "
echo " "
}

pcieFunc () {
echo "Starting PCIe Testing, please wait..."
sudo ./fieldiag.sh --run_on_error --test pcie
sudo tar -zcf /tmp/$host.$SerNum.$dt.tar.xz /var/diags/629-FLD03-2987-510/fieldiag.log /var/diags/629-FLD03-2987-510/logs/* /var/diags/629-FLD03-2987-510/dgx/logs*
chmod 777 $host.$SerNum.$dt.tar.xz;curl -T /tmp/$host.$SerNum.$dt.tar.xz ftp://$ftp_server

echo " "
echo " "
echo "+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+"
echo "| Check ftp://$ftp_server for your log files, $host.$SerNum.$dt.tar.xz."
echo "| Files cleaned up. Thanks for the fish and don't forget your towel!"
echo "+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+"
echo " "
echo " "
}

powerFunc () {
echo "Starting Power Testing, please wait..."
sudo ./fieldiag.sh --run_on_error --test power
sudo tar -zcf /tmp/$host.$SerNum.$dt.tar.xz /var/diags/629-FLD03-2987-510/fieldiag.log /var/diags/629-FLD03-2987-510/logs/* /var/diags/629-FLD03-2987-510/dgx/logs*
chmod 777 $host.$SerNum.$dt.tar.xz;curl -T /tmp/$host.$SerNum.$dt.tar.xz ftp://$ftp_server

echo " "
echo " "
echo "+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+"
echo "| Check ftp://$ftp_server for your log files, $host.$SerNum.$dt.tar.xz."
echo "| Files cleaned up. Thanks for the fish and don't forget your towel!"
echo "+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+"
echo " "
echo " "
}

gpuheatFunc () {
echo "Starting GPU Heat Sink Testing, please wait..."
sudo ./fieldiag.sh --run_on_error --test gpuheatsink
sudo tar -zcf /tmp/$host.$SerNum.$dt.tar.xz /var/diags/629-FLD03-2987-510/fieldiag.log /var/diags/629-FLD03-2987-510/logs/* /var/diags/629-FLD03-2987-510/dgx/logs*
chmod 777 $host.$SerNum.$dt.tar.xz;curl -T /tmp/$host.$SerNum.$dt.tar.xz ftp://$ftp_server

echo " "
echo " "
echo "+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+"
echo "| Check ftp://$ftp_server for your log files, $host.$SerNum.$dt.tar.xz."
echo "| Files cleaned up. Thanks for the fish and don't forget your towel!"
echo "+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+"
echo " "
echo " "
}

videoFunc () {
echo "Starting Video Testing, please wait..."
sudo ./fieldiag.sh --run_on_error --test video
sudo tar -zcf /tmp/$host.$SerNum.$dt.tar.xz /var/diags/629-FLD03-2987-510/fieldiag.log /var/diags/629-FLD03-2987-510/logs/* /var/diags/629-FLD03-2987-510/dgx/logs*
chmod 777 $host.$SerNum.$dt.tar.xz;curl -T /tmp/$host.$SerNum.$dt.tar.xz ftp://$ftp_server

echo " "
echo " "
echo "+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+"
echo "| Check ftp://$ftp_server for your log files, $host.$SerNum.$dt.tar.xz."
echo "| Files cleaned up. Thanks for the fish and don't forget your towel!"
echo "+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+"
echo " "
echo " "
}

connFunc () {
echo "Starting the Connectivity Test, please wait..."
sudo ./fieldiag.sh --run_on_error --test connectivity
sudo tar -zcf /tmp/$host.$SerNum.$dt.tar.xz /var/diags/629-FLD03-2987-510/fieldiag.log /var/diags/629-FLD03-2987-510/logs/* /var/diags/629-FLD03-2987-510/dgx/logs*
chmod 777 $host.$SerNum.$dt.tar.xz;curl -T /tmp/$host.$SerNum.$dt.tar.xz ftp://$ftp_server

echo " "
echo " "
echo "+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+"
echo "| Check ftp://$ftp_server for your log files, $host.$SerNum.$dt.tar.xz."
echo "| Files cleaned up. Thanks for the fish and don't forget your towel!"
echo "+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+"
echo " "
echo " "
}

quickFunc () {
echo "Starting the Quick Check Suite Tests, please wait..."
sudo ./fieldiag.sh --run_on_error --test quickcheck
sudo tar -zcf /tmp/$host.$SerNum.$dt.tar.xz /var/diags/629-FLD03-2987-510/fieldiag.log /var/diags/629-FLD03-2987-510/logs/* /var/diags/629-FLD03-2987-510/dgx/logs*
chmod 777 $host.$SerNum.$dt.tar.xz;curl -T /tmp/$host.$SerNum.$dt.tar.xz ftp://$ftp_server

echo " "
echo " "
echo "+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+"
echo "| Check ftp://$ftp_server for your log files, $host.$SerNum.$dt.tar.xz."
echo "| Files cleaned up. Thanks for the fish and don't forget your towel!"
echo "+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+"
echo " "
echo " "
}

fullFunc () {
echo "Starting the Level 1 Suite Tests, please wait..."
sudo ./fieldiag.sh --run_on_error --level1
sudo tar -zcf /tmp/$host.$SerNum.$dt.tar.xz /var/diags/629-FLD03-2987-510/fieldiag.log /var/diags/629-FLD03-2987-510/logs/* /var/diags/629-FLD03-2987-510/dgx/logs*
chmod 777 $host.$SerNum.$dt.tar.xz;curl -T /tmp/$host.$SerNum.$dt.tar.xz ftp://$ftp_server

echo " "
echo " "
echo "+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+"
echo "| Check ftp://$ftp_server for your log files, $host.$SerNum.$dt.tar.xz."
echo "| Files cleaned up. Thanks for the fish and don't forget your towel!"
echo "+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+"
echo " "
echo " "
}

fullFunc2 () {
echo "Starting the Level 2 Suite Tests, please wait..."
sudo ./fieldiag.sh --run_on_error --level2
sudo tar -zcf /tmp/$host.$SerNum.$dt.tar.xz /var/diags/629-FLD03-2987-510/fieldiag.log /var/diags/629-FLD03-2987-510/logs/* /var/diags/629-FLD03-2987-510/dgx/logs*
chmod 777 $host.$SerNum.$dt.tar.xz;curl -T /tmp/$host.$SerNum.$dt.tar.xz ftp://$ftp_server

echo " "
echo " "
echo "+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+"
echo "| Check ftp://$ftp_server for your log files, $host.$SerNum.$dt.tar.xz."
echo "| Files cleaned up. Thanks for the fish and don't forget your towel!"
echo "+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+"
echo " "
echo " "
}

thermalFunc() {
echo "Starting the Thermal Testing, please wait..."
sudo ./fieldiag.sh --run_on_error --test thermal
sudo tar -zcf /tmp/$host.$SerNum.$dt.tar.xz /var/diags/629-FLD03-2987-510/fieldiag.log /var/diags/629-FLD03-2987-510/logs/* /var/diags/629-FLD03-2987-510/dgx/logs*
chmod 777 $host.$SerNum.$dt.tar.xz;curl -T /tmp/$host.$SerNum.$dt.tar.xz ftp://$ftp_server

echo " "
echo " "
echo "+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+"
echo "| Check ftp://$ftp_server for your log files, $host.$SerNum.$dt.tar.xz."
echo "| Files cleaned up. Thanks for the fish and don't forget your towel!"
echo "+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+"
echo " "
echo " "
}

echo "Checking pre-requisites, please wait..."
sleep 3
if [ -d "/var/diags/629-FLD03-2987-510/" ]; then
	echo "Field Diags Already Prepped"
	cd /var/diags/629-FLD03-2987-510/
	echo " "
	sleep 2
elif [ ! -d "/var/diags/629-FLD03-2987-510/" ]; then
	echo "Prepping Field Diags for usages, please wait.."
	cd /var/diags/;sudo tar xfz 629-FLD03-2987-510.tgz;cd 629-FLD03-2987-510
	echo " "
	sleep 2
fi

if [[ $1 == 1 ]]; then
	gpumemFunc;exit
elif [[ $1 == 2 ]]; then
	gpustressFunc;exit
elif [[ $1 == 3 ]]; then
	nvlinkFunc;exit
elif [[ $1 == 4 ]]; then
	nvswitchFunc;exit
elif [[ $1 == 5 ]]; then
	cudacoresFunc;exit
elif [[ $1 == 6 ]]; then
	gpuperFunc;exit
elif [[ $1 == 7 ]]; then
	gpuheatFunc;exit
elif [[ $1 == 8 ]]; then
	thermalFunc;exit
elif [[ $1 == 9 ]]; then
	videoFunc;exit
elif [[ $1 == 10 ]]; then
	powerFunc;exit
elif [[ $1 == 11 ]]; then
	pcieFunc;exit
elif [[ $1 == 12 ]]; then
	connFunc;exit
elif [[ $1 == 13 ]]; then
	quickFunc;exit
elif [[ $1 == 14 ]]; then
	fullFunc;exit
elif [[ $1 == 15 ]]; then
	fullFunc2;exit
fi

echo 'What test would you like to run today?'
echo '======================================'
echo ' 1. GPU Memory Test (~8m)'
echo ' 2. GPU Stress Test (~9m)'
echo ' 3. NVLink Test (~30m)'
echo ' 4. NV Switch Test (~13m)'
echo ' 5. Cuda Core Test (~5m)'
echo ' 6. GPU Performance Switch Test (~3m)'
echo ' 7. GPU Heat Sink Test (~8m)'
echo ' 8. Thermal Test (~2h 15m)'
echo ' 9. Video Test (~3m)'
echo ' 10. Power Test (~48m)'
echo ' 11. PCIe Test (~11m)'
echo ' 12. Connectivity Test (~10m)'
echo ' 13. Quick Check Suite (~40m)'
echo ' 14. Complete Suite Lvl 1 (~2h 35m)'
echo ' 15. Complete Suite Lvl 2 (~4h 50m)'
echo ' '
echo ' Any option not listed will exit script.'
read -p '=> ' runFunc

# Anything other than a defined options will exit the script.

if [[ $runFunc == 1 ]]; then
	gpumemFunc
elif [[ $runFunc == 2 ]]; then
	gpustressFunc
elif [[ $runFunc == 3 ]]; then
	nvlinkFunc
elif [[ $runFunc == 4 ]]; then
	nvswitchFunc
elif [[ $runFunc == 5 ]]; then
	cudacoresFunc
elif [[ $runFunc == 6 ]]; then
	gpuperFunc
elif [[ $runFunc == 7 ]]; then
	gpuheatFunc
elif [[ $runFunc == 8 ]]; then
	thermalFunc
elif [[ $runFunc == 9 ]]; then
	videoFunc
elif [[ $runFunc == 10 ]]; then
	powerFunc
elif [[ $runFunc == 11 ]]; then
	pcieFunc
elif [[ $runFunc == 12 ]]; then
	connFunc
elif [[ $runFunc == 13 ]]; then
	quickFunc
elif [[ $runFunc == 14 ]]; then
	fullFunc
elif [[ $runFunc == 15 ]]; then
	fullFunc2
else
	echo -e "\e[1;31mUnsupported Answer, come back with a good answer or I will not start testing.\e[0m"
	exit
fi
