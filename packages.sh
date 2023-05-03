#!/usr/bin/bash

echo Making sure system is uptodate

sudo pacman -Syu --noconfirm

echo Installing packages
package_list=(vim base-devel git xorg lightdm lightdm-gtk-greeter networkmanager i3 dmenu thunar papirus-icon-theme adapta-gtk-theme picom polybar python-pywal ttf-font-awesome ttf-dejavu i3lock-color imagemagick dunst zsh maim xclip)
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
sudo pacman -S --needed --noconfirm ${packages_install[@]} > /dev/null

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

package_list_aur=(ttf-siji betterlockscreen ohmyzsh)
for package in ${package_list_aur[@]}; do
	if pacman -Qs $package > /dev/null ; then
		# echo "The package $package is installed"
		echo > /dev/null
	else
  		# echo "The package $package is not installed"
		packages_install_aur+=($package)
	fi
done
yay -S --needed --noconfirm ${packages_install[@]} > /dev/null


# Zsh Configuation
ZSHRC=~/.zshrc
if test -f "$FILE"; then
    echo "$FILE exists."
fi


# sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
