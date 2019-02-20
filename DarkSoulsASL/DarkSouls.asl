// Huge thanks to Wulf2k (DSCM) and TKGP (DS Gadget) - most of 
// the pointers and offsets used are sourced from their apps
state("DARKSOULS") {}

state("DARKSOULS", "Steam") {
    uint efBossMain  : 0xF7D7D4, 0, 0x0;    // Most bosses excluding ones below
    uint efBossBurg  : 0xF7D7D4, 0, 0xF70;  // Taurus Demon, Capra Demon
    uint efDusk      : 0xF7D7D4, 0, 0x1E40; // Dusk (Broken Pendant)
    uint efBossMB    : 0xF7D7D4, 0, 0x1E70; // Moonlight Butterfly
    uint efBossDLC   : 0xF7D7D4, 0, 0x2300; // DLC bosses
    uint efBossDF    : 0xF7D7D4, 0, 0x3C30; // Firesage
    uint efBossCD    : 0xF7D7D4, 0, 0x3C70; // Ceaseless, Centipede 
    uint efDarkAL    : 0xF7D7D4, 0, 0x4630; // Dark Anor Londo
    uint efBossG     : 0xF7D7D4, 0, 0x4670; // Gywndolin
    uint efBossSD    : 0xF7D7D4, 0, 0x5A70; // Stray Demon

    int charPtr      : 0xF7DC70, 4, 0;
    int efPtr        : 0xF7D7D4, 0;
    int bonfire  : 0xF784A0, 0xB04;

    int igt          : 0xF78700, 0x68;
    int ngplus       : 0xF78700, 0x3C; 
    uint mpzone      : 0xF7E204, 0xA14;
    short worldarea  : 0xF7E204, 0xA12;
    float xPos       : 0xF7DC70, 4, 0, 0x28, 0x1C, 0x10;
    float yPos       : 0xF7DC70, 4, 0, 0x28, 0x1C, 0x14;
    float zPos       : 0xF7DC70, 4, 0, 0x28, 0x1C, 0x18;
}

state("DARKSOULS", "Debug") {
    int igt : 0xF7C8C0, 0x68;
}

