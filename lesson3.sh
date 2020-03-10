#!/bin/bash

# This is show the ip address of the machine.

NAME="Bablu"
clear
IP=`ifconfig | grep 'broadcast' | awk '{print $2}'`

echo "Your IP address is" $IP

