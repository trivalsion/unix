# Issues caused by the lack of GPU drivers on linux
* Laggy/sturdy cursor movement
* Laggy animations in different or all parts of the system
* Weird screen effects, stuttering and tearing during actions such as reboot, logout, shudown...



# Nvidia Drivers
* Information
	* `Noveau` - nvidia drivers that are open-source community coded Nvidia drivers which don't support all GPU technologies and normally have worse performance, but they are included in the linux kernel and so they are installed automatically in most cases
	* `Official Nvidia Drivers` - closed source official Nvidia linux drivers which have good performance and support all of the GPU's capabilites, but they need to be installed separately as they aren't included in distros or the kernel
		* When using official NVIDIA drivers, on GNOME on the login screen before logging in(entering the password) go to bottom right corner -> configuration button -> Select "GNOME on Xorg option". This is needed because official NVIDIA drivers work very bad with wayland which would otherwise be used by default.


## On Fedora
* Noveau drivers are installed by default if an Nvidia GPU is present in the PC and should be the latest version after `sudo dnf update` command
* [Official guide for installing/uninstallation proprietary NVIDIA drivers](https://rpmfusion.org/Howto/NVIDIA)
	* [Modern GPU's drivers installation guide section](https://rpmfusion.org/Howto/NVIDIA#Current_GeForce.2FQuadro.2FTesla)
		* Make sure to run "sudo dnf update && sudo dnf autoremove" and then reboot the PC before installing the drivers
		* If "sudo dnf install akmod-nvidia" driver installation step stops before it is finished or fails, just run it(the same command) again immediatly(!!! Without rebooting or clearing dnf cache !!!)	
		* ONLY X(x.org) display server is supported by Nvidia proprietary drivers
	* [Nvidia driver uninstallation guide section(returning to noveau)](https://rpmfusion.org/Howto/NVIDIA#Uninstall_the_NVIDIA_driver)
		* [Recovering from Nvidia drivers after uninstalling](https://rpmfusion.org/Howto/NVIDIA#Recover_from_NVIDIA_installer)
* [Unofficial unistallation guide](https://www.if-not-true-then-false.com/2015/fedora-nvidia-guide/3/)