startup {
    // --- Better Settings Sort Order? ---
    // Asylum Demon
    // Bells / Lord Vessel
    //     Gargoyles
    //     Iron Golem
    //     Ornstein & Smough
    //     Quelaag
    // Darkroot
    //     Butterfly 
    //     Dusk
    //     Sif
    // Demon Ruins
    //     Ceaseless
    //     Demon Firesage
    //     Centipede Demon
    // DLC    
    //     Sanctuary Guardian
    //     Artorias
    //     Kalameet
    //     Manus
    // Lord Souls
    //     Bed of Chaos
    //     Four Kings
    //     Pinwheel
    //     Nito
    //     Seath
    // Other Optional Bosses
    //     Gwyndolin
    //     Priscilla
    //     Stray Demon
    // Undead Burg / Depths
    //     Capra
    //     Gaping
    //     Taurus

    settings.Add("eventSplits", false, "Boss/Event Split Conditions");
    settings.CurrentDefaultParent = "eventSplits";

    settings.Add("artorias", true, "Artorias"); 
        settings.Add("artoriasExitZone", true, "On Exiting Boss Area", "artorias");
        settings.Add("artoriasOnNextLoad", false, "On Next Load", "artorias");
        settings.Add("artoriasLastBonfire", false, "On Resting At Oolacile Township Bonfire", "artorias");
    settings.Add("asylum", true, "Asylum Demon");
        settings.Add("asylumLastBonfire", false, "On Entering Firelink Shrine", "asylum");
        settings.Add("asylumOnNextLoad", true, "On Next Load", "asylum");
    settings.Add("bocOnNextLoad", true, "Bed of Chaos (On Next Load)");
    settings.Add("capra", true, "Capra Demon");
        settings.Add("capraExitZone", false, "On Exiting Boss Area", "capra");
        settings.Add("capraOnNextLoad", true, "On Next Load", "capra");
    settings.Add("ceaselessOnNextLoad", true, "Ceaseless Discharge (On Next Load)");
    settings.Add("centipedeExitZone", true, "Centipede Demon (On Exiting Boss Area)"); 
    settings.Add("firesageExitZone", true, "Demon Firesage (On Exiting Boss Area)"); 
    settings.Add("duskOnNextLoad", true, "Dusk Freed (On Next Load)");
    settings.Add("fourkingsOnNextLoad", true, "Four Kings (On Next Load)");
    settings.Add("gapingOnNextLoad", true, "Gaping Dragon (On Next Load)");
    settings.Add("gargsOnNextLoad", true, "Gargoyles (On Next Load)");
    settings.Add("golemExitZone", true, "Iron Golem (On Entering Anor Londo)"); 
    settings.Add("gwynOnNextLoad", true, "Gwyn (On Credits)");
    settings.Add("gwyndolinOnNextLoad", true, "Gwyndolin (On Next Load)");
    settings.Add("kalameetOnNextLoad", true, "Kalameet (On Next Load)");
    settings.Add("manusOnNextLoad", true, "Manus (On Next Load)");
    settings.Add("butterflyOnNextLoad", true, "Moonlight Butterfly (On Next Load)");
    settings.Add("nitoOnNextLoad", true, "Nito (On Next Load)");
    settings.Add("ons", true, "Ornstein & Smough"); 
        settings.Add("onsOnNextLoad", false, "On Next Load", "ons");
        settings.Add("darkALOnNextLoad", true, "On Next Load After Turning Anor Londo Dark", "ons");
    settings.Add("pinwheelExitZone", true, "Pinwheel (On Exiting Boss Area)");
    settings.Add("priscilla", true, "Priscilla");
        settings.Add("priscillaExitZone", false, "On Exiting Painted World", "priscilla");
        settings.Add("priscillaOnNextLoad", true, "On Next Load", "priscilla");
    settings.Add("quelaag", true, "Quelaag"); 
        settings.Add("quelaagExitZone", false, "On Exiting Boss Area", "quelaag");
        settings.Add("quelaagOnNextLoad", true, "On Next Load", "quelaag");
        settings.Add("quelaagLastBonfire", false, "On Resting At Daughter of Chaos Bonfire", "quelaag");
    settings.Add("sguardian", true, "Sanctuary Guardian"); 
        settings.Add("sguardianExitZone", true, "On Exiting Boss Area", "sguardian");
        settings.Add("sguardianLastBonfire", false, "On Resting At Oolacile Sanctuary Bonfire", "sguardian");
    settings.Add("seathOnNextLoad", true, "Seath (On Next Load)");
    settings.Add("sifOnNextLoad", true, "Sif (On Next Load)");
    settings.Add("strayOnNextLoad", true, "Stray Demon (On Next Load)");
    settings.Add("taurusExitZone", true, "Taurus Demon (On Exiting Boss Area)");

    //settings.Add("miscSplits", false, "Misc. Split Conditions");
    //settings.CurrentDefaultParent = "miscSplits";
    //settings.Add("sgsOnNextLoad", false, "Sen's Gate Skip (On Next Load)");
    //settings.Add("wwKilnOnNextLoad", false, "PCC Wrong Warp to Kiln (On Next Load)");

    vars.eventFlagsCurrent = new Dictionary<string, uint>() {
        {"efBossMain", 0xFFFFFFFF},
        {"efBossBurg", 0xFFFFFFFF},
        {"efDusk",     0xFFFFFFFF},
        {"efBossMB",   0xFFFFFFFF},
        {"efBossDLC",  0xFFFFFFFF},
        {"efBossDF",   0xFFFFFFFF},
        {"efBossCD",   0xFFFFFFFF},
        {"efDarkAL",   0xFFFFFFFF},
        {"efBossG",    0xFFFFFFFF},
        {"efBossSD",   0xFFFFFFFF}
    };
    vars.eventFlagsOld = new Dictionary<string, uint>(vars.eventFlagsCurrent);

    vars.eventFlagMasks = new Dictionary<string, Dictionary<uint, string>>() {
        {"efBossMain", new Dictionary<uint, string>() {
            {0x00008000, "asylum"},
            {0x00200000, "boc"},
            {0x00040000, "fourkings"},
            {0x20000000, "gaping"},
            {0x10000000, "gargs"},
            {0x00100000, "golem"},
            {0x00010000, "gwyn"},
            {0x01000000, "nito"},
            {0x00080000, "ons"},
            {0x02000000, "pinwheel"},
            {0x08000000, "priscilla"},
            {0x00400000, "quelaag"},
            {0x00020000, "seath"},
            {0x04000000, "sif"}
        }},
        {"efBossBurg", new Dictionary<uint, string>() {
            {0x02000000, "capra"},
            {0x04000000, "taurus"}
        }},
        {"efDusk"    , new Dictionary<uint, string>() {
            {0x00000400, "dusk"}, // 0x2000 for golden golem kill
            {0x00800000, "dusk"}, 
        }},
        {"efBossMB"  , new Dictionary<uint, string>() {
            {0x08000000, "butterfly"},
        }},
        {"efBossDLC" , new Dictionary<uint, string>() {
            {0x40000000, "artorias"},
            {0x0C000000, "kalameet"},
            {0x20000000, "manus"},
            {0x80000000, "sguardian"}
        }},
        {"efBossDF"  , new Dictionary<uint, string>() {
            {0x00004020, "firesage"}
        }},
        {"efBossCD"  , new Dictionary<uint, string>() {
            {0x08000000, "ceaseless"},
            {0x04000000, "centipede"}
        }},
        {"efDarkAL"  , new Dictionary<uint, string>() {
            {0x00008000, "darkAL"}
        }},
        {"efBossG"   , new Dictionary<uint, string>() {
            {0x08000000, "gwyndolin"}
        }},
        {"efBossSD"  , new Dictionary<uint, string>() {
            {0x08000000, "stray"}
        }}
    };

    vars.splitFlagZones = new Dictionary<string, uint>() {
        {"artoriasExitZone",  0xFF54F2E5},
        {"capraExitZone",     0xFF57FCA0},
        {"centipedeExitZone", 0xFF51E221},
        {"firesageExitZone",  0xFF51E40C},
        {"golemExitZone",     0xFFFFFFEB},
        {"quelaagExitZone",   0xFFFFFFED},
        {"pinwheelExitZone",  0xFFFFFFF0},
        {"priscillaExitZone", 0xFFFFFFF2},
        {"sguardianExitZone", 0xFF54F2E6},
        {"taurusExitZone",    0xFF57FCA1}
    };

    vars.splitFlagBonfires = new Dictionary<string, int>() {
        {"asylumLastBonfire",    1022960}, 
        {"artoriasLastBonfire",  1212962},
        {"quelaagLastBonfire",   1402960},
        {"sguardianLastBonfire", 1212961}
    };

    // value is compare op (0.0f is ==, pos is >=, neg is <=), xPos, yPos, zPos
    //vars.splitFlagCoords = new Dictionary<string, float[]>() {
        //{"quelaagExitCoords", new float[] {1.0f, 98.0f, Single.NegativeInfinity, Single.NegativeInfinity}}
    //};

    vars.igt = 0;
    vars.isLoaded = false;
    vars.justStarted = true;
    vars.removedQuitoutDelay = true;
    vars.completedSplits = new HashSet<string>();
    vars.queuedSplits = new HashSet<string>();
}

