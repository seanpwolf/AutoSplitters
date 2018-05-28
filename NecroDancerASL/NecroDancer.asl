// State Descriptor Variables:
//
// charTime    : IGT for a single char/run, syncs every ~0.5 seconds in normal gameplay
// igt         : IGT for all chars/runs, syncs every ~0.5 seconds in normal gameplay
// seed        : Has a value of -1 on lobby or for a few frames in between quick resets
// charID      : 0 = Cadence, 1 = Melody, 2 = Aria, 3 = Dorian, 4 = Eli, 
//               5 = Monk, 6 = Dove, 7 = Coda, 8 = Bolt, 9 = Bard, 
//               10 = Nocturna, 11 = Diamond, 12 = Mary, 13 = Tempo
// deathless   : Value of 1 if in deathless mode, 0 otherwise
// level       : Current level/floor
// loading     : Value of 0 if on a load screen, in a menu, or while a boss splash is up; non-zero otherwise
// lowPercent  : Value of 1 if still low%, 0 if low% is lost
// zone        : Current zone/depth

state("NecroDancer") {}

state("NecroDancer", "1.29 (Steam)") { // predlc/classic
    int charTime     : 0x3BF6C8;
    int igt          : 0x3BF6D0;   
    int seed         : 0x3BF874;
    sbyte charID     : 0x3BA354, 0x14, 0x100; 
    sbyte deathless  : 0x3BF945;
    sbyte level      : 0x3BF98C;
    sbyte loading    : 0x3BF6CE;
    sbyte lowPercent : 0x3BF847;
    sbyte zone       : 0x3BF988;                
}

state("NecroDancer", "2.59 (Steam)") { // amplified
    int charTime     : 0x43593C;
    int igt          : 0x435944;
    int seed         : 0x435AF4;
    sbyte charID     : 0x435770, 8, 4, 0x11c;
    sbyte deathless  : 0x435BBD;
    sbyte level      : 0x435C10;
    sbyte loading    : 0x435942;
    sbyte lowPercent : 0x435AC2;
    sbyte zone       : 0x435C0C; 
}

startup {
    refreshRate = 60;

    settings.Add("splits", true, "Auto Split Settings");
    settings.Add("endSplit", true, "Split On Run Finish", "splits");
    settings.Add("zoneSplits", true, "Split On Zone Change", "endSplit");
    settings.Add("levelSplits", false, "Split On Level Change", "zoneSplits");
    settings.Add("autoreset", true, "Auto Reset Settings");
    settings.Add("lobbyReset", true, "Reset On Returning To Lobby", "autoreset");
    settings.Add("igtReset", true, "Reset When IGT Resets", "autoreset");
    settings.Add("lostLowReset", false, "Reset When Losing Low%", "autoreset");

    settings.SetToolTip("splits", "Settings/conditions for when to auto split");
    settings.SetToolTip("endSplit", "Splits on a finished run for an individual character");
    settings.SetToolTip("zoneSplits", "Splits after changing zones/depths (e.g. would split on transition from 2-4 to 3-1)");
    settings.SetToolTip("levelSplits", "Splits after changing levels/floors (e.g would split on transition from 1-2 to 1-3)\nThis will also split for Dead Ringer or Frankensteinway if playing as Cadence or Nocturna respectively");
    settings.SetToolTip("autoreset", "Settings/conditions for when to auto reset");
    settings.SetToolTip("lobbyReset", "Resets the timer upon returning to the main lobby");
    settings.SetToolTip("igtReset", "Resets the timer when the IGT is initialized and reset (usually a quick restart in game)");
    settings.SetToolTip("lostLowReset", "Resets the timer upon losing low% in game (e.g. picking up an item or hitting a shrine)");
}

init {
    int mms = modules.First().ModuleMemorySize;
	if (mms == 0x4FF000)
        version = "1.29 (Steam)";
	else if (mms == 0x561000)
        version = "2.59 (Steam)";
    else 
        version = String.Format("<unknown> (0x{0:X8})", mms);

    vars.quickReset = false; 
    vars.runCounter = 0;
    vars.splits = new HashSet<string>();
}

update {
    if (version.Contains("<unknown>")) return false; 

    if (current.charTime < old.charTime && current.igt > current.charTime && current.level == 1)
        vars.runCounter++;
}

start {
    if (vars.quickReset || current.igt < old.igt) {
        vars.quickReset = false;
        vars.runCounter = 0;
        vars.splits.Clear();
        return true;
    }
}

split {
    bool shouldSplit = false;
    var lastZone = current.charID == 2 ? 1 : (version.Contains("2.59") ? 5 : 4);
    string splitFlag = String.Format("R{0}_C{1}:Z{2}-L{3}", vars.runCounter, old.charID, old.zone, old.level);

    if (vars.splits.Contains(splitFlag))
        return false;

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
    if (current.deathless == 1 && current.charTime < old.charTime && current.igt > current.charTime) 
        return settings["endSplit"];

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

    // Level/Floor Change 
    if (current.zone == old.zone && current.level > old.level && old.level > 0) {
        vars.splits.Add(splitFlag);
        return settings["levelSplits"];
    }
}

reset {
    bool igtReset = settings["igtReset"] && (current.igt < old.igt);
    bool lostLow = settings["lostLowReset"] && (current.lowPercent == 0 && old.lowPercent == 1);
    bool returnedToLobby = settings["lobbyReset"] && (current.zone == 1 && current.level == -2);
    bool seedChanged = false;

    // Workaround if the player quick resets at the start in rapid succession,
    // as the IGT takes ~1 second to sync in memory at the start of a run
    if (current.igt == old.igt && old.igt == 0)
        seedChanged = settings["igtReset"] && (current.seed > old.seed);

    vars.quickReset = seedChanged;
    return (returnedToLobby || igtReset || seedChanged || lostLow);
}

isLoading {
    return current.loading == 0;
}

gameTime {
    // The IGT in memory only updates once every ~0.5 seconds normally, so only
    // sync the game time when the game "is loading" or when the IGT changes
    if (current.loading == 0 || current.igt != old.igt)
        return TimeSpan.FromMilliseconds(current.igt);
}

// vim: set ts=4 sw=4 autoindent syntax=cs :
