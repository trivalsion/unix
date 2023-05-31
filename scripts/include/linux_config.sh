## Remove default XDG folders ##
xdg_replacement_dir=".std_xdg_dirs" # when changing the name of the directory in this variable, make sure to also change all of it's occurances in ./textfiles/user-dirs.dirs file in this repository
mkdir -p "$HOME"/"$xdg_replacement_dir" # create a directory to move the XDG directories to so that they do not bloat the root of home dir

mkdir -p "$HOME"/"$xdg_replacement_dir"/Templates "$HOME"/"$xdg_replacement_dir"/Pictures # for XDG directories that aren't useless, create replacement dirs, but put them into a hidden directory instead of the root of home directory(Templates directory is needed so that files could be created from the file manager, Pictures directory is needed so that screenshots aren't thrown into home directory)
touch "$HOME"/"$xdg_replacement_dir"/Templates/'file.txt' # create a text file template in Templates directory so that textfiles could be easily created from the file manager without using the command line

rm -rf "$HOME"/Music "$HOME"/Pictures "$HOME"/Public "$HOME"/Templates "$HOME"/Videos # remove bloat directories from the root of home directory as they aren't needed or are moved to be in another directory

rm -rf "$HOME"/.config/user-dirs.dirs # remove the old XDG directory config file
cp "$textfiles_dir"/user-dirs.dirs "$HOME"/.config/ # move our new XDG directory config file onto the place of the old one
