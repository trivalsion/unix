# Includes the code for package managers configuration for main configurations script


## Common Config ##
apps_list="$apps_list curl wget" # add any dependencies(needed for installations not from distribution's repositories, that require files to be donwloaded from the developers website(e.g. vscode)) to the apps_list variable to be installed
if [ "$current_de" == "gnome" ]
    then
        apps_list="$apps_list gnome-tweaks gnome-extensions-app" # add apps specific to the GNOME desktop environment to the apps list
fi



## Config for APT ##
if [ "$current_pm" == apt ]
    then
        # Update
        sudo apt -y update && sudo apt -y upgrade

        # VS code
        curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
        sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
        sudo sh -c 'echo "deb [arch=amd64 signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
        sudo apt-get install -y apt-transport-https
        sudo apt-get update -y
        sudo apt-get install -y code

        # Apps(might not install becuase apt requires all of them to be in repos, otherwise it fails)
        sudo apt-get install -y $apps_list # double quotes SHOULD NOT be used around $apps_list because it should expand to multiple package-names(seperated by spaces) and not just one
        sudo apt-get install -y firefox

        # Apps with platform specific names
        sudo apt install -y build-essential # install "make" and other GNU developer utilties

        # Remove ssh server to disable remote access to the computer
        sudo apt-get --purge -y remove openssh-server
fi



## Config for DNF ##
if [ "$current_pm" == dnf ]
    then
		# Updating Fedora to a new release
			# Updating Fedora to a new release(e.g. Fedora 35 to F36) without re-installing, official guide - https://docs.fedoraproject.org/en-US/quick-docs/upgrading/
				# Updating using CLI, official guide - https://docs.fedoraproject.org/en-US/quick-docs/dnf-system-upgrade/
				# Non-official update guide - https://itsfoss.com/upgrade-fedora-version/
			# RPM Fusion will update automatically and does not require any manualy action to update when moving between Fedora releases
				# Reddit thread 1 - https://www.reddit.com/r/Fedora/comments/lrxvak/rpm_fusion_and_fedora_version_upgrades/
				# Reddit thread 2 - https://www.reddit.com/r/Fedora/comments/bhbrv7/rpmfusion_question/

        # Update
        sudo dnf -y update

        # RPM Fusion
        sudo dnf install -y https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
        sudo dnf -y update

        # VS code
        sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
        sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
        sudo dnf -y update
        sudo dnf install -y code

        # Apps
        sudo dnf install -y $apps_list # double quotes SHOULD NOT be used around $apps_list because it should expand to multiple package-names(seperated by spaces) and not just one
        sudo dnf install -y firefox

        # Apps with platform specific names
        sudo dnf -y install @development-tools # install "make" and other GNU utilites

        # Remove ssh server to disable remote access to the computer
        sudo dnf remove -y openssh-server
        sudo dnf autoremove -y
fi



## Config for Homebrew ##
if [ "$current_pm" == brew ]
    then
        # Install xcode command line tools(brew dependency)
        xcode-select --install

        # Install homebrew
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

        # Install apps
        brew install binutils diffutils nasm gdb nano # Install programming-related packages
        brew install cask qemu # Install Apps
        brew cask install visual-studio-code virtualbox firefox # Install Cask packages
        # Note: when installing VBox kernel kext should be allowed - Settings->Security->Allow Oracle...
fi
