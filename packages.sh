#!/usr/bin/bash

echo Making sure system is uptodate

sudo pacman -Syu --noconfirm

echo Installing packages
package_list=(vim base-devel git xorg lightdm lightdm-gtk-greeter networkmanager i3 dmenu thunar papirus-icon-theme adapta-gtk-theme picom polybar python-pywal ttf-font-awesome ttf-dejavu)
for package in ${package_list[@]}; do
	if pacman -Qs $package > /dev/null ; then
		# echo "The package $package is installed"
		echo > /dev/null
	else
  		# echo "The package $package is not installed"
		packages_install+=($package)
	fi
done
echo Installing needed packages
sudo pacman -S --needed ${packages_install[@]};

if pacman -Qs yay > /dev/null ; then
	echo Yay is installed no need to install it
else
	echo Installing yay
	mkdir -p ~/.local/packages
	cd ~/.local/packages
	git clone https://aur.archlinux.org/yay.git 
	cd yay 
	makepkg -si 
fi
