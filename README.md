# Scripts
## Using the repo
1. Clone this repository into any folder(usually the Downloads folder in user's home folder) with `git clone https://github.com/trivalsion/unix/
2. Run the `scripts/main.sh` script and answer all of it's prompts to configure a UNIX system
3. Check if everything `main.sh` prints out in "Done" section in it's output, was done by it
4. Read and do other recommendations printed out by the main.sh script after it has finished(e.g. run dev.sh script)


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
2. Make sure that all global varibales used by included scripts are present
3. Run the "scripts/main.sh" and any other script that was changed on a Linux VM and check if it does everything it is supposed to and that it does it correctly
