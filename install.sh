#! /usr/bin/bash

arch_runner () {
	sh packages.sh
	echo Done
}


# Check to make sure the user is running a supported operating system.
if [ -f "/etc/arch-release" ]; then
	echo You are running Arch Linux do you want to continue,
	arch_runner
else
 echo Error unsuported operating system.
fi




