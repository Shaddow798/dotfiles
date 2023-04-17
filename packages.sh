#!/usr/bin/bash

echo Installing packages
package_list=(firefox vim nano)
for package in package_list do
	if pacman -Qs $package > /dev/null ; then
		echo "The package $package is installed"
	else
  		echo "The package $package is not installed"
fi

