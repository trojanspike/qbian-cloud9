#!/usr/bin/env bash
COMMAND=$1 # if [$COMMD = start | stop | reload]

WORK_DIR=~/
PORT=8080

ENV="develop"

eth0=$(cat /sys/class/net/eth0/operstate); # up | down
wlan0=$(cat /sys/class/net/wlan0/operstate); # up | down

###

if [ "$COMMAND" == "start" ];then
	if [ -d ~/.c9sdk ];then
		forever start ~/.c9sdk/server.js -p $PORT -l 0.0.0.0  -w $WORK_DIR --collab true --packed false -a :
	else
		sleep 7 && clear && \
		echo -e "Cloud9 IDE not install yet. Install now ? [y/n]" && \
		read INSTALL
		if [ -z "$INSATLL" ] && [ "$INSTALL" == "y" ];then
			echo -e "Install cloud9 IDE , this will take a while to complete. Go chill :)" && sleep 8 && \
			c9-install
		fi
	fi
fi

if [ "$COMMAND" == "reload" ];then
	echo "reload" # cd ~/Server && npm run service-reload
fi

if [ "$COMMAND" == "stop" ];then
	echo "stop" # cd ~/Server && npm run service-stop
fi
