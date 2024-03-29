# Hardening system
## During system installation
1. During the installation of the system, all of the internal disks of the computer should always be encrypted with full-disk encryption(e.g. LUKS).
	* Ubuntu, Fedora, Debian and other large distros provide the ability to do a full-disk encryption of selected drives right in the installer.


## Remove unused network-facing services(especially remove unsafe ones like FTP or TELNET)
1. Get the list of network-facing listening services - `sudo netstat -tunlp`
2. Remove the unused ones - `sudo apt purge <program_name>`
	* Importantly always remove SSH server(`openssh-server` package on most systems) from all systems that won't be used as servers because SSH server could allow remote access to the computer


## Do not use root user
1. Login as root - `su`
2. Create a new user - `adduser <username>`
3. Add the new user to the sudo group - `usermod -a -G sudo <username>`



# Regular ToDos
* Update the repos and the system regularly(e.g. `sudo dnf update` or `sudo apt update && sudo apt upgrade`)
	* After each update run an autoremover(e.g. `sudo dnf autoremove` or `sudo apt autoremove`) to autodelete packages and dependencies that are no longer needed by the system or other packages(and can bloat the system or cause security problems)



# Application security
* Install non-essential applications as flatpaks as it sandboxes them and also makes their removal easier
	* [FlatPak](https://flatpak.org/)
* Use an application(binaries/executables) permission controler for all applications
	* [SELinux - strongest kernel built-in app permission controller](https://selinuxproject.org/page/Main_Page)
	* [AppArmour - an easier kernel built-in app permission controller](https://apparmor.net/)



# Resources
* [Comparitech - Desktop Linux Security Guide](https://www.comparitech.com/blog/information-security/linux-security-guide/)
