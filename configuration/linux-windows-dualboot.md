# DualBoot
## DualBoot Setup Guide
1. Install windows
2. Windows -> Win+R -> diskmgmt.msc -> Right click on the Windows partition(!!! Disk C:, NOT any other partition !!!) -> Shrink Volume -> Type in the new shrinked(smaller) size for the Windows partition to free up space for Linux(make sure that at least 10 GB are left free on windows parition after shrinkage, so if there are 50 GB currently taken up on disk C:, leave at least 60 GB on the shrinked windows partition so that 10 GB are free) -> Follow through through the dialogue window
3. Install Linux partition on freed up space
	* Fedora
		1. In the Fedora installer(before the installation process) go to "Installation Destination"
		2. Choose the disk where windows partition was shrinked to fit linux
		3. Choose "Custom" option in "Storage Configuration"
		4. Click "Done"
		5. Set "Encrypt my data" point to be On
		6. Click "Click here to create them automatically" button and make sure that windows's partitions weren't touched(shrinked/removed) in the new disk layout
		7. Click "Done" and follow through
		* Guides
			* https://www.tecmint.com/install-fedora-with-windows-dual-boot/
			* https://youtu.be/b0gFfm2p25E


## DualBoot Fixes
* Fixing problems in case Windows' EFI partition was accidentaly deleted, during installation of Linux, which is basically a Windows bootloader and it's deletion would prevent Windows from booting or showing up in the boot menu
	* [Stack Exchange](https://unix.stackexchange.com/questions/671607/deleted-the-windows-efi-partition-what-to-do)
	* [Microsoft Forums](https://answers.microsoft.com/en-us/windows/forum/all/accidentally-deleted-windows-10-boot-partition-how/181745f9-3303-4968-9851-5c213db9c89c)
* A Linux Live USB Image run on a computer could be used to reinstall grub if it was overwritten by windows(instruction not finished, ask on forums)
* [How To Fix Multiboot Systems | CTT](https://youtu.be/3oQfnNhk7qU)
* [How to Fix Dual Boot Problems | CTT](https://youtu.be/gEB6JEYZekE)
