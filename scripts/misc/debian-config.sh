#! /bin/bash
## Shell script which configures Debian Linux OS


## Post-Installation configuration ##
read -pr "Username: " sudo_username

if [ "$USER" == root ]
	then
		apt update && apt upgrade
		apt install sudo
		/sbin/usermod -aG sudo "$sudo_username"
		touch root/.bashrc
		echo 'export PATH=$PATH:/usr/sbin' >> root/.bashrc
		echo "Reboot - /sbin/reboot now"
	else
		touch "$HOME"/.bashrc
		echo 'export PATH=$PATH:/usr/sbin' >> "$HOME"/.bashrc
fi



## Notes ##
# Links #
# [CD/Netinst(small, requires internet connection)](https://www.debian.org/distrib/netinst)
# [DVD(large, does not require internet connection)](https://www.debian.org/CD/http-ftp/#stable (Under DVD section))

# Fixes #
# [No internet, despite a connection being present](https://askubuntu.com/a/330159)
# [Apt cdrom repository error](https://askubuntu.com/a/803509)

# Software Selection during installation:
#	* If not on server: unselect print and ssh server(as they are useless for the desktop)
#	* If installing without a Desktop environment: unselect all desctop environements including "Debian Desktop Environment"

# Usage #
# [Backporting software to debian - installing new software versions on stable debian(stable debian without backuports ships with certain version and does not upgrade it except for security)](https://wiki.debian.org/Backports)
#	* [Backporting kernel and firmware](https://unix.stackexchange.com/a/545609)
# [Debian Gnome comes with Wayland](https://wiki.debian.org/Wayland)
# [Pipewire](https://wiki.debian.org/PipeWire)
