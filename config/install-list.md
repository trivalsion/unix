# Info
* **Win** - means that the application supports(can be installed on) Windows
* **Lin** - means that the application supports(can be installed on) Linux
* **Mac** - means that the application supports(can be installed on) MacOS



# Base Utilities
* **Multimedia Player** - [VLC](https://www.videolan.org/) `(Win, Lin, Mac)` [(Open-Source)](https://wiki.videolan.org/VLC_Source_code/)
* **Office Suite** - [Libreoffice](https://www.libreoffice.org/) `(Win, Lin, Mac)` [(Open-Source)](https://www.libreoffice.org/about-us/source-code/)
* **Web Browser**
  	* [Firefox](https://www.mozilla.org/en-US/firefox/new/) `(Win, Lin, Mac)` [(Open-Source)](https://firefox-source-docs.mozilla.org/setup/index.html) 
	* [Google Chrome](https://www.google.com/chrome/) `(Win, Lin, Mac)` (Proprietary)
	* Extra
		* [Brave](https://brave.com/) `(Win, Lin, Mac)` [(Open-Source)](https://github.com/brave/) 
		* [Chromium](https://www.chromium.org/) `(Lin)` [(Open-Source)](https://www.chromium.org/developers/how-tos/get-the-code)
* **Code Editor**
	* [**Visual Studio Code(GUI, IDE, Electron)**](https://code.visualstudio.com/) `(Win, Lin, Mac)` [(Open-Source)](https://github.com/microsoft/vscode)
	* [Nano(Terminal, Native - in C)](https://www.nano-editor.org/) - `(Lin, Mac)` [(Open-Source)](https://git.savannah.gnu.org/cgit/nano.git/log/)
 	* [Gedit(GUI, Native - in C)]() - `(Win, Lin, Mac)` [(Open-Source)]() 
  	* [Geany(GUI, Native - in C)]() - `(Win, Lin, Mac)` [(Open-Source)]()



# Tools
## Programming
* [**Git**](https://git-scm.com/) - source control system(records changes in source code and is used to upload source code to a server(either local or cloud) `(Win, Lin, Mac)` [(Open-Source)](https://github.com/git/git)
* **C/C++ toolchain**(compiler, libstd, linker...)
	* [**GCC**](https://gcc.gnu.org/) - `(Win, Lin, Mac)` [Open-Source](https://gcc.gnu.org/releases.html)
	* [Clang](https://clang.llvm.org/) - `(Win, Lin, Mac)` [(Open-Source)](https://clang.llvm.org/get_started.html)
* [**Python**](https://www.python.org/) - Python programming language interpreter(together with the standard library) `(Win, Lin, Mac)` [(Open-Source)](https://www.python.org/downloads/source/)
* [**GNU Make**](https://www.gnu.org/software/make/) - build system(builds sources into binaries accoring to a script) `(Win, Lin, Mac)` [(Open-Source)](https://www.gnu.org/software/make/)
* [**Valgrind**](https://valgrind.org/) - memory errors/leaks checker `(Lin)` [(Open-Source)](https://valgrind.org/downloads/repository.html)
* [**PanDoc**](https://pandoc.org/) - converts between different WYSIWYM(What You See Is What You Mean, e.g. LaTeX) text formats and also converts these formats info PDF `(Win, Lin, Mac)` [(Open-Source)](https://pandoc.org/installing.html#compiling-from-source)


## Other
* [**Fedora media writer**](https://getfedora.org/en/workstation/download/) - .iso(Operating System image) burning(writing) software `(Win, Lin, Mac)` [(Open-Source)](https://github.com/FedoraQt/MediaWriter)
* [**VirtualBox**](https://www.virtualbox.org/) - virtualization(virtual machine) software `(Win, Lin, Mac)` [(Open-Source)](https://www.virtualbox.org/wiki/Build_instructions)
* [**OBS**](https://obsproject.com/) - allows creation of virtual media devices(e.g. virtual webcam) `(Win, Lin, Mac)` [(Open-Source)](https://github.com/obsproject/obs-studio)
* **Torrent Client**
	* [**Transmission**](https://transmissionbt.com/) - small, easy, minimalistic(for QT toolkit use transmission-qt) `(Win, Lin, Mac)` [(Open-Source)](https://github.com/transmission/transmission)
	* [qBitTorrent](https://www.qbittorrent.org/) - large, feature rich `(Win, Lin, Mac)` [(Open-Source)](https://github.com/qbittorrent/qBittorrent)
* **Memory modifier**(modify values at selected memory addresses)
	* [ScanMem](https://github.com/scanmem/scanmem) - `(Lin)` [(Open-Source)](https://github.com/scanmem/scanmem)
	* [Cheatengine](https://www.cheatengine.org/) - `(Win)` [(Open-Source)](https://github.com/cheat-engine/cheat-engine/)


# Editing
* **Image Editor** - [Gimp](https://www.gimp.org/) `(Win, Lin, Mac)` [(Open-Source)](https://www.gimp.org/source/)
* **Audio Editors** - [Audacity](https://www.audacityteam.org/) `(Win, Lin, Mac)` [(Open-Source)](https://github.com/audacity/audacity)
* **Video Editing** - [Kdenlive](https://kdenlive.org/en/) `(Win, Lin, Mac)` [(Open-Source)](https://invent.kde.org/multimedia/kdenlive)
* **3D Editor** - [Blender](https://www.blender.org/) `(Win, Lin, Mac)` [(Open-Source)](https://wiki.blender.org/wiki/Building_Blender)
* **PCB/Circuit Design** - [KiCAD](https://www.kicad.org/) `(Win, Lin, Mac)` [(Open-Source)](https://gitlab.com/kicad/code/kicad/)



# Linux Specific Software
* [**GNOME Terminal**](https://help.gnome.org/users/gnome-terminal/stable/) - terminal emulator [(Open-Source)](https://gitlab.gnome.org/GNOME/gnome-terminal)
	* [**Terminator**](https://github.com/software-jessies-org/jessies) - terminal emulator [(Open-Source)](https://github.com/software-jessies-org/jessies)
* [**TLP(Not useful on fedora, in general only install if battery life is very bad)**](https://linrunner.de/tlp/) - background battery saver [(Open-Source)](https://linrunner.de/tlp/developers/source.html)
* [**QEMU-KVM(GUI - Virt-manager)** ](https://virt-manager.org/)- kernel virtualization [(Open-Source)](https://virt-manager.org/download/)



# Operating Systems
## [Linux](https://www.kernel.org/)([Open-Source](https://github.com/torvalds/linux))
* **Daily driver**(for daily usage)
	* [**Fedora(Version - Workstation)**](https://getfedora.org/)
	* [Ubuntu(Version - Default/Gnome)](https://ubuntu.com/)
* **Server**
	* [**Ubuntu Server**](https://ubuntu.com/download/server)
	* [Debian](https://www.debian.org/)
		* Install without GUI/DE as it takes up resources and makes the server more vulnerable 
	* [CentOS Stream](https://www.centos.org/)
* **Lightweight**
	* [Debian](https://www.debian.org/)
	* [Kubuntu](https://kubuntu.org/)
* **Anonimity/Live** - [Tails](https://tails.boum.org/)
