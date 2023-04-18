#!/usr/bin/bash

echo Making sure system is uptodate

sudo pacman -Syu --noconfirm

echo Installing packages
package_list=(vim base-devel git xorg lightdm lightdm-gtk-greeter networkmanager i3 dmenu thunar papirus-icon-theme adapta-gtk-theme)
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
