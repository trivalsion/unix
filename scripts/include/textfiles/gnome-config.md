## Tweaks(Package/App name - `gnome-tweaks`)
* General -> Suspend when laptop lid is closed`(ON)`
* Appearance
    * Cursor`(Adwaita/DMZ-Black)`
    * Icons`(Adwaita)`
* Keyboard & mouse -> *On Laptop:*Mouse click emulation`(Area)`
* Top Bar -> Seconds`(OFF)`, Week Numbers`(OFF)`
* Windows Titlebars -> Titlebar Buttons -> Maximize`(ON)`, Minimize`(ON)`


## Settings
* Appearance
	* Style`(Dark)`
	* Backgorund`(Set a background)`
* Notifications -> Lock Screen Notifications`(OFF)`
* Search`(OFF)`
* Multitasking -> Hot Corner`(OFF)`
* Privacy -> Everything`(OFF)`, except: 
	* Blank Screen Delay`(5 minutes)`
	* Automatic Screen Lock`(ON)`
	* Automatic Screen Lock Delay`(Screen Turns Off)`
* Power
	* Dim Screen`(ON)`
	* Screen Blank`(5 minutes)`
	* Automatic suspend`(On Laptop: 15 minutes on Battery and 30 minutes when Plugged In; On Desktop: Off)`
	* Automatic Screen Brightness`(OFF)`
* Keyboard -> View and Customize Shortcuts
	* Navigation
		* Switch to workspace x`(Super + x/Super + Alt + x)`
		* Move window to workspace x`(Super + Shift + x)`
		* Hide all normal windows`(Super + D)`
		* Move to workspace left/right`(Super + Alt + <-/->)`
	* Other(Not a settings category)
		* Switch to next input source`(Super + Space)`
		* Hide window`(Super + H)`
		* Maximize window`(Super + Up)`
	* Custom Shortcuts(Need to be added with + sign in the end)
		* nautilus`(Super + E)`
		* gnome-terminal`(Ctrl + Alt + T)`
		* gnome-system-monitor`(Ctrl + Shift + Esc)`
* Removable Media
	* Set everything to `Do nothing`
	* Never prompt or start programs on media insertion`(ON)`
* Accessibility -> Enable Animations`(OFF)`
* Default Applications`(Set default apps)`


## Extra
1. Remove unneeded pre-installed gnome apps using gnome software app
2. Pin most important applications to the taskbar
3. In the launchpad/app menu, sort all apps into folders: put bloat into `bloat` folder, user installed apps into `apps` folder and other system stuff into `utilities`
4. Gnome Terminal(gnome-terminal) - Burger Menu(3 lines) - Preferences
	* Profiles - Default Profile - Rename(to "Personal")
		* Colors
			* Use colors from system theme(OFF)
			* Built-in schemes(Green on black)
5. By default the laptop shouldn't shutdown if it is closed when connected to power and monitor on most modern linux distros(even if it would shutdown in all other cases when the lid is closed), but if it does, then the "Gnome Tweaks -> General -> Suspend when laptop lid is closed`(ON)`" setting should be set to `Off` while working on a monitor with the laptop connected to power and closed
* Starting from GNOME 40, add/remove extensions using gnome-extensions-app
* To add desktop icons: Extensions App->Enable Extensions; [Install desktop icons extension](https://extensions.gnome.org/extension/2087/desktop-icons-ng-ding/) 
