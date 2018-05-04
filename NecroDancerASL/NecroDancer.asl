// TODO: 
//  - add extra documentation, maybe reformat existing documentation
//  - add a reset flag for losing low% (if setting is checked)
//  - option to replace IGT with RTA/noloads (ignores boss splash / menu pause)
//  - option to replace IGT with beat counter (1 beat = 1 second?)

/* 
Overview of variables used in state descriptors:
  
  charTime: the IGT of a single character run (it would reset to 0 for a new
            run/character in multi-char modes or deathless). Stored in 
            milliseconds, syncs every ~31 frames in normal gameplay or sooner 
            if the game is paused/loading.

  songTime: the elapsed time in ms of the current song. Not too useful, but
            is used in this script to avoid bugs of auto-reset failing for 
            <1 second resets in game (e.g. resetting for immediate shriner).

  igt:      the IGT, except it is preserved for each run/character in 
            multi-char modes or deathless. Otherwise, behaves mostly 
            identically to `charTime'.

  charID:   current ID of the player character (P1, coop not tested), which
            can be any of the following values (between 0-13 inclusive):
                0 = Cadence, 1 = Melody, 2 = Aria, 3 = Dorian, 4 = Eli
                5 = Monk, 6 = Dove, 7 = Coda, 8 = Bolt, 9 = Bard
                10 = Nocturna, 11 = Diamond, 12 = Mary, 13 = Tempo

  level:    current level or floor the player is on (e.g. 2 for 3-2). Some 
            notable values include x-5 for the final story boss level on story  
            characters (x-5 is the victory flag for non-story characters), x-6 
            for the story char victory flag, and a value of -2 for the lobby.

  loading:  flag to indicate the IGT is paused for a multiple of reasons -
            some of which are if the game is "loading", on a pause screen, 
            on a boss intro splash, on character death, or run victory. Has a
            value of 0 if IGT is or should be paused and is non-zero otherwise.
   
  zone:     current zone or depth the player is on (e.g. 2 for 2-3). Aria's
            zone reversal is reflected (starts zone 5/4, ends zone 1), but not
            many other notable changes from expected behavior aside from a few
            lobby quirks where the value will go above 5.
*/

state("NecroDancer") {}

state("NecroDancer", "1.29") { // Current patch of classic/predlc (Steam)
    int charTime : 0x3BF6C8;
    int igt : 0x3BF6D0;   
    //int seed : 0x3????;
    sbyte charID : 0x3BA354, 0x14, 0x100; 
    sbyte zone : 0x3BF988;                
    sbyte level : 0x3BF98C;
    sbyte loading : 0x3BF6CE;
    //int songTime : 0x3BF61C;
    //sbyte beatCounter : 0x3BF???; 
    //sbyte bossIntro : 0x3BF???; 
    //sbyte gamePaused : 0x3BF6C7; 
}

state("NecroDancer", "2.59") { // Current patch of amplified (Steam)
    int charTime : 0x43593C;
    int igt : 0x435944;
    int seed : 0x435AF4;
    sbyte charID : 0x435770, 8, 4, 0x11c;
    sbyte deathless : 0x435BBD;
    sbyte level : 0x435C10;
    sbyte loading : 0x435942;
    sbyte zone : 0x435C0C; 
    //int songTime : 0x435808;
    sbyte beatCounter : 0x4359B4;
    sbyte bossIntro : 0x43557C; 
    sbyte gamePaused : 0x43596C; 
}

startup {
    refreshRate = 60; 

    settings.Add("splits", true, "Auto Split Settings");
    settings.Add("endSplit", true, "Split On Run Finish", "splits");
    settings.Add("zoneSplits", true, "Split On Zone Change", "endSplit");
    settings.Add("levelSplits", false, "Split On Level Change", "zoneSplits");
    //settings.Add("experimental", false, "Experimental Fixes/Options");
    settings.Add("autoreset", true, "Auto Reset Settings");
    settings.Add("lobbyReset", true, "Reset On Returning To Lobby", "autoreset");
    settings.Add("igtReset", true, "Reset When IGT Resets", "autoreset");
    settings.Add("lostLowReset", false, "Reset When Losing Low%", "autoreset");
    settings.Add("seedReset", true, "Reset When Seed Changes", "autoreset");
    settings.Add("misc", false, "Misc. Settings");
    settings.Add("beatCounter", false, "Use `Beat Counter' for Game Time", "misc");
    settings.Add("rtaNoLoads", false, "Use `RTA No Loads' for Game Time", "misc");
    settings.Add("debug", false, "Debug Prints (DebugView)");

    settings.SetToolTip("endSplit", "Splits on a finished run for an individual character.");
    settings.SetToolTip("zoneSplits", "Splits after changing zones - e.g. would split on transition from 2-4 to 3-1.");
    settings.SetToolTip("levelSplits", "Splits after changing levels/floors (e.g from 1-2 to 1-3). This will also split for Dead Ringer or Frakensteinway if playing as Cadence or Nocturna respectively.");
    //settings.SetToolTip("experimental", "Some fixes/options that have been minimally tested.");

    print("[CoND.ASL] startup finished");
}