init {
    int mms = modules.First().ModuleMemorySize;
	if (mms == 0x11C2000)
        version = "Steam";
	else if (mms == 0x11C6000) 
        version = "Debug";
    else 
        version = String.Format("<unknown> (0x{0:X8})", mms);

    //vars.oldWA = (short)-1;
    //vars.curWA = (short)-1;
    //vars.oldZone = 0xFFFFFFFF;
    //vars.curZone = 0xFFFFFFFF;
}

update {
    if (version.Contains("unknown")) return false;
    vars.isLoaded = current.charPtr != 0;

    //if (vars.isLoaded) {
        //if (current.worldarea != -1 && vars.curWA != current.worldarea) {
            //vars.oldWA = vars.curWA;
            //vars.curWA = current.worldarea;
            //if (vars.oldWA != -1)
            //print(String.Format("[DS.ASL] worldarea: {0:X4} -> {1:X4}", vars.oldWA, vars.curWA));
        //}
        //if (current.mpzone != 0xFFFFFFFF && vars.curZone != current.mpzone) {
            //vars.oldZone = vars.curZone;
            //vars.curZone = current.mpzone;
            //if (vars.oldZone != 0xFFFFFFFF)
            //print(String.Format("[DS.ASL] mpzone: {0:X8} -> {1:X8}", vars.oldZone, vars.curZone));
        //}
    //}

    //var posPtr = new IntPtr(current.charPtr + 0x28);
    //posPtr = new IntPtr(memory.ReadValue<int>(posPtr) + 0x1C);
    //posPtr = new IntPtr(memory.ReadValue<int>(posPtr) + 0x10);
    //var x = memory.ReadValue<uint>(new IntPtr(current.efPtr + 0x2300));
    //var y = memory.ReadValue<float>(posPtr);
    //if (vars.tmp) {
        //vars.tmp = false;
        //print(String.Format("[DS.ASL] event flag = {0:X8}", current.efBossDLC));
        //print(String.Format("[DS.ASL] dlc boss   = {0:X8}", x));
        //print(String.Format("[DS.ASL] xPos = {0}", current.xPos));
        //print(String.Format("[DS.ASL] posX = {0}", y));
    //}
}

