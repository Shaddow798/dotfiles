#!/bin/bash

vpnfile=/home/sam/.config/openvpn/openvpn.ovpn

input=$(echo -e "No\nYes" | dmenu -p "Would you like to connect to openvpn")


connect () {
if [ $input == Yes ]; then
	notify-send "Connecting to VPN"
	pkexec openvpn $vpnfile
	notify-send "Disconected From VPN"
else
	notify-send "Not Connecting"
fi
}

running () {
	killquestion=$(echo -e "No\nYes" | dmenu -p "Openvpn is allready running, would you like to end it?")
	if [ $killquestion == Yes ]; then
	pkexec killall -q openvpn
	fi
}

if pgrep -x openvpn > /dev/null
then
	running
else
	connect
fi
