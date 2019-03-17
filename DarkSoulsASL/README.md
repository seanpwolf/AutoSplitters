# Dark Souls: Prepare to Die Edition Auto Splitter

A [LiveSplit](http://livesplit.org) auto splitter for **Dark Souls: PTDE** (in the form of an [ASL script](https://github.com/LiveSplit/LiveSplit/blob/master/Documentation/Auto-Splitters.md)).

### Supported Versions

Most of the testing was done on the current official Steam version, however any version should work. Unofficial GFWL based builds need the launcher executable to be renamed (from `DARKSOULS.exe` to anything else, like `DARKSOULS-launcher.exe`) for the script to pick up the actual game executable.

## Features

* Automatically start the timer when the character's position is the initial spawn in the Asylum (normally shortly after skipping the lore intro cutscene)
* Automatically reset the timer when entering the new character creation screen
* Automatically split on event flags being set (like defeating a boss or turning Anor Londo dark) and a few other conditions with appropriate split timings for each (such as on the next load screen or upon exiting the boss area)

Note: these auto split conditions can be individually turned on or off if desired

## Install & Usage

Manually add the auto splitter by [downloading the script](/DarkSoulsASL/DarkSouls.asl?raw=true) and adding a "Scriptable Auto Splitter" to your LiveSplit layout. In detail:

1. Open LiveSplit, right click on it, select "Edit Layout..."
1. In the Layout Editor, click the ![](/DarkSoulsASL/resources/layout_editor_plus.png?raw=true "plus button"), select "Control --> Scriptable Auto Splitter"
1. Select "Layout Settings", click on the "Scriptable Auto Splitter" tab
1. Browse and select the "DarkSouls.asl" file downloaded earlier

![](/DarkSoulsASL/resources/layout_editor.png?raw=true "Adding Scriptable Auto Splitter Component") ![](/DarkSoulsASL/resources/layout_settings.png?raw=true "ASL Script Settings") 

If the DarkSouls game process is detected while setting this up, LiveSplit should display the game version detected underneath the "browse..." button, as shown in the example screenshots (so you can verify the script is working). From here, you can configure the settings of the auto splitter to your liking - note that the settings will be saved in your layout file.

Make sure to also switch to game time in LiveSplit to have the timer sync with the IGT in Dark Souls (right click on LiveSplit -> Compare Against -> Game Time).

## Credits / Special Thanks

* Phokz ([Cheat Engine Table](http://fearlessrevolution.com/viewtopic.php?f=4&t=63)), Wulf2k ([DSCM](https://github.com/Wulf2k/DaS-PC-MPChan)), TKGP ([DS Gadget](https://github.com/JKAnderson/DS-Gadget)), and others who contributed to these projects - many of the pointers and offsets used were sourced from these projects which aided me in speed (from not having to hunt down pointers/offsets) or in finding extra similar pointers and offsets
* SpeedSouls Community - for (indirectly) helping me with Dark Souls speed stuff
* 0Seren, Souzooka, and Spiraster - for some of their auto splitters that served as general inspiration when it came to style/format of this and my other auto splitters

## Contact

* Discord: seanpwolf#0985
* [Twitch](https://twitch.tv/seanpwolf)
* [Twitter](https://twitter.com/seanpwolf)
