// State Descriptor Variables:
//
// charTime    : IGT for a single char/run, syncs every ~0.5 seconds in normal gameplay
// igt         : IGT for all chars/runs, syncs every ~0.5 seconds in normal gameplay
// seed        : Has a value of -1 on lobby or for a few frames in between quick resets
// bossIntro   : Value of 1 on boss intro splash screens, 0 otherwise
// charID      : 0 = Cadence, 1 = Melody, 2 = Aria, 3 = Dorian, 4 = Eli, 
//               5 = Monk, 6 = Dove, 7 = Coda, 8 = Bolt, 9 = Bard, 
//               10 = Nocturna, 11 = Diamond, 12 = Mary, 13 = Tempo
// deathless   : Value of 1 if in deathless mode, 0 otherwise
// gamePaused  : Value of 1 if paused or in a menu, 0 otherwise 
// level       : Current level/floor
// loading     : Value of 0 if on a load screen, in a menu, or while a boss splash is up; non-zero otherwise
// lowPercent  : Value of 1 if still low%, 0 if low% is lost
// zone        : Current zone/depth
//
// aobs: (work on both 2.59 and 1.29)
//
// bossIntro                          --> "89 73 14 C6 05 ?? ?? ?? ?? 01"
// charID baseptr                     --> "C7 45 FC FF FF FF FF A1 ?? ?? ?? ?? 6A 78 6A 01"
// charID offset                      --> "8B 87 ?? ?? ?? ?? 83 F8 03 74 05 83 F8 04"
// (charTime-0x8), (loading-0x2), igt --> "8B 15 ?? ?? ?? ?? 6A 01 6A 00"
// gamePaused                         --> "85 C0 74 40 B1 01 C6 05 ?? ?? ?? ?? 01"
// lowPercent                         --> "80 7D 14 00 75 39 80 3D ?? ?? ?? ?? 00"
// seed                               --> "C7 05 ?? ?? ?? ?? FF FF FF FF 83 F9 FF 74 0D"
// deathless                          --> "8D 51 01 C6 05 ?? ?? ?? ?? 01"
// zone, level+0x4                    --> "89 5D E4 8B 0D ?? ?? ?? ?? 8B 35" 

state("NecroDancer") {}

state("NecroDancer", "1.29 (Steam/Classic)") { 
    int charTime     : 0x3BF6C8;
    int igt          : 0x3BF6D0;   
    int seed         : 0x3BF874;
    sbyte bossIntro  : 0x3BF408;
    sbyte charID     : 0x3BF584, 0x100; 
    sbyte deathless  : 0x3BF945;
    sbyte gamePaused : 0x3BF6C7;
    sbyte level      : 0x3BF98C;
    sbyte loading    : 0x3BF6CE;
    sbyte lowPercent : 0x3BF847;
    sbyte zone       : 0x3BF988;                
}

state("NecroDancer", "2.59 (Steam/Amplified)") { 
    int charTime     : 0x43593C;
    int igt          : 0x435944;
    int seed         : 0x435AF4;
    sbyte bossIntro  : 0x43557C;
    sbyte charID     : 0x435770, 0x11c;
    sbyte deathless  : 0x435BBD;
    sbyte gamePaused : 0x43596C;
    sbyte level      : 0x435C10;
    sbyte loading    : 0x435942;
    sbyte lowPercent : 0x435AC2;
    sbyte zone       : 0x435C0C; 
}


startup {
    refreshRate = 0.5;

    settings.Add("autoreset", true, "Auto Reset Conditions");
        settings.Add("igtReset", true, "Reset Timer When IGT Restarts", "autoreset");
        settings.Add("lobbyReset", true, "Reset Timer When Returning To Lobby", "autoreset");
        settings.Add("lostLowReset", false, "Reset Timer When Losing Low%", "autoreset");
    settings.Add("autosplit", true, "Auto Split Conditions");
        settings.Add("endSplit", true, "Split On Run Finish", "autosplit");
            settings.Add("zoneSplits", true, "Split On Zone Change", "endSplit");
                settings.Add("storyBossSplit", false, "Split Before Story Bosses", "zoneSplits");
                    settings.Add("levelSplits", false, "Split On Level Change", "storyBossSplit");

    settings.SetToolTip("autoreset", "Settings/conditions for when to auto reset");
        settings.SetToolTip("igtReset", "Resets the timer when the IGT is restarted/reinitialized (usually a quick restart in game)");
        settings.SetToolTip("lobbyReset", "Resets the timer upon returning to the main lobby");
        settings.SetToolTip("lostLowReset", "Resets the timer upon losing low% in game (e.g. picking up an item or hitting a shrine)");
    settings.SetToolTip("autosplit", "Settings/conditions for when to auto split");
        settings.SetToolTip("endSplit", "Splits on a finished run for an individual character");
            settings.SetToolTip("zoneSplits", "Splits after changing zones/depths (e.g. would split on transition from 2-4 to 3-1)");
                settings.SetToolTip("storyBossSplit", "Splits after the last zone/depth level/floor before entering story bosses\n(e.g. would split after 5-3 for cadence allowing for a separate segment for dead ringer and necrodancer)");
                    settings.SetToolTip("levelSplits", "Splits after changing levels/floors (e.g would split on transition from 1-2 to 1-3)\nThis will also split for Dead Ringer or Frankensteinway if playing as Cadence or Nocturna respectively");
    
    vars.seedChangedReset = false; 
    vars.splits = new HashSet<string>();
}

