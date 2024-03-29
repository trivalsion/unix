#! /bin/bash
## Main UNIX-like OS configuration script which configures multiple different aspects of the system automatically to reduce user intervention needed for configuration. This script supports MacOS and Linux UNIX-like Operating Systems.
## In the comments in the scripts, the words: apps, applications and packages will be used interchangeably in most cases.
## In the comments in the script the words: folder, directory will be used interchangeably in most cases


## Variables ##
apps_list="nano python3 clang binutils nasm make" # firefox - it is not present in this list because it's package name is different on different Linux distributions, so it is installed in the package manager specific section of package_management.sh included in this file
dirs_list="$HOME/git-repos $HOME/vm/iso $HOME/vm/vm"
include_dir=./include
textfiles_dir=$include_dir/textfiles
output_info_file=./output_info.txt



## Script setup ##
# Folder existance checks
[ -d "$include_dir" ] || exit # here "-d" checks if the directory(folder) exists and if it does not, the script finishes(exits)
[ -d "$textfiles_dir" ] || exit

# Get information about the system #
# Get the name of the Operating System being used
current_os="none"
case $(uname -s) in
	Linux*) current_os="linux" ;;
	Darwin*) current_os="macos" ;;
	*) read -p "OS: " current_os ;; # "read -r" SHOULD NOT be used here or in other similar situations across this file because "read -p" is the only attribute which allows "read" utility to both output a string and ask for input at the same time
esac

# Get the name of the Desktop Environment being used
current_de="none"
case "$DESKTOP_SESSION" in
	gnome*) current_de="gnome" ;;
	plasma*) current_de="kde" ;;
	*) read -p "Destktop Environment: " current_de ;;
esac

# Get the name of the Package Manager being used
current_pm="none"
dnf --version && current_pm=dnf
apt --version && current_pm=apt
if [ "$current_pm" == "none" ]
	then
		read -p "Package Manager: " current_pm
fi



## System-specific Configuration
# Include package_management.sh script that is responsible for installing and removing packages or exit if it does not exist
. "$include_dir"/package_management.sh || exit

# Include platform/operating system-specific scripts
. "$include_dir"/"$current_os"_config.sh || exit



## Cross-platform ##
# Create folders
mkdir -p $dirs_list # double quotes SHOULD NOT be used around $dirs_list because it should expand to multiple folders(seperated by spaces) and not just one

# Change the bash shell prompt's colors
touch ~/.bashrc
echo 'PS1="\[\e[36m\][\[\e[m\]\[\e[34m\]\u\[\e[m\] \[\e[33m\]\w\[\e[m\] \[\e[32m\]\\$\[\e[m\]\[\e[36m\]]\[\e[m\] "' >> ~/.bashrc # PS1 variable holds the configuration of the shell's prompt
# Good PS1 Generator - https://ezprompt.net/



## End of script messages ##
# Information
clear # clear all of the output of the code above, to not clutter the terminal
echo "
--- Important Information ---
1. This script has finished, reboot the computer to make sure everything works fine
2. After rebooting the computer, open $output_info_file(e.g. by typing in the terminal - cat $output_info_file) located in this directory and follow instructions in it"

# GUI Configurations
if [[ "$current_de" != "none" && "$current_os" == "linux" ]]
    then
        echo "--- DE GUI Configuration ---" >> "$output_info_file"
        cat "$textfiles_dir"/"$current_de"-config.md >> "$output_info_file"
    else
        if [ "$current_os" == "macos" ]
            then
                echo "--- GUI Configuration ---" >> "$output_info_file"
                cat "$textfiles_dir"/macos-config.md >> "$output_info_file"
        fi
fi

# Final message
final_output_message_apps_list="none"
if [ "$current_os" == "linux" ]
    then
    	final_output_message_apps_list="$apps_list vscode
    - No terminal emulator application was installed by this script, the desktop environment's pre-installed terminal emulator application should be used(GNOME terminal on GNOME and Konsole on KDE(and other QT desktop environments))
    - Some or all applications from the list above might not be installed if APT package manager is used becuase it fails if any package from the list provided to it is missing in it's repositories(for example due to one package in the list having been written incorrectly)"
    else
        if [ "$current_os" == "macos" ]
	    then
	        final_output_message_apps_list="cask nano binutils diffutils nasm gdb qemu code vbox firefox"
	fi
fi

linux_final_output_message="3. Unneeded, defautlt XDG directories(these are the default directories in the /home/user folder, e.g. Decuments, Music) were removed(hidden)
4. PS1 variable was changes(bash prompt was made colorful)"
macos_final_output_message="3. User and email were changed for git"

echo "
--- Check if all of these points were done by the script ---
1. All of the following applications were installed by the package manager: $final_output_message_apps_list
2. Following directories were created: $dirs_list" >> "$output_info_file"

if [ "$current_os" == "linux" ]
    then
        echo "$linux_final_output_message" >> "$output_info_file"
    else
        if [ "$current_os" == "macos" ]
	    then
	        echo "$macos_final_output_message" >> "$output_info_file"
	fi
fi

echo "
--- To do manually ---
1. Go to the scripts/configurators in the root of this repository and run needed configuration scripts
2. Configure the GUI using the information given in --- DE GUI Configuration --- section above
3. Remove unneeded pre-installed applications(e.g. gnome cheese)
4. Virtualization (Optional)
    1. Install QEMU-KVM Virt-Manger
        - Fedora - sudo dnf install @virtualization
        - Ubuntu - sudo apt install -y qemu qemu-kvm libvirt-daemon libvirt-clients bridge-utils virt-manager
	- MacOS - VirtualBox should have been installed by this script
    2. Install all the VMs through QEMU to the ~/vm/vm
5. Change browser settigns according to browser-config.md
* (If the computer contains an NVIDIA GPU) Install NVIDIA proprietary drivers using the guide in (root of this repo)/configuration/gpu-drivers.md


Reboot the computer to make sure all of the settings have been applied" >> "$output_info_file"
