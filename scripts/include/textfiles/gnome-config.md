## Tweaks(Package/App name - `gnome-tweaks`)
* Appearance
    * Cursor`(Adwaita/DMZ-Black)`
    * Icons`(Adwaita)`
    * Legacy Applications`(Adwaita-dark)`
* Mouse & Touchpad -> *(On Laptop:)* Mouse Click Emulation`(Area)`
* Windows -> Maximize`(ON)`, Minimize`(ON)`


## Settings
* Appearance
	* Style`(Dark)`
	* Backgorund`(Set a background)`
* Notifications -> Lock Screen Notifications`(OFF)`
* Search -> App Search`(OFF)`
* Multitasking -> Hot Corner`(OFF)`
* Privacy -> Everything`(OFF)`, except: 
	* Screen Lock 
		* Blank Screen Delay`(5 minutes)`
		* Automatic Screen Lock`(ON)`
		* Automatic Screen Lock Delay`(Screen Turns Off)`
* Sharing -> Everything(OFF)
* Power
	* *(On Laptop)* Automatic Screen Brightness`(OFF)`
	* *(On Laptop)* Dim Screen`(ON)`
	* Screen Blank`(5 minutes)`
	* Automatic Suspend`(On Laptop: 15 minutes on Battery and 30 minutes when Plugged In; On Desktop: 1 hour)`
	* *(On Laptop)* Show Battery Percentage(ON)
* *(When using 2 monitors:)* Displays
	* Multiple Displays`(Join)`
	* Re-arrange displays into the position they are in, in the real life
	* Primary Display`(Set)`
* Keyboard -> View and Customize Shortcuts
	* Navigation
		* Switch to workspace [number]`(Super + Alt + [number])`
		* Move window to workspace [number]`(Super + Shift + [number])`
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
	* Everything`(Do nothing)`
	* Never prompt or start programs on media insertion`(ON)`
* *(If there are issues with animations being laggy or the computer being slow:)* Accessibility -> Enable Animations`(OFF)`
* Default Apps`(Set default apps)`
* About -> Device Name`(Set)`


## Miscellaneous
1. Remove/Uninstall unneeded pre-installed gnome apps using GNOME "Software" app
2. Unpin uneeded and pin the needed apps(Files, Firefox, Visual Studio Code, Terminal) to the Dash(taskbar)
3. In launchpad/app(Show Apps) menu, sort all applications into folders: `Bloat`, `Apps`, `Utilities`, `Office`
4. Gnome Terminal(gnome-terminal) - Burger Menu(3 lines) - Preferences
	* Profiles - Default Profile - Rename(to "Personal")
		* Colors
			* Use colors from system theme(OFF)
			* Built-in schemes(Green on black)
5. Starting from GNOME 40, extensions are managed using "gnome-extensions-app", disable everything in it unless extensions are absolutely required.
	* To add desktop icons: Extensions App -> Enable Extensions -> [Install desktop icons extension](https://extensions.gnome.org/extension/2087/desktop-icons-ng-ding/)
* `(On laptops running older GNOME versions:)` By default the laptop shouldn't shutdown if it is closed, as long as it is connected to power and a monitor(even if it would shutdown in all other cases when the lid is closed), but if it does, then "Gnome Tweaks -> General -> Suspend when laptop lid is closed`(ON)`" setting should be set to `Off` while working with a monitor. Make sure to turn this option back on after disconnecting the monitor so that the computer does not overheat in backpack/bag.
