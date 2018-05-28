# Crypt of the NecroDancer Auto Splitter

A [LiveSplit](http://livesplit.org) auto splitter for **Crypt of the NecroDancer** (in the form of an [ASL script](https://github.com/LiveSplit/LiveSplit/blob/master/Documentation/Auto-Splitters.md)).

### Supported Versions:

* Version 1.29 (current Steam version *without* the Amplified DLC)
* Version 2.59 (current Steam version *with* the Amplified DLC)

## Features

* Automatically start the timer when beginning a new run (any "all zones" mode variant apart from single zones)
* Automatically reset the timer when restarting a run or returning to lobby
* Automatically split on run completion, zone/depth changes, or level/floor changes (user configurable)

## Install
### Auto (via splits editor)
Soon™?

### Manual (via layout editor)
You can manually add the auto splitter by [downloading the script](/NecroDancerASL/NecroDancer.asl?raw=true) and adding a "Scriptable Auto Splitter" component to your LiveSplit layout. In detail:

1. Open LiveSplit, right click on it, select "Edit Layout..."
1. In the Layout Editor, click the ![](/NecroDancerASL/resources/layout_editor_plus.png?raw=true "plus button"), select "Control --> Scriptable Auto Splitter"
1. Select "Layout Settings", click on the "Scriptable Auto Splitter" tab
1. Browse and select the "NecroDancer.asl" file downloaded earlier

![](/NecroDancerASL/resources/layout_editor.png?raw=true "Adding Scriptable Auto Splitter Component") ![](/NecroDancerASL/resources/layout_settings.png?raw=true "ASL Script Settings") 

If the NecroDancer game process is detected while setting this up, LiveSplit should display the game version detected underneath the "browse..." button, as shown in the example screenshots (so you can verify the script is working). From here, you can configure the settings of the auto splitter to your liking - note that the settings will be saved in your layout file.

## Known Issues

* Sometimes the game version is incorrectly detected as an "unknown" version by the script
  * Workaround is to reload the splits/layout file, or just reload LiveSplit

## Credits

* DeamonHunter, roncli, CryZe and fatalis - for past NecroDancer auto splitters that served as inspiration when writing this one
* 0Seren, Souzooka, and Spiraster - for some of their auto splitters that served as general inspiration when it came to style/format of this auto splitter
