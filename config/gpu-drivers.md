# Information
*  **If the PC has Intel CPU-integrated GPU or an AMD GPU** - the drivers for both of them are a part of the Linux kernel and will be installed on Fedora(or other Linux distribution) by default and will work flawlessly with both Wayland and Xorg.
	* **Wayland should be used** when using Intel or AMD GPU as Wayland is faster, newer, safer and much better adapted for GNOME than Xorg, the only reason to use Xorg being NVIDIA GPUs with NVIDIA drivers(as they work badly with Wayland) and legacy applications.
* **Nouveau** - nvidia drivers that are open-source community coded Nvidia drivers which don't support all GPU technologies and normally have worse performance, but they are included in the linux kernel and so they are installed automatically in most cases
	* To check wether Nouvaeu drivers are currently used by Linux: Terminal -> "lsmod | grep nouveau", this will probably give out a list of several modules, the presence of nouveau drivers will be confirmed if there would be a module named "nouveau"
* **Official NVIDIA Drivers** - closed source official Nvidia linux drivers which have good performance and support all of the GPU's capabilites, but they need to be installed separately as they aren't included in distros or the kernel
	* To check wether NVIDIA drivers are currently installed and are used by the Linux: Terminal -> "lsmod | grep nvidia", this will probably give out a list of several modules, the presence of NVIDIA drivers will be confirmed if there would be a module named "nvidia" 
	* **When using official NVIDIA drivers**, on GNOME on the login screen before logging in(entering the password) go to bottom right corner -> configuration button -> Select "GNOME on Xorg option". This is needed because official NVIDIA drivers currently work very badly with wayland which would otherwise be used by default.
	
	
## Issues caused by the lack of GPU drivers on linux
* Laggy/sturdy cursor movement
* Laggy animations in different or all parts of the system
* Weird screen effects, stuttering and tearing during actions such as reboot, logout, shudown...



# Nvidia Drivers
## On Fedora
* Noveau drivers are installed by default if an Nvidia GPU is present in the PC and should be the latest version after `sudo dnf update` command
* [Official guide for installing/uninstallation proprietary NVIDIA drivers](https://rpmfusion.org/Howto/NVIDIA)
	* [Modern GPU's drivers installation guide section](https://rpmfusion.org/Howto/NVIDIA#Current_GeForce.2FQuadro.2FTesla)
		* Make sure to run "sudo dnf update && sudo dnf autoremove" and then reboot the PC before installing the drivers
		* If "sudo dnf install akmod-nvidia" driver installation step stops before it is finished or fails, just run it(the same command) again immediatly(!!! Without rebooting or clearing dnf cache !!!)	
		* ONLY X(x.org) display server is, without issues, supported by NVIDIA proprietary drivers
	* [Nvidia driver uninstallation guide section(returning to noveau)](https://rpmfusion.org/Howto/NVIDIA#Uninstall_the_NVIDIA_driver)
		* [Recovering from Nvidia drivers after uninstalling](https://rpmfusion.org/Howto/NVIDIA#Recover_from_NVIDIA_installer)
* [Unofficial unistallation guide](https://www.if-not-true-then-false.com/2015/fedora-nvidia-guide/3/)


## Issue fixes
* **Issue:** when the computer turns on, the login screen is blank(grey or other default color of the login screen)
	* **Reason:** The issue occurs because by default Wayland being is used for the login screen even if Xorg will be used after the login and official NVIDIA drivers have issues interacting with Wayland
	* **Fix:**
		* [Fedora Forum Link](https://discussion.fedoraproject.org/t/nvidia-driver-530-41-03-black-login-screen/80244)
			* [Comment with the fix](https://discussion.fedoraproject.org/t/nvidia-driver-530-41-03-black-login-screen/80244/2)
		1. ```sudo nano /etc/gdm/custom.config # open the config file that determines graphical display manger(login screen) being used```
		2. Uncomment the line "Wayland Enable=false" in the opened file, save it and close it
		3. Reboot the computer
	* **Issue:** usually if the above issue occurs there is also another issue of a phantom monitor(a monitor which shows up in settings, but does not exist in the real life, phantom monitor might cause issues as the system will interpret it as real and may for example open some applications on it) being present in the system.
	* **Reason:** NVIDIA drivers issues
	* **Fix:**
		* [Reddit Post Link(The solution is in the post itself, NOT the comments)](https://www.reddit.com/r/Fedora/comments/jo19yq/fedora_33_empty_login_screen_after_nvidia_drivers/)
		1. In terminal type ```xrandr -q```(xrandr might not be installed by default and will have to be installed with a package manager "sudo dnf install xrandr")
		2. Above command will output a list of monitors, look through all monitors with the status "connected" and identify the identifier(the first thing in the line for each monitor e.g. HDMI-0 or None-1-1) of the phantom monitor(phantom monitor can be spotted by for example a weird identifier or a resolution different from existing monitors(usually 800x600))
		3. List the Xorg config files with ```ls /etc/X11/xorg.conf.d/``` and if `01-display.conf` does not exist, create it with - ```sudo nano /etc/X11/xorg.conf.d/01-display.conf```(or call it 02-display.conf if 01 exists)
		4. In the file opened above add
		```
		Section "Monitor"
		 Identifier "[identifier of the phantom monitor]"
		 Option "Ignore" "true"
		 Option "Enable" "false"
		EndSection
		```
		5. Save and close the file
		6. Reboot the computer
