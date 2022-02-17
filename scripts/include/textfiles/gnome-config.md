## Tweaks(Package/App name - `gnome-tweaks`)
* General -> Suspend when laptop lid is closed`(ON)`, Animations`(OFF)`
* Appearance
    * Applications`(Adwaita-dark)`
      * On ubuntu the shell theme also needs to be changed
         1. Terminal -> sudo apt install gnome-shell-extensions
         2. Log out and Log In from Ubuntu
         3. Gnome Tweaks -> Extensions(ON) -> User Themes(ON)
         4. Restart Gnome Tweaks
         5. Gnome Tweaks -> Appearance -> Shell(Yaru-dark)
    * Cursor`(Adwaita/DMZ-Black)`
    * Icons`(Adwaita)`
* Keyboard & mouse -> *On Laptop:*Mouse click emulation`(Area)`
* Top Bar -> Everything`(OFF)`
* Windows Titlebars -> Titlebar Buttons -> Maximize`(ON)`, Minimize`(ON)`


## Settings
* Backgorund`(Set a background)`
* Notifications`(OFF)`
* Search`(OFF)`
* Privacy -> Everything`(OFF)`, except Blank Screen Delay`(5 minutes)`, Automatic Screen Lock`(ON)`, Automatic Screen Lock Delay`(Screen Turns Off)`
* Power -> Automatic suspend`(On Laptop: 15 minutes on Battery and 30 minutes when Plugged In; On Desktop: Off)`, Screen Blank`(5 minutes)`, Dim Screen`(ON)`, Automatic Screen Brightness`(OFF)`
* Keyboard -> Customize Shortcuts
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
		* terminator`(Ctrl + Alt + T)`
		* gnome-system-monitor`(Ctrl + Shift + Esc)`
* Removable Media
  * Set everything to `Do nothing`
  * Never prompt or start programs on media insertion`(ON)`
* Default Applications`(Set default apps)`


## Extra
1. Remove unneeded pre-installed gnome apps using gnome software app
2. Pin most important applications to the taskbar
3. In the launchpad/app menu, sort all apps into folders: put bloat into `bloat` folder, user installed apps into `apps` folder and other system stuff into `utilities`
* Starting from GNOME 40, add/remove extensions using gnome-extensions-app
* To add desktop icons: Extensions App->Enable Extensions; [Install desktop icons extension](https://extensions.gnome.org/extension/2087/desktop-icons-ng-ding/)
