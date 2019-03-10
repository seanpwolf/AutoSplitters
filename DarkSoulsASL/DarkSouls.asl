state("DARKSOULS") {}

startup {
    settings.Add("eventSplits", false, "Boss/Event Split Conditions");
    settings.Add("miscSplits", false, "Other Split Conditions");
    settings.Add("startConds", false, "Auto Start (on start of new playthrough)");
    settings.Add("resetConds", false, "Auto Reset Conditions");
    settings.Add("info", true, "=== Info ===");
    
    settings.CurrentDefaultParent = "eventSplits";
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
    settings.Add("strayOnNextLoad", true, "Stray Demon (On Next Load)");
    settings.Add("taurusExitZone", true, "Taurus Demon (On Exiting Boss Area)");

    settings.CurrentDefaultParent = "miscSplits";
    settings.Add("sgsOnNextLoad", true, "Sen's Gate Skip (On Next Load)");
    settings.Add("kilnwwOnFlagSet", true, "PCC Wrong Warp to Kiln");

    settings.CurrentDefaultParent = "resetConds";
    settings.Add("resetNewChar", false, "Reset on entering new character creation screen");
    settings.Add("resetNewRun", true, "Reset if starting position is the initial spawn in Asylum");

    settings.CurrentDefaultParent = "info";
    settings.Add("info1", false, "Auto splitter for Dark Souls PTDE by seanpwolf");
    settings.Add("info2", false, "Website: https://github.com/seanpwolf/AutoSplitters");

    vars.efMasks = new Dictionary<string, Dictionary<uint, string>>() {
        {"bossMain", new Dictionary<uint, string>() {
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
        {"bossBurg", new Dictionary<uint, string>() {
            {0x02000000, "capra"},
            {0x04000000, "taurus"}
        }},
        {"dusk"    , new Dictionary<uint, string>() {
            {0x00000400, "dusk"}, // 0x2000 for golden golem kill
            {0x00800000, "dusk"}, 
        }},
        {"bossMB"  , new Dictionary<uint, string>() {
            {0x08000000, "butterfly"},
        }},
        {"bossDLC" , new Dictionary<uint, string>() {
            {0x40000000, "artorias"},
            {0x0C000000, "kalameet"},
            {0x20000000, "manus"},
            {0x80000000, "sguardian"}
        }},
        {"bossDF"  , new Dictionary<uint, string>() {
            {0x00004020, "firesage"}
        }},
        {"bossCD"  , new Dictionary<uint, string>() {
            {0x08000000, "ceaseless"},
            {0x04000000, "centipede"}
        }},
        {"darkAL"  , new Dictionary<uint, string>() {
            {0x00008000, "darkAL"}
        }},
        {"bossG"   , new Dictionary<uint, string>() {
            {0x08000000, "gwyndolin"}
        }},
        {"bossSD"  , new Dictionary<uint, string>() {
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

    vars.igt = 0;
    vars.isLoaded = false;
    vars.justStarted = true;
    vars.newNGPlus = false;
    vars.removedQuitoutDelay = true;
    vars.shouldStart = false;
    vars.completedSplits = new HashSet<string>();
    vars.queuedSplits = new HashSet<string>();

    // AOB Testing - if they're here they work on both Steam and Debug
    //
    // charData   (F78700) AOB --> "A1 ?? ?? ?? ?? 8B 40 34 53 32"
    // charLoaded (F7DC70) AOB --> "A1 ?? ?? ?? ?? 8B 48 04 8B 40 08 53"
    // deathcam   (F7D644) AOB --> "A1 ?? ?? ?? ?? 39 48 3C 0F 94"
    // eventFlag  (F7D7D4) AOB --> "A1 ?? ?? ?? ?? 53 55 56 8B F1 33 ED"
    // worldArea  (F7E204) AOB --> "A1 ?? ?? ?? ?? 53 55 56 8B B0"
    // worldState (F784A0) AOB --> "83 EC 0C A1 ?? ?? ?? ?? 80 B8"
    vars.charDataTarget   = new SigScanTarget(1, "A1 ?? ?? ?? ?? 8B 40 34 53 32");
    vars.charLoadedTarget = new SigScanTarget(1, "A1 ?? ?? ?? ?? 8B 48 04 8B 40 08 53");
    vars.deathcamTarget   = new SigScanTarget(1, "A1 ?? ?? ?? ?? 39 48 3C 0F 94");
    vars.eventFlagTarget  = new SigScanTarget(1, "A1 ?? ?? ?? ?? 53 55 56 8B F1 33 ED");
    vars.worldAreaTarget  = new SigScanTarget(1, "A1 ?? ?? ?? ?? 53 55 56 8B B0");
    vars.worldStateTarget = new SigScanTarget(4, "83 EC 0C A1 ?? ?? ?? ?? 80 B8");

    vars.count = 0;
    refreshRate = 1;
}

init {
    if (vars.count > 9) {
        print("[DS.ASL] Failed to sigscan 10 times, assuming version is invalid.");
        version = "invalid";
        return;
    }

    print("[DS.ASL] Scanning for memory addresses...");
    var scanner = new SignatureScanner(game, modules.First().BaseAddress, modules.First().ModuleMemorySize);
    int charDataPtr   = (int) scanner.Scan(vars.charDataTarget);
    int charLoadedPtr = (int) scanner.Scan(vars.charLoadedTarget);
    int deathcamPtr   = (int) scanner.Scan(vars.deathcamTarget);
    int eventFlagPtr  = (int) scanner.Scan(vars.eventFlagTarget);
    int worldAreaPtr  = (int) scanner.Scan(vars.worldAreaTarget);
    int worldStatePtr = (int) scanner.Scan(vars.worldStateTarget);
    var pointers = new int[] {
        charDataPtr,
        charLoadedPtr,
        deathcamPtr,
        eventFlagPtr,
        worldAreaPtr,
        worldStatePtr
    };
    if (pointers.Any(ptr => (IntPtr)ptr == IntPtr.Zero)) {
        vars.count++;
        throw new Exception("[DS.ASL] Failed to find all memory addresses.");
    }

    print("[DS.ASL] Reading pointer values...");
    charDataPtr   = memory.ReadValue<int>((IntPtr)charDataPtr)   - (int)modules.First().BaseAddress;
    charLoadedPtr = memory.ReadValue<int>((IntPtr)charLoadedPtr) - (int)modules.First().BaseAddress;
    deathcamPtr   = memory.ReadValue<int>((IntPtr)deathcamPtr)   - (int)modules.First().BaseAddress;
    eventFlagPtr  = memory.ReadValue<int>((IntPtr)eventFlagPtr)  - (int)modules.First().BaseAddress;
    worldAreaPtr  = memory.ReadValue<int>((IntPtr)worldAreaPtr)  - (int)modules.First().BaseAddress;
    worldStatePtr = memory.ReadValue<int>((IntPtr)worldStatePtr) - (int)modules.First().BaseAddress;
    // This second set of ptr == Zero checks may be unnecessary?
    pointers = new int[] {
        charDataPtr,
        charLoadedPtr,
        deathcamPtr,
        eventFlagPtr,
        worldAreaPtr,
        worldStatePtr
    };
    if (pointers.Any(ptr => (IntPtr)ptr == IntPtr.Zero)) {
        vars.count++;
        throw new Exception("[DS.ASL] Failed to read all pointers.");
    }
    print("[DS.ASL] Scanning done.");

    // Check against known versions (for informational/debugging purposes)
    if (modules.First().ModuleMemorySize == 0x11C2000)
        version = "Steam (PTDE)";
    else if (modules.First().ModuleMemorySize == 0x11C6000)
        version = "Debug (PTDE)";
    else if (modules.First().ModuleMemorySize == 0x11BF000)
        version = "Beta (PTDE)";
    else
        version = "Unknown (PTDE)";

    // Updated every script iteration, so no MemoryWatchers needed
    vars.charLoadedPtr = new DeepPointer("DARKSOULS.exe", charLoadedPtr, 4, 0);
    vars.igtPtr        = new DeepPointer("DARKSOULS.exe", charDataPtr, 0x68);
    vars.mpzonePtr     = new DeepPointer("DARKSOULS.exe", worldAreaPtr, 0xA14);

    // Updated when the game is not loaded (these are used for an auto reset condition)
    vars.charName  = new StringWatcher(new DeepPointer("DARKSOULS.exe", charDataPtr, 0x8, 0xA0), 16);
    vars.soulLevel = new MemoryWatcher<int>(new DeepPointer("DARKSOULS.exe", charDataPtr, 0x8, 0x88));

    // Updated when the game is loaded (values are irrelevant when game isn't loaded)
    vars.ngplus    = new MemoryWatcher<int>(new DeepPointer("DARKSOULS.exe", charDataPtr, 0x3C));
    vars.deathcam  = new MemoryWatcher<byte>(new DeepPointer("DARKSOULS.exe", deathcamPtr, 0x40));
    vars.area      = new MemoryWatcher<byte>(new DeepPointer("DARKSOULS.exe", worldAreaPtr, 0xA12));
    vars.mpzone    = new MemoryWatcher<int>(new DeepPointer("DARKSOULS.exe", worldAreaPtr, 0xA14));
    vars.world     = new MemoryWatcher<byte>(new DeepPointer("DARKSOULS.exe", worldAreaPtr, 0xA13));
    vars.bonfire   = new MemoryWatcher<int>(new DeepPointer("DARKSOULS.exe", worldStatePtr, 0xB04));
    vars.xPos      = new MemoryWatcher<float>(new DeepPointer("DARKSOULS.exe", worldStatePtr, 0xB70));
    vars.yPos      = new MemoryWatcher<float>(new DeepPointer("DARKSOULS.exe", worldStatePtr, 0xB74));
    vars.zPos      = new MemoryWatcher<float>(new DeepPointer("DARKSOULS.exe", worldStatePtr, 0xB78));

    vars.watchers = new MemoryWatcherList() {
        vars.ngplus,
        vars.deathcam,
        vars.area,
        vars.mpzone,
        vars.world,
        vars.bonfire,
        vars.xPos,
        vars.yPos,
        vars.zPos
    };

    // Also updated when game is loaded (separated so all event flag watchers can be iterated over separately)
    vars.eventFlags = new MemoryWatcherList() {
        new MemoryWatcher<uint>(new DeepPointer("DARKSOULS.exe", eventFlagPtr, 0, 0x0000)) { Name = "bossMain" },
        new MemoryWatcher<uint>(new DeepPointer("DARKSOULS.exe", eventFlagPtr, 0, 0x0F70)) { Name = "bossBurg" },
        new MemoryWatcher<uint>(new DeepPointer("DARKSOULS.exe", eventFlagPtr, 0, 0x1E40)) { Name = "dusk" },
        new MemoryWatcher<uint>(new DeepPointer("DARKSOULS.exe", eventFlagPtr, 0, 0x1E70)) { Name = "bossMB" },
        new MemoryWatcher<uint>(new DeepPointer("DARKSOULS.exe", eventFlagPtr, 0, 0x2300)) { Name = "bossDLC" },
        new MemoryWatcher<uint>(new DeepPointer("DARKSOULS.exe", eventFlagPtr, 0, 0x3C30)) { Name = "bossDF" },
        new MemoryWatcher<uint>(new DeepPointer("DARKSOULS.exe", eventFlagPtr, 0, 0x3C70)) { Name = "bossCD" },
        new MemoryWatcher<uint>(new DeepPointer("DARKSOULS.exe", eventFlagPtr, 0, 0x4630)) { Name = "darkAL" },
        new MemoryWatcher<uint>(new DeepPointer("DARKSOULS.exe", eventFlagPtr, 0, 0x4670)) { Name = "bossG" },
        new MemoryWatcher<uint>(new DeepPointer("DARKSOULS.exe", eventFlagPtr, 0, 0x5A70)) { Name = "bossSD" }
    };
    foreach (var ef in vars.eventFlags)
        ef.Current = 0xFFFFFFFF;
    refreshRate = 30;
}

exit {
    vars.count = 0;
    refreshRate = 1;
}

update {
    if (version.Contains("invalid")) return false;
    Func<float,float,float,bool> floatEquals = (x,y,p) => (Math.Abs(x-y) <= p);

    current.igt = vars.igtPtr.Deref<int>(game);
    vars.isLoaded = vars.charLoadedPtr.Deref<int>(game) != 0; 

    if (vars.isLoaded && vars.mpzonePtr.Deref<int>(game) != -1) {
        vars.eventFlags.UpdateAll(game);
        vars.watchers.UpdateAll(game);
    } else {
        vars.charName.Update(game);
        vars.soulLevel.Update(game);
    }

    if (vars.ngplus.Changed) {
        vars.newNGPlus = true;
        print(String.Format("[DS.ASL] ngplus: {0} -> {1} ({2})", vars.ngplus.Old, vars.ngplus.Current, vars.ngplus.Changed));
    }

    if (vars.newNGPlus && vars.world.Current == 18 && vars.area.Current == 1) {
        vars.newNGPlus = false;
        vars.completedSplits.Clear();
        vars.queuedSplits.Clear();
        print("[DS.ASL] update: new NG+ reached, clearing split hashsets");
    }

    vars.shouldStart = (vars.world.Current == 18 && 
                        vars.area.Current == 1 && 
                        vars.mpzone.Current == -2 &&
                        floatEquals(vars.xPos.Current, -15.45f, 0.001f) && 
                        floatEquals(vars.yPos.Current, 184.70f, 0.001f) && 
                        floatEquals(vars.zPos.Current, -46.80f, 0.001f));
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
    // Reset when entering the character creation screen - this [appears]
    // to be the only time that the soul level is non zero with an "" charName
    bool shouldReset = (current.igt == 0 &&
                        vars.soulLevel.Changed &&
                        vars.soulLevel.Old == 0 &&
                        vars.charName.Current.Equals(""));

    if (shouldReset) {
        print("[DS.ASL] reset: resetNewChar");
        print(String.Format("[DS.ASL] {0}, {1} -> {2}, `{3}'", current.igt, vars.soulLevel.Old, vars.soulLevel.Current, vars.charName.Current));
        return settings["resetNewChar"];
    }

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
    bool shouldSplit = false;
    vars.queuedSplits.ExceptWith(vars.completedSplits);

    if (vars.isLoaded) {
        // Queue up splits if their respective event flags are newly set
        foreach (var ef in vars.eventFlags) {
            uint mask = (ef.Current > ef.Old) ? ef.Current ^ ef.Old : (uint)0;
            bool splitEnabled = false;
            string splitFlag = "";
            string[] splitTypes = "OnNextLoad ExitZone LastBonfire".Split(' ');

            //if (ef.Current > ef.Old)
                //print(String.Format("[DS.ASL] split: {0:X8} -> {1:X8} ({2})", ef.Old, ef.Current, ef.Name));

            if (vars.efMasks[ef.Name].TryGetValue(mask, out splitFlag)) {
                foreach (string s in splitTypes) {
                    splitEnabled = settings.ContainsKey(splitFlag+s);
                    splitEnabled = splitEnabled && settings[splitFlag+s];

                    if (!splitEnabled)
                        vars.completedSplits.Add(splitFlag+s);

                    if (!vars.completedSplits.Contains(splitFlag+s)) {
                        vars.queuedSplits.Add(splitFlag+s);
                        print(String.Format("[DS.ASL] split: added {0} to queue", splitFlag+s));
                    }
                }
            }
        }

        // SGS
        if (vars.mpzone.Changed && vars.mpzone.Current == 0x249F0 &&
                vars.world.Current == 10 && vars.area.Current == 1 && 
                vars.deathcam.Current == 1) {
            if (!settings["sgsOnNextLoad"])
                vars.completedSplits.Add("sgsOnNextLoad");

            if (!vars.completedSplits.Contains("sgsOnNextLoad")) {
                vars.queuedSplits.Add("sgsOnNextLoad");
                print("[DS.ASL] split: added sgsOnNextLoad to queue");
            }
        }

        // PCC WW to Kiln
        if (vars.world.Old == 12 && vars.world.Current == 18 && 
                vars.area.Changed && vars.mpzone.Changed && 
                vars.mpzone.Current == 0x2BF20) {
            vars.completedSplits.Add("kilnwwOnFlagSet");
            if (settings["kilnwwOnFlagSet"]) {
                print("[DS.ASL] split: kilnwwOnFlagSet");
                return settings["kilnwwOnFlagSet"];
            }
        }

        // Check and split queued splits if their conditions are met
        foreach (string splitFlag in vars.queuedSplits) {
            if (splitFlag.Contains("ExitZone")) 
                shouldSplit = (vars.mpzone.Changed && 
                               vars.mpzone.Old == vars.splitFlagZones[splitFlag]);
            else if (splitFlag.Contains("LastBonfire")) 
                shouldSplit = (vars.bonfire.Changed &&
                               vars.bonfire.Current == vars.splitFlagBonfires[splitFlag]);

            if (shouldSplit)
                print(String.Format("[DS.ASL] split: {0}", splitFlag));
            return shouldSplit && vars.completedSplits.Add(splitFlag); 
        }
    } else if (current.igt != 0) { // split on loads only, not main menu
        foreach (string splitFlag in vars.queuedSplits) {
            if (splitFlag.Contains("OnNextLoad")) {
                print(String.Format("[DS.ASL] split: {0}", splitFlag));
                return vars.completedSplits.Add(splitFlag); 
            }
        }
    }
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
