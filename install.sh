#! /usr/bin/bash

apperance () {
	echo setting apperance related configuation filesi
	cp config/gtk/settings.ini ~/.config/gtk-3.0/settings.ini
	mkdir -p ~/.config/picom/
	cp config/picom.conf ~/.config/picom/picom.conf
	mkdir -p ~/.local/wallpapers/
	cp -r wallpaper/ ~/.local/wallpapers
	wal -i ~/.local/wallpapers/mountaingrey.jpg > /dev/null
	mkdir -p ~/.config/i3/
	cp config/i3/config ~/.config/i3/config
	mkdir -p ~/.config/polybar
	cp config/polybar/config.ini ~/.config/polybar/config.ini
	#betterlockscreen -w ~/.local/wallpapers/lock.jpg
}


arch_runner () {
	sh packages.sh
	echo Packages completed
}

echo This script will configure archlinux
echo This script will modify your system in ways that cannot easily be undone
echo This script comes with zero warrenty use at your own risk
echo 
echo


# Warn user then ask for consent
read -p "Are you sure? [N/y]" -n 1 -r
echo    # (optional) move to a new line
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
	exit 1
fi



# Check to make sure the user is running a supported operating system.
if [ -f "/etc/arch-release" ]; then
	echo System is compatiable continuing
	arch_runner
	apperance
else
 echo Error unsuported operating system.
fi




