#!/bin/bash

clear

NAME="Bablu Kumar"

#Who are you?
WHO=$(whoami)

# IP Address
IP=`ifconfig | grep 'broadcast' | awk '{print $2}'`

# Interface
INTFCE=`ifconfig | grep 'enp' | awk '{print $1}' | cut -d ':' -f1`

echo "========================"
echo "Name:" $NAME
echo "User:" $WHO
echo "IP:" $IP
echo "Interface:" $INTFCE
echo
echo "Checking your internet connectivity..."

# Check Internet connectivity with Google
echo "Please choose a domain to ping."
read -p "Domain: " DOMAIN


# if the input is empty
if [ -z $DOMAIN ]; then
	echo
	echo -e "\e[1;34m################\e[0m"  #31=red, 32=green, 33=yellow, 34=blue, 35=magenta, 36=cyan
	echo -e "\e[1;31m#Invalid Choice#\e[0m"
	echo -e "\e[1;34m################\e[0m"
	echo
	exit
fi

ping $DOMAIN -c 5 >> tmp

SHORT=`cat tmp | grep 'time=' | awk '{print $8}' | cut -d "=" -f2 | sort | head -n 1`
LONG=`cat tmp | grep 'time=' | awk '{print $8}' | cut -d "=" -f2 | sort | tail -n 1`

echo "Fastest Connectivity:" $SHORT "ms"
echo "Slowest Connectivity:" $LONG "ms"
echo "========================"
rm -rf tmp
