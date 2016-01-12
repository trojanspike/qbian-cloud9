#!/usr/bin/env bash

if [ ! -f /root/qbian.conf ];then
	echo "Error : qbian.conf not found"
	exit 1
fi

source /root/qbian.conf
chmod +x /root/_Provisioning/*
IS_DEVICE=$1
DEBIAN_FRONTEND=noninteractive
function provision_qemu(){
	/root/_Provisioning/provision-qemu
}

function provision_device(){
	/root/_Provisioning/provision-device
}

### Run some logic or run a script
if [ "$IS_DEVICE" == true ]; then
 	echo "Running provision for device environment :"
	#
	# Note : the default provision script I have in the default image will create a folder /qbianProvision
	# And create a file when the provision has ran, either $(cat ~/release)-qemu or $(cat ~/release)-device
	# Depending on env
	# Here's an example of over riding it for when we want to run both provision in device-mode
	if [ ! -f /qbianProvision/$(cat ~/release)-qemu ];then
		provision_qemu && touch /qbianProvision/$(cat ~/release)-qemu && provision_device
		# Remember to create the provision file
	else
		provision_device
	fi
else
 	echo "Running provision for qemu environment :"
	provision_qemu
fi

exit 0
