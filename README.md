# Scripts
## Repository Layout
* `config` folder - contains notes telling about configuring different very specific parts of the system
* `scripts` folder - contains scripts to configure the system
  * `main.sh` file - the main shell script of this repo which is able to configures different unix systems(BSD, MacOS, Linux)
  * `misc` folder - folder containing scripts for various different purposes
  * `apps` folder - folder containing scripts to configure applications


## Script coding rules
* All scripts should have a comment at the start of them telling about the purpose of the script, if the script has "!# /bin bash" then the comment should be directly below it, otherwise it should be on the first line of the script and should look like this:
	 * ```
	 	## Bash script which ...
		(Miss 1 line)
		(Miss 1 more line)
	 	<The script code itself>........
	    ```


## Shell Script Checking Algorithm
1. Check all the changed files .sh with [ShellCheck](https://www.shellcheck.net/) and fix errors that show up
2. Make sure that all global varibales used by include scripts are present
3. Run the scripts/main.sh on a linux VM and check if everything is done correctly