start {
    if (!version.Equals("Steam")) return false;

    if (!(vars.igt == 0 && vars.completedSplits.Count == 0)) {
        vars.igt = 0;
        vars.justStarted = true;
        vars.removedQuitoutDelay = true;
        vars.completedSplits.Clear();
        vars.queuedSplits.Clear();
        print("[DS.ASL] start: reinitialized helpers");
    }

    bool shouldStart = false;
    Func<float, float, float, bool> floatEquals = (x, y, p) => (Math.Abs(x - y) <= p);

    if (vars.isLoaded) {
        shouldStart = (current.worldarea == 0x1201 && 
                       current.mpzone == 0xFFFFFFFE &&
                       floatEquals(current.xPos, -15.45f, 0.001f) && 
                       floatEquals(current.yPos, 184.70f, 0.001f) && 
                       floatEquals(current.zPos, -46.80f, 0.001f));

        if (shouldStart)
            print(String.Format("[DS.ASL] start: shouldStart = {0}", shouldStart));
        return shouldStart;
    }
}

// A better/ideal reset condition would be on deleting the first save file
// or on creating a new character - don't have good leads for these though
reset {
    if (!version.Equals("Steam")) return false;

    // Relies on auto start being active - so effectively disable auto-reset
    // if auto-start is disabled by the user (otherwise manually started
    // runs would be automatically reset if accidently left active)
    //
    // Not an ideal way to handle this, might be able to fix it (TODO)
    if (!settings.StartEnabled) return false;

    bool shouldReset = false;
    Func<float, float, float, bool> floatEquals = (x, y, p) => (Math.Abs(x - y) <= p);

    // Reset if the current position is the initial spawn in asylum upon
    // creating a new character and if the current IGT is 2 seconds or less
    if (settings.StartEnabled && vars.isLoaded) {
        shouldReset = (vars.igt <= 2000 &&
                       current.worldarea == 0x1201 && 
                       current.mpzone == 0xFFFFFFFE &&
                       floatEquals(current.xPos, -15.45f, 0.001f) && 
                       floatEquals(current.yPos, 184.70f, 0.001f) && 
                       floatEquals(current.zPos, -46.80f, 0.001f));

        // "delay" auto-resets until moved from the spawn point - prevents chain
        // of auto-start --> auto-reset etc. since they share sim. conditionals
        if (vars.justStarted) 
            vars.justStarted = shouldReset;
        else {
            if (shouldReset)
                print(String.Format("[DS.ASL] reset: shouldReset = {0}", shouldReset));
            return shouldReset;
        }
    }
}

