# Dark Souls Auto Splitter

A LiveSplit auto splitter and IGT plugin for Dark Souls: PTDE (original, not remaster).

## Install
### Auto (via splits editor)
Probably never, due to a lack of community interest.

### Manual (via layout component)
You can manually add the autosplitter by [downloading the script](https://raw.githubusercontent.com/seanpwolf/DarkSoulsASL/master/darksouls.asl), adding a "Scriptable Auto Splitter" to your LiveSplit layout (+ button -> Control -> "Scriptable Auto Splitter", and then selecting the script in the layout settings ("Scriptable Auto Splitter" tab). Your settings will be stored in your layout file.

## Usage

You will still have to manually start and reset runs, as well as manually split if there isn't a sufficient auto split condition for one or more of your splits. Otherwise, you can use as many or as few auto splits conditions as you want to.

Make sure to switch to game time in LiveSplit to have the timer sync with the IGT in Dark Souls (right click on LiveSplit -> Compare Against -> Game Time).

Most of the auto split conditions work by either splitting immediately as a certain game flag is set, or by splitting on the next load screen (or the first load screen after reloading the save file in the event of a save and quit) after a certain game flag is set. You can hover over some auto split settings to show a tooltip with more detailed info.

### Settings

You can configure the settings of the auto splitter in the "Scriptable Auto Splitter" tab of your layout settings. Some default settings are already in place.

![Settings Example](http://i.imgur.com/AN1GyiX.png)

The current default settings are a work in progress, and are based on what appears to be the popular split locations for various bosses/events. It is likely that these will change later if these choices aren't popular defaults.

Note that unchecking a parent setting will disable all child settings (even if they are checked) - they should be grayed out in the UI.

Make sure to save your layout file if you edit the settings as they are stored there.

## Compatibility

* Current Steam version: auto splitter and IGT
* Debug build: only IGT (minimally tested)

No other versions of the game are currently supported. You can check the auto splitter settings for which version the script detected ("steam", "debug", or "&lt;unknown&gt;" are the possible options). If the version detected is "&lt;unknown&gt;", then either your game version wasn't detected properly or your version isn't supported by this script.

## Todo:

* Clean up code and documentation (including this file)
* Update auto split conditions and their defaults to be more relevant with recent routes/discoveries
* Make a LiveSplit component variant? (might have better performance?)

## Credits

* Wulf2k and others who contributed to [DSCM](https://github.com/Wulf2k/DaS-PC-MPChan) - many of the pointers and offsets used were derived from its source 

