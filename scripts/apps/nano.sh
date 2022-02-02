#! /bin/bash
## Script that applies nano text editor configuration through config files


# Make directory for user-local configuration
mkdir -p $HOME/.config/nano

# Copy files to the config folder
cp ./textfiles/nano/* $HOME/.config/nano