init {
	if (modules.First().ModuleMemorySize == 0x561000)
        version = "2.59 (Steam/Amplified)";
	else if (modules.First().ModuleMemorySize == 0x4FF000)
        version = "1.29 (Steam/Classic)";
    else 
        version = "Invalid/Unknown";
    
    vars.isAmplified = version.Contains("Amplified");
    refreshRate = (200/3.0);
}

exit {
    refreshRate = 0.5;
}

update {
    if (version.Contains("Invalid")) return false; 
}

start {
    if (vars.seedChangedReset || current.igt < old.igt) {
        vars.seedChangedReset = false;
        vars.splits.Clear();
        return true;
    }
}

reset {
    bool igtReset = settings["igtReset"] && (current.igt < old.igt);
    bool lostLow = settings["lostLowReset"] && (current.lowPercent == 0 && old.lowPercent == 1);
    bool returnedToLobby = settings["lobbyReset"] && (current.zone == 1 && current.level == -2);

    // Workaround if the player quick resets at the start in rapid succession,
    // as the IGT takes ~1 second to sync in memory at the start of a run
    if (current.igt == old.igt && old.igt == 0)
        vars.seedChangedReset = settings["igtReset"] && (current.seed > old.seed);

    return (returnedToLobby || igtReset || vars.seedChangedReset || lostLow);
}

split {
    string splitFlag = String.Format("S{0}_C{1}:Z{2}-L{3}", old.seed, old.charID, old.zone, old.level);
    if (vars.splits.Contains(splitFlag))
        return false;

    bool shouldSplit = false;
    var lastZone = (current.charID == 2) ? 1 : (vars.isAmplified ? 5 : 4);

    // Run Finish
    if (current.zone == lastZone && current.level >= 4 && current.level != old.level) {
        if (current.charID <= 2 || current.charID == 10) // Story Character
            shouldSplit = (current.level == 6 && old.level == 5);
        else if (current.charID == 6) // Dove
            shouldSplit = (current.level == 5 && old.level == 3);
        else
            shouldSplit = (current.level == 5 && old.level == 4);

        if (shouldSplit) {
            vars.splits.Add(splitFlag);
            return settings["endSplit"];
        }
    }

    // Deathless Mode Workaround (Run Finish)
    if (current.deathless == 1 && current.charTime < old.charTime && current.igt > current.charTime) {
        vars.splits.Add(splitFlag);
        return settings["endSplit"];
    }

    // Zone/Depth Change 
    if (Math.Abs(current.zone - old.zone) == 1 && old.level >= 3) {
        if (current.charID == 2) // Aria
            shouldSplit = current.zone < old.zone && old.level == 4;
        else if (current.charID == 6) // Dove
            shouldSplit = current.zone > old.zone && old.level == 3;
        else
            shouldSplit = current.zone > old.zone && old.level == 4;

        if (shouldSplit) {
            vars.splits.Add(splitFlag);
            return settings["zoneSplits"];
        }
    }

    // Level/Floor Change (also pre-story boss split)
    if (current.zone == old.zone && current.level > old.level && old.level > 0) {
        if (current.charID <= 2 || current.charID == 10) 
            shouldSplit = (settings["storyBossSplit"] && current.zone == lastZone && old.level == 3);
        shouldSplit = shouldSplit || settings["levelSplits"];

        if (shouldSplit) {
            vars.splits.Add(splitFlag);
            return shouldSplit;
        }
    }
}

isLoading { return current.loading == 0; } // Leave gameTime approximation on if not loading

gameTime {
    // Only sync the IGT with LiveSplit when the game is loading or the IGT updates in memory
    if (current.loading == 0 || current.igt != old.igt)
        return TimeSpan.FromMilliseconds(current.igt);
}
