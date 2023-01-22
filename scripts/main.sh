#! /bin/bash
## Main UNIX-like OS configuration script which configures multiple different aspects of the system automatically to reduce user intervention needed for configuration. This script supports MacOS and Linux UNIX-like OSs.


## Variables ##
apps_list="nano python3 binutils clang make nasm" # firefox(install it with a seperate dnf/apt command as firefox package may have a different name and fail)
dirs_list="$HOME/git-repos $HOME/vm/iso $HOME/vm/vms"
include_dir=./include
textfiles_dir=$include_dir/textfiles
output_info_file=./output_info.txt



## Script setup ##
# Folder existance checks
[ -d "$include_dir" ] || exit
[ -d "$textfiles_dir" ] || exit

# Get information about the system #
# Get the OS
current_os="none"
case $(uname -s) in
	Linux*) current_os="linux" ;;
	Darwin*) current_os="macos" ;;
	*) read -p "OS: " current_os ;;
esac

# Get the Desktop Environment
current_de="none"
case "$DESKTOP_SESSION" in
	gnome*) current_de="gnome" ;;
	plasma*) current_de="kde" ;;
	*) read -p "Destktop Environment: " current_de ;;
esac

# Get the Package Manager
current_pm="none"
dnf --version && current_pm=dnf
apt --version && current_pm=apt
if [ "$current_pm" == "none" ]
	then
		read -p "Package Manager: " current_pm
fi



## System-specific Configuration
# Include package manager script or exit if it does not exist
. "$include_dir"/package_management.sh || exit

# Include platform specific scripts
. "$include_dir"/"$current_os"_config.sh || exit                                                                                                                             # Distro/platform specific configs



## Cross-platform ##
# Make folders
mkdir -p $dirs_list

# Change the shell colors
touch ~/.bashrc
echo 'PS1="\[\e[36m\][\[\e[m\]\[\e[34m\]\u\[\e[m\] \[\e[33m\]\w\[\e[m\] \[\e[32m\]\\$\[\e[m\]\[\e[36m\]]\[\e[m\] "' >> ~/.bashrc
# Good PS1 Generator - https://ezprompt.net/



## Script End Messages ##
# Information
echo "
--- Important Information ---
1. This script has finished, reboot the computer to make sure everything works fine
2. After rebooting the computer, open $output_info_file(e.g. by typing in the terminal - cat $output_info_file) located in this directory and follow instructions in it
"

# GUI Configurations
if [[ "$current_de" != "none" && "$current_os" == "linux" ]]
    then
        clear
        echo "--- DE GUI Configuration ---" >> "$output_info_file"
        cat "$textfiles_dir"/"$current_de"-config.md >> "$output_info_file"
    else
        if [ "$current_os" == "macos" ]
            then
                clear
                echo "--- GUI Configuration ---" >> "$output_info_file"
                cat "$textfiles_dir"/macos-config.md >> "$output_info_file"
        fi
fi

# Print the final message
echo "
--- Check if all of these points were done by the script ---
1. All of the following apps were installed by the package manager:
    - On Linux - $apps_list vscode(some or all might not be installed if apt is used becuase it fails if any package is missing in repositories)
    - On MacOS - binutils diffutils nasm gdb nano cask mpv qemu geany code transmission iterm2 vbox firefox
2. Following directories were made - $dirs_list
3. Only on Linux:
	- No terminal application was installed, so instead the pre-installed terminal apps of the desktop environments should be used(Gnome Terminal on Gnome and Konsole on KDE(and other QT desktop environments)). Make sure to apply appropriate configuration to these default terminal apps according to the instructions given in the --- DE GUI Configuration --- section above
    - Unneeded default XDG directories were removed(hidden)
    - PS1 variable was changed
4. Only on MacOS
    - Username and email were changed for git

--- To do manually ---
1. Go to the scripts/apps in root of this repo and run the needed configuration scripts
2. Go to scripts/misc in the root of this repo and run dev.sh if it is a software development machine
3. Configure the GUI using the information given in the --- DE GUI Configuration --- section above
4. Remove unneeded pre-installed applications(e.g. gnome cheese)
5. Virtualization
    1. Install QEMU-KVM Virt-Manger
        - Fedora - sudo dnf install @virtualization
        - Ubuntu - sudo apt install -y qemu qemu-kvm libvirt-daemon libvirt-clients bridge-utils virt-manager
    2. Install all the VMs through QEMU to the ~/vm/vms
    
Reboot the computer" >> "$output_info_file"
