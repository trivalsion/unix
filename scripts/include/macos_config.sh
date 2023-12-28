## This script configures MacOS
## !! THIS SCRIPT WAS NOT UPDATED IN A LONG TIME !!


## Install the tools ##
xcode-select --install



## Configure git ##
git config --global user.name "eltertrias"
git config --global user.email "eltertrias"



## Change zsh to bash ##
brew install bash bash-completion
sudo sh -c "echo '/usr/local/bin/bash' >> /etc/shells"
chsh -s /usr/local/bin/bash && sudo chsh -s /usr/local/bin/bash



## Edit Bash configs ##
touch "$HOME"/.bash_profile "$HOME"/.bashrc
echo '. "$HOME"/.bashrc' >> "$HOME"/.bash_profile
echo '[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"' >> "$HOME"/.bash_profile
echo 'export CLICOLOR=1' >> "$HOME"/.bashrc



# echo "
# ---------------------------------------------------------------------------------------------------------
# 1. Check if VScode, Transmission, iTerm2, Vbox, Geany, MPV, Qemu were installed
# 2. Check if vm, opt, src, .config, git-repos folders were created
# 3. Try pushing commits to private repos to check if macos uses the nickname(eltertrias) and not the real name
# ---------------------------------------------------------------------------------------------------------
# "


# Resetting a Mac
# What to do before giving away Mac - https://support.apple.com/en-us/HT201065
# Erase Mac and reset it to factory settings - https://support.apple.com/en-ca/HT212749
#  Using Disk Utility to erase an Intel-based Mac - https://support.apple.com/en-us/HT208496
#  Using Disk Utility to erase an Apple silicon-based Mac - https://support.apple.com/en-us/102506
# Reinstalling MacOS - https://support.apple.com/en-ca/HT204904