split {
    if (!version.Equals("Steam")) return false;

    // TODO: clear completed/queued splits on entering new NG+
    bool shouldSplit = false;
    vars.queuedSplits.ExceptWith(vars.completedSplits);

    if (vars.isLoaded) {
        // Maybe use MemoryWatchers instead?
        // Update event flags
        if (current.mpzone != 0xFFFFFFFF) {
            foreach (KeyValuePair<string, uint> eventFlag in vars.eventFlagsCurrent)
                vars.eventFlagsOld[eventFlag.Key] = eventFlag.Value;
            vars.eventFlagsCurrent["efBossMain"] = current.efBossMain;
            vars.eventFlagsCurrent["efBossBurg"] = current.efBossBurg;
            vars.eventFlagsCurrent["efDusk"]     = current.efDusk;
            vars.eventFlagsCurrent["efBossMB"]   = current.efBossMB;
            vars.eventFlagsCurrent["efBossDLC"]  = current.efBossDLC;
            vars.eventFlagsCurrent["efBossDF"]   = current.efBossDF;
            vars.eventFlagsCurrent["efBossCD"]   = current.efBossCD;
            vars.eventFlagsCurrent["efDarkAL"]   = current.efDarkAL;
            vars.eventFlagsCurrent["efBossG"]    = current.efBossG;
            vars.eventFlagsCurrent["efBossSD"]   = current.efBossSD;
        }

        // Check to see if a event flag was newly set 
        foreach (KeyValuePair<string, uint> ef in vars.eventFlagsCurrent) {
            uint efCurrent = ef.Value;
            uint efOld = vars.eventFlagsOld[ef.Key];
            uint mask = (efCurrent > efOld) ? efCurrent ^ efOld : 0;
            bool splitEnabled = false;
            string splitFlag = "";
            string[] splitTypes = "OnNextLoad ExitZone LastBonfire".Split(' ');

            if (vars.eventFlagMasks[ef.Key].TryGetValue(mask, out splitFlag)) {
                foreach (string s in splitTypes) {
                    splitEnabled = settings.ContainsKey(splitFlag+s);
                    splitEnabled = splitEnabled && settings[splitFlag+s];

                    if (!vars.completedSplits.Contains(splitFlag+s) && splitEnabled) 
                        print(String.Format("[DS.ASL] split: added {0} to queue ({1})", splitFlag+s, vars.queuedSplits.Add(splitFlag+s)));
                }
            }
        }

        // Check queued splits and actually split if their conditions are met
        foreach (string splitFlag in vars.queuedSplits) {
            if (splitFlag.Contains("ExitZone")) 
                shouldSplit = (current.mpzone != 0xFFFFFFFF &&
                               current.mpzone != old.mpzone && 
                               old.mpzone == vars.splitFlagZones[splitFlag]);
            else if (splitFlag.Contains("LastBonfire")) 
                shouldSplit = (current.bonfire != -1 &&
                               current.bonfire != old.bonfire && 
                               current.bonfire == vars.splitFlagBonfires[splitFlag]);

            if (shouldSplit)
                print(String.Format("[DS.ASL] split: {0}", splitFlag));
            return shouldSplit && vars.completedSplits.Add(splitFlag); 
        }
    } else { // !vars.isLoaded
        // Check queued "OnNextLoad" splits and split 
        foreach (string splitFlag in vars.queuedSplits) {
            if (splitFlag.Contains("OnNextLoad")) {
                print(String.Format("[DS.ASL] split: {0}", splitFlag));
                return vars.completedSplits.Add(splitFlag); 
            }
        }
    }
}

isLoading {
    return true; // disables gameTime approximation
}

gameTime {
    // might need to fix time on split when splitting after a quitout*
    if (current.igt > 0) {
        vars.igt = current.igt;
        vars.removedQuitoutDelay = false;
    } else if (!vars.removedQuitoutDelay) {
        vars.igt -= 594;
        vars.removedQuitoutDelay = true;
    }
    return TimeSpan.FromMilliseconds(vars.igt);
}

// vim: set ts=4 sw=4 autoindent syntax=cs :
