state("DARKSOULS") {} // Steamworks
state("DATA") {}      // GFWL

startup {
    refreshRate = 0.5;

    // --- Start Settings ---
    settings.Add("splitConds", false, "Auto Split Conditions");
    settings.Add("info", true, "=== Info ===");
    
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
        {"0000", new Dictionary<uint, string>() {
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
        {"0F70", new Dictionary<uint, string>() {
            {0x02000000, "capra"},
            {0x04000000, "taurus"}
        }},
        {"1E40", new Dictionary<uint, string>() {
            {0x00000400, "dusk"}, 
            {0x00800000, "dusk"} 
        }},
        {"1E70", new Dictionary<uint, string>() {
            {0x08000000, "butterfly"},
        }},
        {"2300", new Dictionary<uint, string>() {
            {0x40000000, "artorias"},
            {0x0C000000, "kalameet"},
            {0x20000000, "manus"},
            {0x80000000, "sguardian"}
        }},
        {"3C30", new Dictionary<uint, string>() {
            {0x00004020, "firesage"}
        }},
        {"3C70", new Dictionary<uint, string>() {
            {0x08000000, "ceaseless"},
            {0x04000000, "centipede"}
        }},
        {"4630", new Dictionary<uint, string>() {
            {0x00008000, "darkAL"}
        }},
        {"4670", new Dictionary<uint, string>() {
            {0x08000000, "gwyndolin"}
        }},
        {"5A70", new Dictionary<uint, string>() {
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
        {"quelaagLastBonfire",   1412961}, 
        {"sguardianLastBonfire", 1212961}
    };

    vars.aobsPTDE = new Dictionary<string, SigScanTarget>() {
        {"charData",   new SigScanTarget(1, "A1 ?? ?? ?? ?? 8B 40 34 53 32")},
        {"charLoaded", new SigScanTarget(1, "A1 ?? ?? ?? ?? 8B 48 04 8B 40 08 53")},
        {"deathcam",   new SigScanTarget(1, "A1 ?? ?? ?? ?? 39 48 3C 0F 94")},
        {"eventFlag",  new SigScanTarget(1, "A1 ?? ?? ?? ?? 53 55 56 8B F1 33 ED")},
        {"worldState", new SigScanTarget(4, "83 EC 0C A1 ?? ?? ?? ?? 80 B8")},
        {"worldZone",  new SigScanTarget(1, "A1 ?? ?? ?? ?? 53 55 56 8B B0")}
    };

    vars.pointers = new Dictionary<string, IntPtr>() {
        {"charData",   IntPtr.Zero},
        {"charLoaded", IntPtr.Zero},
        {"deathcam",   IntPtr.Zero},
        {"eventFlag",  IntPtr.Zero},
        {"worldState", IntPtr.Zero},
        {"worldZone",  IntPtr.Zero},
        {"igt",        IntPtr.Zero},
        {"wazone",     IntPtr.Zero},
        {"ngplus",     IntPtr.Zero},
        {"bonfire",    IntPtr.Zero},
        {"xPos",       IntPtr.Zero},
        {"yPos",       IntPtr.Zero},
        {"zPos",       IntPtr.Zero},
        {"charNo",     IntPtr.Zero},
        {"charClass",  IntPtr.Zero},
        {"charGift",   IntPtr.Zero},
        {"charDex",    IntPtr.Zero},
        {"charSL",     IntPtr.Zero}
    };

    var DSMemoryWatcher = new Dictionary<string, dynamic>() {
        {"Current", null},
        {"Old",     null},
        {"Changed", false}
    };

    vars.area      = new Dictionary<string, dynamic>(DSMemoryWatcher);
    vars.mpzone    = new Dictionary<string, dynamic>(DSMemoryWatcher);
    vars.world     = new Dictionary<string, dynamic>(DSMemoryWatcher);
    vars.ngplus    = new Dictionary<string, dynamic>(DSMemoryWatcher);
    vars.bonfire   = new Dictionary<string, dynamic>(DSMemoryWatcher);
    vars.xPos      = new Dictionary<string, dynamic>(DSMemoryWatcher);
    vars.yPos      = new Dictionary<string, dynamic>(DSMemoryWatcher);
    vars.zPos      = new Dictionary<string, dynamic>(DSMemoryWatcher);
    vars.charNo    = new Dictionary<string, dynamic>(DSMemoryWatcher);
    vars.charClass = new Dictionary<string, dynamic>(DSMemoryWatcher);
    vars.charGift  = new Dictionary<string, dynamic>(DSMemoryWatcher);
    vars.charDex   = new Dictionary<string, dynamic>(DSMemoryWatcher);
    vars.charSL    = new Dictionary<string, dynamic>(DSMemoryWatcher);

    vars.igt = 0;
    vars.failedScans = 0;
    vars.isLoaded = false;
    vars.newClear = false;
    vars.removedQuitoutDelay = true;
    vars.completedSplits = new HashSet<string>();
    vars.queuedSplits = new HashSet<string>();

    vars.AOBScan = (Func<Process,SignatureScanner,string,bool>)((proc, scanner, ptrName) => {
        vars.pointers[ptrName] = scanner.Scan(vars.aobsPTDE[ptrName]);
        if (vars.pointers[ptrName] != IntPtr.Zero)
            vars.pointers[ptrName] = proc.ReadPointer((IntPtr)vars.pointers[ptrName]);
        return (vars.pointers[ptrName] == IntPtr.Zero);
    });

    vars.DerefOffsets = (Func<Process, IntPtr, int[], IntPtr>)((proc, basePtr, offsets) => {
        IntPtr ptr = basePtr;
        for (int i = 0; i < offsets.Length - 1; i++)
            ptr = proc.ReadPointer((IntPtr) (ptr.ToInt32() + offsets[i]));
        return (ptr = (IntPtr) (ptr.ToInt32() + offsets[offsets.Length - 1]));
    });

    vars.StablePosEquals = (Func<float, float, float, float, bool>)((x, y, z, prec) => {
        bool isEqual = true;
        isEqual = isEqual && (Math.Abs(vars.xPos["Current"] - x) <= prec);
        isEqual = isEqual && (Math.Abs(vars.yPos["Current"] - y) <= prec);
        isEqual = isEqual && (Math.Abs(vars.zPos["Current"] - z) <= prec);
        return isEqual;
    });

    vars.UpdateDictWatcher = (Func<Dictionary<string, dynamic>, dynamic, bool>)((dsmw, val) => {
        dsmw["Old"] = (dsmw["Current"] != null) ? dsmw["Current"] : val;
        dsmw["Current"] = val;
        return (dsmw["Changed"] = !(dsmw["Current"].Equals(dsmw["Old"])));
    });

    vars.WAZoneEquals = (Func<byte, byte, int, bool>)((w, a, z) => {
        bool isEqual = !(w == null && a == null && z == null);
        isEqual = isEqual && ((w != null) ? vars.world["Current"]  == w : true);
        isEqual = isEqual && ((a != null) ? vars.area["Current"]   == a : true);
        isEqual = isEqual && ((z != null) ? vars.mpzone["Current"] == z : true);
        return isEqual;
    });
}

init {
    if (vars.failedScans > 9) {
        print("[DS.ASL] Failed to sigscan 10 times, assuming version is invalid.");
        version = "Invalid";
        return;
    }
    // gfwl launcher exe: BaseAddr = 0x12D0000, ModMemSize = 0x4D000 (~300,000)

    // AOB scans for base pointers 
    IntPtr ptr      = IntPtr.Zero;
    IntPtr baseAddr = modules.First().BaseAddress;
    int memsize     = modules.First().ModuleMemorySize - baseAddr.ToInt32();
    var scanner     = new SignatureScanner(game, baseAddr, memsize);
    foreach (string key in vars.aobsPTDE.Keys) {
        if (vars.AOBScan(game, scanner, key))
            throw new Exception("[DS.ASL] Failed to find memory address ("+(++vars.failedScans)+").");
        if (key.Equals("charLoaded") || key.Equals("deathcam"))
            continue;

        ptr = game.ReadPointer((IntPtr) vars.pointers[key]);
        if (ptr == IntPtr.Zero)
            throw new Exception("[DS.ASL] Game not fully loaded yet ("+(++vars.failedScans)+").");
        vars.pointers[key] = ptr;
    }

    ptr = vars.DerefOffsets(game, vars.pointers["charData"], new int[] {8, 0});
    vars.pointers["igt"]       = (IntPtr) (vars.pointers["charData"].ToInt32() + 0x68);
    vars.pointers["ngplus"]    = (IntPtr) (vars.pointers["charData"].ToInt32() + 0x3C);
    vars.pointers["wazone"]    = (IntPtr) (vars.pointers["worldZone"].ToInt32() + 0xA10);
    vars.pointers["bonfire"]   = (IntPtr) (vars.pointers["worldState"].ToInt32() + 0xB04);
    vars.pointers["xPos"]      = (IntPtr) (vars.pointers["worldState"].ToInt32() + 0xB70);
    vars.pointers["yPos"]      = (IntPtr) (vars.pointers["worldState"].ToInt32() + 0xB74);
    vars.pointers["zPos"]      = (IntPtr) (vars.pointers["worldState"].ToInt32() + 0xB78);
    vars.pointers["charNo"]    = (IntPtr) (ptr.ToInt32() + 8);
    vars.pointers["charClass"] = (IntPtr) (ptr.ToInt32() + 0xC6);
    vars.pointers["charGift"]  = (IntPtr) (ptr.ToInt32() + 0xC8);
    vars.pointers["charDex"]   = (IntPtr) (ptr.ToInt32() + 0x58);
    vars.pointers["charSL"]    = (IntPtr) (ptr.ToInt32() + 0x88);

    ptr = vars.DerefOffsets(game, vars.pointers["eventFlag"], new int[] {0, 0});
    vars.eventFlags = new MemoryWatcherList() {
        new MemoryWatcher<uint>((IntPtr)(ptr.ToInt32() + 0x0000)) { Name = "0000", Current = 0xFFFFFFFF },
        new MemoryWatcher<uint>((IntPtr)(ptr.ToInt32() + 0x0F70)) { Name = "0F70", Current = 0xFFFFFFFF },
        new MemoryWatcher<uint>((IntPtr)(ptr.ToInt32() + 0x1E40)) { Name = "1E40", Current = 0xFFFFFFFF },
        new MemoryWatcher<uint>((IntPtr)(ptr.ToInt32() + 0x1E70)) { Name = "1E70", Current = 0xFFFFFFFF },
        new MemoryWatcher<uint>((IntPtr)(ptr.ToInt32() + 0x2300)) { Name = "2300", Current = 0xFFFFFFFF },
        new MemoryWatcher<uint>((IntPtr)(ptr.ToInt32() + 0x3C30)) { Name = "3C30", Current = 0xFFFFFFFF },
        new MemoryWatcher<uint>((IntPtr)(ptr.ToInt32() + 0x3C70)) { Name = "3C70", Current = 0xFFFFFFFF },
        new MemoryWatcher<uint>((IntPtr)(ptr.ToInt32() + 0x4630)) { Name = "4630", Current = 0xFFFFFFFF },
        new MemoryWatcher<uint>((IntPtr)(ptr.ToInt32() + 0x4670)) { Name = "4670", Current = 0xFFFFFFFF },
        new MemoryWatcher<uint>((IntPtr)(ptr.ToInt32() + 0x5A70)) { Name = "5A70", Current = 0xFFFFFFFF }
    };

    // Check against known versions (for informational/debugging purposes)
    if (modules.First().ModuleMemorySize == 0x11C2000)
        version = "Current (PTDE/Steam)";
    else if (modules.First().ModuleMemorySize == 0x11C6000)
        version = "Debug (PTDE/Steam)";
    else if (modules.First().ModuleMemorySize == 0x11BF000)
        version = "Beta (PTDE/Steam)";
    else
        version = "Unknown (PTDE/" + ((game.ProcessName.Equals("DATA")) ? "GFWL)" : "Steam)");
    refreshRate = 30;
}

exit {
    foreach (string key in vars.pointers.Keys.ToList())
        vars.pointers[key] = IntPtr.Zero; 
    vars.failedScans = 0;
    refreshRate = 0.5;
}

update {
    if (version.Contains("Invalid")) return false;

    current.igt      = game.ReadValue<int>((IntPtr)vars.pointers["igt"]);
    var wazone       = game.ReadValue<long>((IntPtr)vars.pointers["wazone"]);
    var charLoaded   = game.ReadPointer((IntPtr)vars.DerefOffsets(game, vars.pointers["charLoaded"], new int[] {0, 4, 0}));
    current.deathcam = game.ReadValue<byte>((IntPtr)vars.DerefOffsets(game, vars.pointers["deathcam"], new int[] {0, 0x40}));
    vars.isLoaded    = charLoaded != IntPtr.Zero;

    if (vars.isLoaded && (wazone >> 32) != -1) {
        vars.eventFlags.UpdateAll(game);
        vars.UpdateDictWatcher(vars.ngplus,  game.ReadValue<int>((IntPtr)vars.pointers["ngplus"]));
        vars.UpdateDictWatcher(vars.bonfire, game.ReadValue<int>((IntPtr)vars.pointers["bonfire"]));
        vars.UpdateDictWatcher(vars.xPos,    game.ReadValue<float>((IntPtr)vars.pointers["xPos"]));
        vars.UpdateDictWatcher(vars.yPos,    game.ReadValue<float>((IntPtr)vars.pointers["yPos"]));
        vars.UpdateDictWatcher(vars.zPos,    game.ReadValue<float>((IntPtr)vars.pointers["zPos"]));
        vars.UpdateDictWatcher(vars.area,   (byte) (wazone >> 16 & 0xFF));
        vars.UpdateDictWatcher(vars.world,  (byte) (wazone >> 24 & 0xFF));
        vars.UpdateDictWatcher(vars.mpzone, (int)  (wazone >> 32));
    } else if (current.igt == 0) { // main menu
        vars.UpdateDictWatcher(vars.charNo,    game.ReadValue<int>((IntPtr)vars.pointers["charNo"]));
        vars.UpdateDictWatcher(vars.charClass, game.ReadValue<byte>((IntPtr)vars.pointers["charClass"]));
        vars.UpdateDictWatcher(vars.charGift,  game.ReadValue<byte>((IntPtr)vars.pointers["charGift"]));
        vars.UpdateDictWatcher(vars.charDex,   game.ReadValue<int>((IntPtr)vars.pointers["charDex"]));
        vars.UpdateDictWatcher(vars.charSL,    game.ReadValue<int>((IntPtr)vars.pointers["charSL"]));
    }
}

start {
    if (vars.igt > 0) {
        vars.igt = 0;
        vars.newClear = false;
        vars.removedQuitoutDelay = true;
        vars.completedSplits.Clear();
        vars.queuedSplits.Clear();
    }

    bool shouldStart = vars.WAZoneEquals(18, 1, -2);
    shouldStart = shouldStart && vars.StablePosEquals(-15.45f, 184.70f, -46.80f, 0.001f);
    if (shouldStart)
        print("[DS.ASL] starting timer... (in asylum starting spawn)");
    return shouldStart;
}

reset {
    if (vars.ngplus["Changed"])
        vars.newClear = true;
    if (vars.newClear && vars.WAZoneEquals(18, 1, null)) { 
        vars.newClear = false;
        vars.completedSplits.Clear();
        vars.queuedSplits.Clear();
        print("[DS.ASL] new playthrough reached (additional NG+), clearing split hashsets");
    }

    bool shouldReset = current.igt == 0;
    shouldReset = shouldReset && vars.charNo["Current"]    == -1;
    shouldReset = shouldReset && vars.charDex["Current"]   == 13;
    shouldReset = shouldReset && vars.charSL["Current"]    == 4;
    shouldReset = shouldReset && vars.charClass["Current"] == 0;
    shouldReset = shouldReset && vars.charGift["Current"]  == 0;
    if (shouldReset)
        print("[DS.ASL] in char creation, assuming new run (resetting)");
    return shouldReset;
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
                        vars.completedSplits.Add(splitFlag);
                    else if (!vars.completedSplits.Contains(splitFlag)) {
                        vars.queuedSplits.Add(splitFlag);
                        print("[DS.ASL] split: added "+splitFlag+" to queue");
                    }
                }
            }
        }

        // Sen's Gate Skip
        if (vars.mpzone["Changed"] && current.deathcam == 1 && vars.WAZoneEquals(10, 1, 0x249F0)) {
            if (!settings["sgsOnNextLoad"])
                vars.completedSplits.Add("sgsOnNextLoad");
            else if (!vars.completedSplits.Contains("sgsOnNextLoad")) {
                vars.queuedSplits.Add("sgsOnNextLoad");
                print("[DS.ASL] split: added sgsOnNextLoad to queue");
            }
        }

        // Wrong Warp to Kiln (using PCC)
        if (vars.mpzone["Changed"] && vars.world["Old"] == 12 && vars.WAZoneEquals(18, 0, 0x2BF20)) {
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
                shouldSplit = (vars.bonfire["Changed"] &&
                               vars.bonfire["Current"] == vars.splitFlagBonfires[splitFlag]);

            if (shouldSplit) {
                vars.completedSplits.Add(splitFlag); 
                print(String.Format("[DS.ASL] split: {0}", splitFlag));
                break;
            }
        }
    } else if (current.igt > 0) { // exclude main menu "loads"
        foreach (string splitFlag in vars.queuedSplits) {
            // If the splitFlag is for gwyn, make sure we're also on the credits screen
            shouldSplit = splitFlag.Contains("OnNextLoad");
            shouldSplit = shouldSplit && (splitFlag.Contains("gwyn") ? vars.newClear : true);

            if (shouldSplit) {
                vars.completedSplits.Add(splitFlag); 
                print(String.Format("[DS.ASL] split: {0}", splitFlag));
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
