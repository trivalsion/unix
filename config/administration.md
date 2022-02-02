# ["Ubuntu Server" Linux Configuration](https://ubuntu.com/server/docs)
1. Start the live installer in safe graphics mode
2. Select default options in the ubuntu installer except:
	* When selecting drive to install `uncheck` the `LVM` option
3. Update the system
    * 	```
		sudo apt update && sudo apt upgrade && sudo apt autoremove
		```
4. [Format the drives that are present in addition to the main one](#partition-drives)
5. [Mount all of the additional drives](#mount-drives)
6. [Remove and disable snaps](#remove-snaps)
7. [Setup SSH](#ssh)
8. [Setup SMB](#smb)
* **Error:** On boot the login prompt might be not shown(seem like freeze)
	* **Fix:** Press enter several times and wait for login prompt to appear



# Services
## SSH
* Install SSH on Debian-based Linux
    1.  ```sh
        sudo apt install -y ssh-server
        sudo systemctl status ssh
        ```
    2. (Ubuntu Server only) Allow ssh through the firewall
        *   ```sh
            sudo ufw allow ssh
            ```
* Remove SSH
    * RHEL
        *   ```sh
            chkconfig sshd off
            service sshd stop
            sudo dnf remove openssh-server
            ```
    * Debian
        *   ```sh
            sudo apt-get --purge remove openssh-server
            ```


## SMB
* [Samba Docs Guide](https://wiki.samba.org/index.php/Setting_up_Samba_as_a_Standalone_Server)
* [Samba Docs Guide 2](https://wiki.samba.org/index.php/Setting_up_a_Share_Using_POSIX_ACLs)
* [Comprehensive Samba Guide](https://www.digitalocean.com/community/tutorials/how-to-set-up-a-samba-share-for-a-small-organization-on-ubuntu-16-04)
* [Samba Setup Basics](https://www.techrepublic.com/article/how-to-set-up-quick-and-easy-file-sharing-with-samba/)
* PC Setup
	* Assign a static IP to the computer through routers settings
	* Enable SSH on the computer
	* Add a normal password to the admin
	* [Format all data drives to ext4](#partition-drives) and [mount them using fstab(using UUID) in media/folder](#mount-drives)
* Samba setup is located in private config file
* Remove smb
    * Ubuntu
        *   ```sh
            sudo apt purge samba samba-common
            ```


## Remove snaps
*   ```sh
    snap list
    sudo snap remove --purge <package> # Order of removal: apps(<app-name>, do only if some are installed), lxd, core*, snapd
    sudo apt purge snapd && sudo apt autoremove
    sudo apt-mark hold snapd
    # Do next three steps only if the snap folders are still mounted and/or present
    sudo umount /snap/snapd/XXXX       # Replace XXXX with ID of a snap direcotry(find by runnning "df")
    sudo umount /var/snap
    sudo rm -rf ~/snap /snap /var/snap /var/lib/snapd /var/cache/snapd
    ```
* Links
	* [Complete removal](https://cialu.net/how-to-disable-and-remove-completely-snaps-in-ubuntu-linux/)
	* [Extra removal steps](https://techwiser.com/remove-snap-ubuntu/amp/)



# Hardware
## Partition drives
*Note:* replace sd* with the selected drive
1. List the drives and choose the one to format
    * 	```sh
        lsblk
        ```
2. Setup Partition Table
    * Setup GPT partition table
        * 	```sh
            sudo parted /dev/`<sd*>` mklabel gpt
            ```
    *  Setup MBR parition table
        * 	```sh
            sudo parted /dev/`<sd*>` mklabel msdos
            ```
3. Create a partition on the drive(with size of 100% of it's capacity)
    * 	```sh
        sudo parted /dev/`<sd*>` -a opt mkpart primary 0% 100%
        ```
4. Format the partition to ext4
    * 	```sh
        sudo mkfs.ext4 -L `<label>` `</dev/sd*1>`
        ```


## Mount drives
1. List disks and choose one
    *   ```sh
        sudo lsblk
        ```
2. List disk identifiers and copy UUID of chosen disk
    *   ```sh
        sudo blkid
        ```
3.  ```sh
    sudo mkdir /media/folder-name
    ```
4.  ```sh
    sudo nano /etc/fstab
    ```
5. Add the following line to /etc/fstab(copy only the UUID, but no the quotes surrounding it) - `UUID=COPIED_FROM_BLKID /media/folder-name ext4 defaults 0 0`
6. Check if everything works in fstab, if it does not - undo all changes in fstab
    *   ```sh
        sudo mount -a # if error - undo changes in /etc/fstab
        ```
7. Change ownership and reboot
    *   ```sh
        sudo chown group:user /media/folder-name
        reboot
        ```


## Disable suspend
1. Disable sleep and suspend, then reboot, to also disable hibernation add `hibernate.target hybrid-sleep.target`
    *   ```sh
        sudo system ctl mask sleep.target suspend.target
        reboot
        ```
2. Check for the result - if the services are non active
    *   ```sh
        systemctl status sleep.target suspend.target # check for result
        ```



# Security
* **ON INTERNET-FACING**(the ones that could be accessed from the internet) servers additional security measures should be taken: `Disable password login through ssh, leaving the ability to login only through private-public key pair`, `Enable the firewall to block access to all ports except the needed ones(SSH, and also HTTP in case of a web server)`, `Change the SSH port from the default "22" to some other one(e.g. 56747 or any other radnom one) so automatic SSH scanners couldn't reach it`, `Enable fail2ban so it would block any suspicious repeated connection attempts`
* **NEVER** install a graphics server(XORG, Wayland) or desktop environment(gnome, kde) on a server as it increases fail and attack surface, increases load on the server, drastically increases amount of installed packages and creates bloat folders(e.g. Documents, Downloads...) in users' home directories which isn't needed on the server as it isn't a personal computer
* **NEVER** use linux as the `root` user as it can cause serious problems sometimes, instead issue commands with `sudo <command>` from a user added to the sudo group. If the system only has the root user and no sudo users, create a new user and add him to the sudo group, otherwise use the already existing user that has sudo priviledges.
* Apply all updates once in a while to make sure all latest security fixes are applied(sudo apt update && sudo apt upgrade && sudo apt autoremove)
* Do not download any strange files or programs onto the server and if possible download programs only from the official repos
* [Security Checklist](https://github.com/lfit/itpol)


## Do not use root user
1. Login as root - `su`
2. Create a new user - `adduser <username>`
3. Add the new user to the sudo group - `usermod -a -G sudo <username>`


## Harden SSH
1. Open `/etc/ssh/sshd_config` in a text editor and make sure these settings are present and look like they do here(uncomment, change or add these lines otherwise):
	*	```sh
		PermitRootLogin no

		AddressFamily inet # only add this if you want to disable login attempts from IPv6 addresses
		PasswordAuthentication no # ONLY add this if you have setup a private/public key pair to log into the server
		```
2. Resart SSH service after making the changes - `sudo systemctl restart sshd`


## Remove unused network-facing services(especially remove unsafe ones like FTP or TELNET)
1. Get the list of network-facing listening services - `sudo netstat -tunlp`
2. Remove the unused ones - `sudo apt purge <program_name>`



# Server Maintnance
## List proccesses that are listening for incoming network connections(acting as servers)
*   ```sh
    sudo apt install net-tools
    sudo netstat -tunlp
    ```


## Monitor currently running proccesses
*	```sh
	sudo apt install htop # if not already installed
	htop # easiest and best CLI proccess manager
	```
	*	```sh
		top # older proccess monitoring application which is present on all modern UNIX systems
		```


## Monitor RAM usage
*	```sh
	free -g # view the RAM usage in gigabytes
	```


## Monitor Drive(SSD, HDD) Health Status with SMART
*	```sh
	sudo apt install smartmontools # install tools to interact with the drive's SMART reporting system

	sudo smartctl -i /dev/<sdX> # prints the information about the drive and tells if it supports SMART
	sudo smartctl -s <on/off> -d /dev/<sdX> # enable/disable(-s on/off) SMART on the selected drive(-d <drive>)
	sudo smartctl -d ata -H /dev/sdb # run an overall health self-check(-H <drive>) of the drive, -d option selects the type of the drive(mostly it is "ata" and "nvme" for nvme ssds)

	sudo smartctl -t <short/long> /dev/<sdX> # run a SMART long(can take multiple hours) or short self-test(-t short/long) on specified drive; the test is run in the background so a seperate command is needed to view the results
	sudo -l selftest /dev/<sdX> # view the results of the SMART self-test on the specified drive
	```


## Monitor temperature
* Debian
    *   ```sh
        sudo apt install hardinfo
        hardinfo -rma devices.so
        ```


## General Recommendations
* Remove dotfiles and dotdirectories(e.g. .file) after removing an application
* Remove bloat/unused applications that aren't a vital part of the OS