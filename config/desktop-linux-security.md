# Hardening system
## Remove unused network-facing services(especially remove unsafe ones like FTP or TELNET)
1. Get the list of network-facing listening services - `sudo netstat -tunlp`
2. Remove the unused ones - `sudo apt purge <program_name>`


## Do not use root user
1. Login as root - `su`
2. Create a new user - `adduser <username>`
3. Add the new user to the sudo group - `usermod -a -G sudo <username>`



# Application security
* Install non-essential applications as flatpaks as it sandboxes them and also makes their removal easier
	* [FlatPak](https://flatpak.org/)
* Use an application(binaries/executables) permission controler for all applications
	* [SELinux - strongest kernel built-in app permission controller](https://selinuxproject.org/page/Main_Page)
	* [AppArmour - an easier kernel built-in app permission controller](https://apparmor.net/)