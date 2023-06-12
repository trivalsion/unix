#! /bin/bash
## Script that configures vscode by moving config files and installing vscode extensions


## Install vscode extensions ##
# 	Extension name format - author.extension(this info is displayed next to extension name on it's store page)
code --install-extension ms-vscode.cpptools
code --install-extension ms-python.python
code --install-extension ms-vscode.hexeditor
code --install-extension zixuanwang.linkerscript
code --install-extension 13xforever.language-x86-64-assembly



## Gather information ##
platform_var="none"
case $(uname -s) in # Get the current Operating System
	Linux*) platform_var="linux" ;;
	Darwin*) platform_var="macos" ;;
	*) read -p "OS: " platform_var ;; # "read -r" SHOULD NOT be used here or in other similar situations across this file because "read -p" is the only attribute which allows "read" utility to both output a string and ask for input at the same time
esac
vscode_config=./textfiles/vscode-config.json



## Change the default .json configuration file of vscode to a custom one and use different file paths depending on the platform(as vscode configuration is located in different folders on different OSs) ##
if [ "$platform_var" == macos ]
then
	cat "$vscode_config" > "$HOME"/Library/ApplicationSupport/Code/User/settings.json
fi

if [ "$platform_var" == linux ]
then
	cat "$vscode_config" > "$HOME"/.config/Code/User/settings.json
fi



## Output information ##
echo "Activity Bar(the one on the left edge of the editor) can't be edited from json and needs to be edited manually: make sure to remove all icons from there except for 'Explorer', 'Search', 'Source Control', 'Extensions'"



## Configuration articles ##
    # https://dev.to/iamismile/my-vs-code-setup-4fcd
    # https://code.visualstudio.com/docs/editor/command-line
    # https://calebporzio.com/my-vs-code-setup-2
    # https://code.visualstudio.com/docs/getstarted/settings
# If some C headers are underlined with red because some header file include into them can't be found in /usr/include by vscode, fix by adding include paths
	# 1. In root of programming project folder create a .vscode/c_cpp_properties.json file
	# 2. To find include paths of the missing header file:
	#		* Option 1: copy its name and search for it - find /usr/include -name "header-name.h*"
	#		* Option 2: if library uses pkg-config, necessary include paths can be found using(copy only headers that look like - '-I /include/path') - 'pkg-config --cflags <library-name>'
	# 3. Add the paths to .vscode/c_cpp_properties.json file, instead of "include/path" put the paths copied either using option 1 or 2
		# {
		#		"configurations": [
		#			{
		#				"name": "include paths",
		#				"includePath": [
		#					"/include/path",
		#					"/include/path2",
		#					"..."
		#				]
		#			}
		#		]
		# }
