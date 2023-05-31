#! /bin/bash
## Shell script which sets up the OS for development/programming


## Setup git repos, if github does not allow password aunthentication use [this guide](https://github.com/trivalsion/programming/blob/master/documents/guides/git.md) ##
cd $HOME/git-repos || exit
mkdir -p github
cd github || exit
git clone https://github.com/trivalsion/programming
git clone https://github.com/trivalsion/tos
git clone https://github.com/trivalsion/unix
git clone https://github.com/trivalsion/notes



## Configure git settings ##
git config --global credential.helper store # saves the git account password when you go to some repo and do a push or pull(make sure to do a push/pull where account and password is requested) and enter the password, now all of the next times, the password won't be requested(the account and password will be stored in - ~/.git-credentials)
git config --global user.name "eltertrias"
git config --global user.email "eltertrias"



## Add local binary directory to PATH - optional ##
# mkdir -p $HOME/opt/bin $HOME/opt/src
# echo 'PATH=$PATH:$HOME/opt/bin' >> $HOME/.bashrc
