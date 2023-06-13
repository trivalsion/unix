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
        # Update the Operating System(all packages)
        sudo apt -y update && sudo apt -y upgrade

        # Install VS code
        curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
        sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
        sudo sh -c 'echo "deb [arch=amd64 signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
        sudo apt-get -y install apt-transport-https
        sudo apt-get -y update
        sudo apt-get -y install code

        # Install apps(might not install becuase apt requires all of them to be in repos, otherwise it fails)
        sudo apt-get -y install $apps_list # double quotes SHOULD NOT be used around $apps_list because it should expand to multiple package-names(seperated by spaces) and not just one
        sudo apt-get -y install firefox # firefox is on the seperate line here because it is pre-installed in most cases and apt-get fails if the package is already installed

        # Install apps with platform specific names
        sudo apt -y install build-essential # install "make" and other GNU developer utilties

        # Remove the ssh server to disable the ability of remote access to the computer(to prevent malicious unauthorized access)
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

        # Update the Operating System(all packages)
        sudo dnf -y update

        # Add RPM Fusion repository to the repository list
        sudo dnf -y install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
        sudo dnf -y update

        # Install VS code
        sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
        sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
        sudo dnf -y update
        sudo dnf -y install code

        # Install apps
        sudo dnf -y install $apps_list # double quotes SHOULD NOT be used around $apps_list because it should expand to multiple package-names(seperated by spaces) and not just one
        sudo dnf -y install firefox

        # Install apps with platform specific names
        sudo dnf -y install @development-tools # install "make" and other GNU utilites

        # Remove the ssh server to disable the ability of remote access to the computer(to prevent malicious unauthorized access)
        sudo dnf -y remove openssh-server
        sudo dnf -y autoremove
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
