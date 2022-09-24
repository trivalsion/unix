# DualBoot
## DualBoot Setup Guide
1. Install windows
2. Windows -> Win+R -> diskmgmt.msc -> Shrink Windows partition to free up space for linux(make sure that at least 10 GB free are left on windows parition, so if there are 50 needed for windows, leave 60 so 10 are free)
3. Install Linux partition on freed up space
* Fedora
	1. Go to "Installation Destination"
	2. Choose the disk where windows partition was shrinked to fit linux
	3. Choose "Custom" option in "Storage Configuration"
	4. Click "Create Automatically" option and make sure that windows' partitions were untouched
	5. Click "Done"
	* https://www.tecmint.com/install-fedora-with-windows-dual-boot/
	* https://youtu.be/b0gFfm2p25E

## DualBoot Fixes
* A Linux Live USB Image run on a computer could be used to reinstall grub if it was overwritten by windows(instruction not finished, ask on forums)
* [How To Fix Multiboot Systems | CTT](https://youtu.be/3oQfnNhk7qU)
* [How to Fix Dual Boot Problems | CTT](https://youtu.be/gEB6JEYZekE)
