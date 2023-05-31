#! /bin/bash
## Script that applies nano text editor configuration through config files


# Make directory for local user's custom nano configuration(nano automatically indexes this directory if it exists)
mkdir -p "$HOME"/.config/nano

# Copy files to the config folder
cp ./textfiles/nano/* "$HOME"/.config/nano