init {
    int mms = modules.First().ModuleMemorySize;
	if (mms == 0x4FF000)
        version = "1.29";
	else if (mms == 0x561000)
        version = "2.59";
    else 
        version = String.Format("<unknown> (0x{0:X8})", mms);

    if (settings["debug"])
        print(String.Format("[CoND.ASL] Version: `{0}'", version));

    vars.beats = 0;
    vars.isLoading = false;
    vars.isStoryChar = false;
    vars.lastZone = 0;
    vars.quickReset = false; 
    vars.runCounter = 0;
    vars.splits = new HashSet<string>();
}

update {
    if (version.Contains("<unknown>")) return false; 
    if (!version.Equals("2.59")) return false; // FIXME - temporary

    vars.isLoading = (current.loading == 0);
    vars.isStoryChar = (current.charID <= 2 || current.charID == 10);
    vars.lastZone = current.charID == 2 ? 1 : (version.Equals("2.59") ? 5 : 4);

    if (old.beatCounter - current.beatCounter == 1 && !vars.isLoading)
        vars.beats++;

    if (current.charTime < old.charTime && current.igt > current.charTime && current.level == 1) 
        vars.runCounter++;
}

start {
    if (vars.quickReset || current.igt < old.igt) {
        if (settings["debug"])
            print("[CoND.ASL] start: new run");
        vars.beats = 0;
        vars.quickReset = false;
        vars.runCounter = 0;
        vars.splits.Clear();
        return true;
    }
}

split {
    bool shouldSplit = false;
    string splitFlag = String.Format("R{0}_C{1}:Z{2}-L{3}", vars.runCounter, old.charID, old.zone, old.level);

    if (vars.splits.Contains(splitFlag))
        return false;

    // Run Finish Split
    if (current.zone == vars.lastZone && current.level >= 4 && current.level != old.level) {
        if (vars.isStoryChar) 
            shouldSplit = (current.level == 6 && old.level == 5);
        else if (current.charID == 6) // Dove
            shouldSplit = (current.level == 5 && old.level == 3);
        else
            shouldSplit = (current.level == 5 && old.level == 4);

        if (shouldSplit) { 
            if (settings["debug"])
                print(String.Format("[CoND.ASL] split: {0} (`run finish')", splitFlag));
            vars.splits.Add(splitFlag);
            return settings["endSplit"];
        }
    }

    // Deathless Mode Workaround (Run Finish)
    if (current.deathless == 1 && current.charTime < old.charTime && current.igt > current.charTime) {
        if (settings["debug"])
            print(String.Format("[CoND.ASL] split: {0} (`deathless win')", splitFlag));
        return settings["endSplit"];
    }

    // Zone/Depth Change Splits
    if (Math.Abs(current.zone - old.zone) == 1 && old.level >= 3 && current.level == 1) {
        if (current.charID == 2) // Aria
            shouldSplit = current.zone < old.zone && old.level == 4;
        else if (current.charID == 6) // Dove
            shouldSplit = current.zone > old.zone && old.level == 3;
        else
            shouldSplit = current.zone > old.zone && old.level == 4;

        if (shouldSplit) {
            if (settings["debug"])
                print(String.Format("[CoND.ASL] split: {0} (`zone change')", splitFlag));
            vars.splits.Add(splitFlag);
            return settings["zoneSplits"];
        }
    }

    // Level/Floor Change Splits
    if (current.zone == old.zone && current.level > old.level && old.level > 0) {
        if (settings["debug"])
            print(String.Format("[CoND.ASL] split: {0} (`level change')", splitFlag));
        vars.splits.Add(splitFlag);
        return settings["levelSplits"];
    }
}

reset {
    bool igtReset = (current.igt < old.igt);
    bool lostLow = false;
    bool returnedToLobby = (current.zone == 1 && current.level == -2);
    bool seedChanged = false;

    // Workaround if the player quick resets at the start in rapid succession,
    // as the IGT takes ~1 second to sync in memory at the start of a run
    if (current.igt == old.igt && old.igt == 0) {
        seedChanged = (current.seed > old.seed);
        vars.quickReset = seedChanged;
    }

    if (settings["debug"]) {
        if (returnedToLobby) 
            print("[CoND.ASL] reset: `returned to lobby'");
        else if (igtReset) 
            print("[CoND.ASL] reset: `IGT reset'");
        else if (seedChanged)
            print("[CoND.ASL] reset: `seed change'");
    }

    returnedToLobby = settings["lobbyReset"] && returnedToLobby;
    igtReset = settings["igtReset"] && igtReset;
    seedChanged = settings["seedReset"] && seedChanged;
    lostLow = settings["lostLowReset"] && lostLow;

    return (returnedToLobby || igtReset || seedChanged || lostLow);
}

isLoading {
    if (settings["beatCounter"])
        return true;
    else if (settings["rtaNoLoads"])
        return (vars.isLoading && !(current.bossIntro != 0 || current.gamePaused != 0));
    else
        return vars.isLoading;
}

gameTime {
    if (settings["beatCounter"])
        return TimeSpan.FromSeconds(vars.beats); 

    // The IGT in memory only updates once every ~0.5 seconds normally, so only
    // syntc the game time when the game "is loading" or when the IGT changes
    if (!settings["rtaNoLoads"] && (vars.isLoading || current.igt != old.igt))
        return TimeSpan.FromMilliseconds(current.igt);
}

// vim: set ts=4 sw=4 autoindent syntax=cs :
