state("DARKSOULS") {} 

startup {
    refreshRate = 0.5;

    // --- Start Settings ---
    settings.Add("startConds", false, "Auto Start (on start of new playthrough)");
    settings.Add("resetConds", false, "Auto Reset Conditions");
    settings.Add("splitConds", false, "Auto Split Conditions");
    settings.Add("info", true, "=== Info ===");
    
    settings.CurrentDefaultParent = "resetConds";
        settings.Add("resetNewChar", false, "Reset on entering new character creation screen");
        settings.Add("resetNewRun", true, "Reset if starting position is the initial spawn in Asylum");

    settings.CurrentDefaultParent = "splitConds";
        settings.Add("artorias", true, "Artorias"); 
            settings.Add("artoriasExitZone", false, "On Exiting Boss Area", "artorias");
            settings.Add("artoriasOnNextLoad", true, "On Next Load", "artorias");
            settings.Add("artoriasLastBonfire", false, "On Resting At Oolacile Township Bonfire", "artorias");
        settings.Add("asylum", true, "Asylum Demon");
            settings.Add("asylumLastBonfire", false, "On Entering Firelink Shrine", "asylum");
            settings.Add("asylumOnNextLoad", true, "On Next Load", "asylum");
        settings.Add("bocOnNextLoad", true, "Bed of Chaos (On Next Load)");
        settings.Add("capraOnNextLoad", true, "Capra Demon (On Next Load)");
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
            settings.Add("quelaagOnNextLoad", true, "On Next Load", "quelaag");
            settings.Add("quelaagLastBonfire", false, "On Resting At Demon Ruins Bonfire", "quelaag");
        settings.Add("sguardian", true, "Sanctuary Guardian"); 
            settings.Add("sguardianExitZone", true, "On Exiting Boss Area", "sguardian");
            settings.Add("sguardianLastBonfire", false, "On Resting At Oolacile Sanctuary Bonfire", "sguardian");
        settings.Add("seathOnNextLoad", true, "Seath (On Next Load)");
        settings.Add("sifOnNextLoad", true, "Sif (On Next Load)");
        settings.Add("sgsOnNextLoad", true, "Sen's Gate Skip (On Next Load)");
        settings.Add("strayOnNextLoad", true, "Stray Demon (On Next Load)");
        settings.Add("taurusExitZone", true, "Taurus Demon (On Exiting Boss Area)");
        settings.Add("wrongwarpKiln", true, "Wrong Warp to Kiln (Using PCC)");

    settings.CurrentDefaultParent = "info";
        settings.Add("info1", false, "Auto splitter for Dark Souls PTDE by seanpwolf");
        settings.Add("info2", false, "Website: https://github.com/seanpwolf/AutoSplitters");
    // --- End Settings ---

    vars.efMasks = new Dictionary<string, Dictionary<uint, string>>() {
        {"0x0000", new Dictionary<uint, string>() {
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
        {"0x0F70", new Dictionary<uint, string>() {
            {0x02000000, "capra"},
            {0x04000000, "taurus"}
        }},
        {"0x1E40", new Dictionary<uint, string>() {
            {0x00000400, "dusk"}, 
            {0x00800000, "dusk"} 
        }},
        {"0x1E70", new Dictionary<uint, string>() {
            {0x08000000, "butterfly"},
        }},
        {"0x2300", new Dictionary<uint, string>() {
            {0x40000000, "artorias"},
            {0x0C000000, "kalameet"},
            {0x20000000, "manus"},
            {0x80000000, "sguardian"}
        }},
        {"0x3C30", new Dictionary<uint, string>() {
            {0x00004020, "firesage"}
        }},
        {"0x3C70", new Dictionary<uint, string>() {
            {0x08000000, "ceaseless"},
            {0x04000000, "centipede"}
        }},
        {"0x4630", new Dictionary<uint, string>() {
            {0x00008000, "darkAL"}
        }},
        {"0x4670", new Dictionary<uint, string>() {
            {0x08000000, "gwyndolin"}
        }},
        {"0x5A70", new Dictionary<uint, string>() {
            {0x08000000, "stray"}
        }}
    };

    vars.splitFlagZones = new Dictionary<string, int>() {
        {"artoriasExitZone",  -11210011}, // 0xFF54F2E5
        {"capraExitZone",     -11010912}, // 0xFF57FCA0
        {"centipedeExitZone", -11410911}, // 0xFF51E221
        {"firesageExitZone",  -11410420}, // 0xFF51E40C
        {"golemExitZone",     -21},       // 0xFFFFFFEB
        {"quelaagExitZone",   -19},       // 0xFFFFFFED
        {"pinwheelExitZone",  -16},       // 0xFFFFFFF0
        {"priscillaExitZone", -14},       // 0xFFFFFFF2
        {"sguardianExitZone", -11210010}, // 0xFF54F2E6
        {"taurusExitZone",    -11010911}  // 0xFF57FCA1
    };

    vars.splitFlagBonfires = new Dictionary<string, int>() {
        {"asylumLastBonfire",    1022960}, 
        {"artoriasLastBonfire",  1212962},
        //{"quelaagLastBonfire",   1402960}, // DoC
        {"quelaagLastBonfire",   1412961}, // Demon Ruins
        {"sguardianLastBonfire", 1212961}
    };

    vars.pointers = new Dictionary<string, DeepPointer>() {
        {"charLoaded", null},
        {"igt",        null},
        {"worldZone",  null}
    };

    // Effectively a manual MemoryWatcher like data structure - done so
    // I can update this data structure only when values pass a condition
    vars.area = new Dictionary<string, dynamic>(){
        {"Current", 0},
        {"Old",     0},
        {"Changed", false}
    };
    vars.mpzone = new Dictionary<string, dynamic>(){
        {"Current", 0},
        {"Old",     0},
        {"Changed", false}
    };
    vars.world = new Dictionary<string, dynamic>(){
        {"Current", 0},
        {"Old",     0},
        {"Changed", false}
    };

    vars.UpdateDictWatcher = (Func<Dictionary<string, dynamic>, dynamic, bool>)((dw, val) => {
        dw["Old"] = dw["Current"];
        dw["Current"] = val;
        dw["Changed"] = !(dw["Current"].Equals(dw["Old"]));
        return dw["Changed"]; 
    });

    vars.count = 0;
    vars.igt = 0;
    vars.isLoaded = false;
    vars.justStarted = true;
    vars.newNGPlus = false;
    vars.removedQuitoutDelay = true;
    vars.shouldStart = false;
    vars.completedSplits = new HashSet<string>();
    vars.queuedSplits = new HashSet<string>();
}

init {
    if (vars.count > 9) {
        print("[DS.ASL] Failed to sigscan 10 times, assuming version is invalid.");
        version = "Invalid";
        return;
    }
    string procName = game.ProcessName + ".exe";
    var scanner = new SignatureScanner(game, modules.First().BaseAddress, modules.First().ModuleMemorySize);

    // AOB scans for base pointers 
    int charDataPtr   = (int) scanner.Scan(new SigScanTarget(1, "A1 ?? ?? ?? ?? 8B 40 34 53 32"));
    int charLoadedPtr = (int) scanner.Scan(new SigScanTarget(1, "A1 ?? ?? ?? ?? 8B 48 04 8B 40 08 53"));
    int deathcamPtr   = (int) scanner.Scan(new SigScanTarget(1, "A1 ?? ?? ?? ?? 39 48 3C 0F 94"));
    int eventFlagPtr  = (int) scanner.Scan(new SigScanTarget(1, "A1 ?? ?? ?? ?? 53 55 56 8B F1 33 ED"));
    int worldStatePtr = (int) scanner.Scan(new SigScanTarget(4, "83 EC 0C A1 ?? ?? ?? ?? 80 B8"));
    int worldZonePtr  = (int) scanner.Scan(new SigScanTarget(1, "A1 ?? ?? ?? ?? 53 55 56 8B B0"));
    var scanPtrs = new int[] {
        charDataPtr,
        charLoadedPtr,
        deathcamPtr,
        eventFlagPtr,
        worldStatePtr,
        worldZonePtr
    };
    if (scanPtrs.Any(ptr => ptr == 0))
        throw new Exception("[DS.ASL] Failed to find all memory addresses ("+(++vars.count)+").");

    // Read pointers from scans and make them relative (for DeepPointer usage)
    charDataPtr   = memory.ReadValue<int>((IntPtr)charDataPtr)   - (int)modules.First().BaseAddress;
    charLoadedPtr = memory.ReadValue<int>((IntPtr)charLoadedPtr) - (int)modules.First().BaseAddress;
    deathcamPtr   = memory.ReadValue<int>((IntPtr)deathcamPtr)   - (int)modules.First().BaseAddress;
    eventFlagPtr  = memory.ReadValue<int>((IntPtr)eventFlagPtr)  - (int)modules.First().BaseAddress;
    worldStatePtr = memory.ReadValue<int>((IntPtr)worldStatePtr) - (int)modules.First().BaseAddress;
    worldZonePtr  = memory.ReadValue<int>((IntPtr)worldZonePtr)  - (int)modules.First().BaseAddress;

    // Updated every script iteration without caring about changes, so no MemoryWatchers needed
    vars.pointers["charLoaded"] = new DeepPointer(procName, charLoadedPtr, 4, 0);
    vars.pointers["igt"]        = new DeepPointer(procName, charDataPtr, 0x68);
    vars.pointers["worldZone"]  = new DeepPointer(procName, worldZonePtr, 0xA10);

    // Updated when the game is loaded (values are irrelevant when game isn't loaded)
    vars.ngplus    = new MemoryWatcher<int>(new DeepPointer(procName, charDataPtr, 0x3C));
    vars.deathcam  = new MemoryWatcher<byte>(new DeepPointer(procName, deathcamPtr, 0x40));
    vars.bonfire   = new MemoryWatcher<int>(new DeepPointer(procName, worldStatePtr, 0xB04));
    vars.xPos      = new MemoryWatcher<float>(new DeepPointer(procName, worldStatePtr, 0xB70));
    vars.yPos      = new MemoryWatcher<float>(new DeepPointer(procName, worldStatePtr, 0xB74));
    vars.zPos      = new MemoryWatcher<float>(new DeepPointer(procName, worldStatePtr, 0xB78));
    vars.watchers = new MemoryWatcherList() {
        vars.ngplus,
        vars.deathcam,
        vars.bonfire,
        vars.xPos,
        vars.yPos,
        vars.zPos
    };

    // Updated when the game is not loaded (these are used for an auto reset condition)
    //vars.charNum = new MemoryWatcher<int>(new DeepPointer(procName, charDataPtr, 0x8, 0x8));
    //vars.charClass = new MemoryWatcher<byte>(new DeepPointer(procName, charDataPtr, 0x8, 0xC6));
    //vars.charGift = new MemoryWatcher<byte>(new DeepPointer(procName, charDataPtr, 0x8, 0xC8));
    //vars.charVit = new MemoryWatcher<int>(new DeepPointer(procName, charDataPtr, 0x8, 0x38));
    //vars.charAtn = new MemoryWatcher<int>(new DeepPointer(procName, charDataPtr, 0x8, 0x40));
    //vars.charEnd = new MemoryWatcher<int>(new DeepPointer(procName, charDataPtr, 0x8, 0x48));
    //vars.charStr = new MemoryWatcher<int>(new DeepPointer(procName, charDataPtr, 0x8, 0x50));
    //vars.charDex = new MemoryWatcher<int>(new DeepPointer(procName, charDataPtr, 0x8, 0x58));
    //vars.charInt = new MemoryWatcher<int>(new DeepPointer(procName, charDataPtr, 0x8, 0x60));
    //vars.charFth = new MemoryWatcher<int>(new DeepPointer(procName, charDataPtr, 0x8, 0x68));
    //vars.charRes = new MemoryWatcher<int>(new DeepPointer(procName, charDataPtr, 0x8, 0x80));
    //vars.charLvl = new MemoryWatcher<int>(new DeepPointer(procName, charDataPtr, 0x8, 0x88));

    // Also updated when game is loaded (separated so all event flag watchers can be iterated over separately)
    vars.eventFlags = new MemoryWatcherList() {
        new MemoryWatcher<uint>(new DeepPointer(procName, eventFlagPtr, 0, 0x0000)) { Name = "0x0000" },
        new MemoryWatcher<uint>(new DeepPointer(procName, eventFlagPtr, 0, 0x0F70)) { Name = "0x0F70" },
        new MemoryWatcher<uint>(new DeepPointer(procName, eventFlagPtr, 0, 0x1E40)) { Name = "0x1E40" },
        new MemoryWatcher<uint>(new DeepPointer(procName, eventFlagPtr, 0, 0x1E70)) { Name = "0x1E70" },
        new MemoryWatcher<uint>(new DeepPointer(procName, eventFlagPtr, 0, 0x2300)) { Name = "0x2300" },
        new MemoryWatcher<uint>(new DeepPointer(procName, eventFlagPtr, 0, 0x3C30)) { Name = "0x3C30" },
        new MemoryWatcher<uint>(new DeepPointer(procName, eventFlagPtr, 0, 0x3C70)) { Name = "0x3C70" },
        new MemoryWatcher<uint>(new DeepPointer(procName, eventFlagPtr, 0, 0x4630)) { Name = "0x4630" },
        new MemoryWatcher<uint>(new DeepPointer(procName, eventFlagPtr, 0, 0x4670)) { Name = "0x4670" },
        new MemoryWatcher<uint>(new DeepPointer(procName, eventFlagPtr, 0, 0x5A70)) { Name = "0x5A70" }
    };
    foreach (var ef in vars.eventFlags)
        ef.Current = 0xFFFFFFFF;

    // Check against known versions (for informational/debugging purposes)
    if (modules.First().ModuleMemorySize == 0x11C2000)
        version = "Steam (PTDE)";
    else if (modules.First().ModuleMemorySize == 0x11C6000)
        version = "Debug (PTDE)";
    else if (modules.First().ModuleMemorySize == 0x11BF000)
        version = "Beta (PTDE)";
    else
        version = "Unknown (PTDE)";
    refreshRate = 30;
}

exit {
    vars.count = 0;
    refreshRate = 0.5;
}

update {
    if (version.Contains("Invalid")) return false;
    Func<float,float,float,bool> floatEquals = (x,y,p) => (Math.Abs(x-y) <= p);

    long worldAreaZone = vars.pointers["worldZone"].Deref<long>(game);
    vars.isLoaded  = vars.pointers["charLoaded"].Deref<int>(game) != 0; 
    current.igt    = vars.pointers["igt"].Deref<int>(game);
    current.area   =  (byte) (worldAreaZone >> 16 & 0xFF);
    current.world  =  (byte) (worldAreaZone >> 24 & 0xFF);
    current.mpzone =  (int)  (worldAreaZone >> 32);

    if (vars.isLoaded && current.mpzone != -1) {
        vars.eventFlags.UpdateAll(game);
        vars.watchers.UpdateAll(game);
        vars.UpdateDictWatcher(vars.area, current.area);
        vars.UpdateDictWatcher(vars.world, current.world);
        vars.UpdateDictWatcher(vars.mpzone, current.mpzone);
    } else { // !vars.isLoaded || mpzone == -1
    }

    if (vars.ngplus.Changed)
        vars.newNGPlus = true;
    if (vars.newNGPlus && vars.world["Current"] == 18 && vars.area["Current"] == 1) {
        vars.newNGPlus = false;
        vars.completedSplits.Clear();
        vars.queuedSplits.Clear();
        print("[DS.ASL] update: new NG+ reached, clearing split hashsets");
    }

    vars.shouldStart = (vars.world["Current"] == 18 && 
                        vars.area["Current"] == 1 && 
                        vars.mpzone["Current"] == -2 &&
                        floatEquals(vars.xPos.Current, -15.45f, 0.001f) && 
                        floatEquals(vars.yPos.Current, 184.70f, 0.001f) && 
                        floatEquals(vars.zPos.Current, -46.80f, 0.001f));

    if (vars.mpzone["Changed"]) {
        print(String.Format("[DS.ASL] world:  {0} -> {1}", vars.world["Old"], vars.world["Current"]));
        print(String.Format("[DS.ASL] area:   {0} -> {1}", vars.area["Old"], vars.area["Current"]));
        print(String.Format("[DS.ASL] mpzone: {0} -> {1}\n", vars.mpzone["Old"], vars.mpzone["Current"]));
    }
}

start {
    if (!(vars.igt == 0 && vars.completedSplits.Count == 0)) {
        vars.igt = 0;
        vars.justStarted = true;
        vars.newNGPlus = false;
        vars.removedQuitoutDelay = true;
        vars.completedSplits.Clear();
        vars.queuedSplits.Clear();
        print("[DS.ASL] start: reinitialized helpers");
    }

    if (vars.shouldStart)
        print("[DS.ASL] start: starting timer...");
    return vars.shouldStart && settings["startConds"];
}

reset {
    bool shouldReset = false;

    // Reset if the current position is the initial spawn in asylum upon
    // creating a new character and if the current IGT is 2 seconds or less
    shouldReset = vars.shouldStart && vars.igt <= 2000;

    // "delay" auto resets until moved from the spawn point; prevents chain
    // of auto start -> auto reset etc. since they share similar conditionals
    if (vars.justStarted) 
        vars.justStarted = shouldReset;
    else if (shouldReset) {
        print("[DS.ASL] reset: resetNewRun");
        return settings["resetNewRun"];
    }
}

split {
    vars.queuedSplits.ExceptWith(vars.completedSplits);
    bool shouldSplit = false;
    var queueSplitTypes = new string[] {
        "OnNextLoad",
        "ExitZone",
        "LastBonfire"
    };

    if (vars.isLoaded) {
        // Queue up splits if their respective event flags are newly set
        foreach (var ef in vars.eventFlags) {
            if (ef.Current <= ef.Old) continue; 

            string eventFlagName = "";
            if (vars.efMasks[ef.Name].TryGetValue(ef.Current ^ ef.Old, out eventFlagName)) {
                foreach (string splitType in queueSplitTypes) {
                    string splitFlag = eventFlagName + splitType;

                    // Do nothing if the split type isn't enabled by the user
                    if (!(settings.ContainsKey(splitFlag) && settings[splitFlag]))
                        continue;
                    if (!vars.completedSplits.Contains(splitFlag)) {
                        vars.queuedSplits.Add(splitFlag);
                        print("[DS.ASL] split: added "+splitFlag+" to queue");
                    }
                }
            }
        }

        // SGS
        if (vars.mpzone["Changed"] && vars.mpzone["Current"] == 0x249F0 &&
                vars.world["Current"] == 10 && vars.area["Current"] == 1 && 
                vars.deathcam.Current == 1) {
            if (!settings["sgsOnNextLoad"])
                vars.completedSplits.Add("sgsOnNextLoad");

            if (!vars.completedSplits.Contains("sgsOnNextLoad")) {
                vars.queuedSplits.Add("sgsOnNextLoad");
                print("[DS.ASL] split: added sgsOnNextLoad to queue");
            }
        }

        // PCC WW to Kiln
        if (vars.world["Old"] == 12 && vars.world["Current"] == 18 && 
                vars.area["Changed"] && vars.mpzone["Changed"] && 
                vars.mpzone["Current"] == 0x2BF20) {
            if (!vars.completedSplits.Contains("wrongwarpKiln")) {
                vars.completedSplits.Add("wrongwarpKiln");
                if (settings["wrongwarpKiln"]) {
                    print("[DS.ASL] split: wrongwarpKiln");
                    return settings["wrongwarpKiln"];
                }
            }
        }

        // Check and split queued splits if their conditions are met
        foreach (string splitFlag in vars.queuedSplits) {
            if (splitFlag.Contains("ExitZone")) 
                shouldSplit = (vars.mpzone["Changed"] && 
                               vars.mpzone["Old"] == vars.splitFlagZones[splitFlag]);
            else if (splitFlag.Contains("LastBonfire")) 
                shouldSplit = (vars.bonfire.Changed &&
                               vars.bonfire.Current == vars.splitFlagBonfires[splitFlag]);

            if (shouldSplit) {
                print(String.Format("[DS.ASL] split: {0}", splitFlag));
                vars.completedSplits.Add(splitFlag); 
                break;
            }
        }
    } else if (current.igt != 0) { // split on loads only, not main menu
        foreach (string splitFlag in vars.queuedSplits) {
            shouldSplit = splitFlag.Contains("OnNextLoad");
            // If the splitFlag is for gwyn, make sure we're on the credits screen
            shouldSplit = shouldSplit && (splitFlag.Contains("gwyn") ? vars.newNGPlus : true);

            if (shouldSplit) {
                print(String.Format("[DS.ASL] split: {0}", splitFlag));
                vars.completedSplits.Add(splitFlag); 
                break;
            }
        }
    }
    return shouldSplit;
}

isLoading { return true; } // disables gameTime approximation

gameTime {
    if (current.igt > 0) {
        vars.igt = current.igt;
        vars.removedQuitoutDelay = false;
    } else if (!vars.removedQuitoutDelay) {
        vars.igt -= 594;
        vars.removedQuitoutDelay = true;
    }
    return TimeSpan.FromMilliseconds(vars.igt);
}
