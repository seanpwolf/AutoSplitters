// Huge thanks to Wulf2k (DSCM) and TKGP (DS Gadget) - most of 
// the pointers and offsets used are sourced from their apps
state("DARKSOULS") {}

state("DARKSOULS", "Steam") {
    int charPtr : 0xF7DC70, 4, 0;
    int igt     : 0xF78700, 0x68;
    int mpzone  : 0xF7E204, 0xA14;
    float xPos  : 0xF7DC70, 4, 0, 0x28, 0x1C, 0x10;
    float yPos  : 0xF7DC70, 4, 0, 0x28, 0x1C, 0x14;
    float zPos  : 0xF7DC70, 4, 0, 0x28, 0x1C, 0x18;
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

    settings.Add("miscSplits", false, "Misc. Split Conditions");
    settings.CurrentDefaultParent = "miscSplits";
    settings.Add("sgsOnNextLoad", false, "Sen's Gate Skip (On Next Load)");
    settings.Add("wwKilnOnNextLoad", false, "PCC Wrong Warp to Kiln (On Next Load)");

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
        {"quelaagLastBonfire",   1402960},
        {"sguardianLastBonfire", 1212961}
    };

    vars.igt = 0;
    vars.inStartingPos = false;
    vars.isLoaded = false;
    vars.justStarted = true;
    vars.newNGPlus = false;
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
    if (!version.Equals("Steam")) return;

    IntPtr ptr = (IntPtr) modules.First().BaseAddress;
    ptr = (IntPtr) memory.ReadValue<int>(ptr + 0xF784A0);
    vars.bonfire = new MemoryWatcher<int>(ptr + 0xB04);
    ptr = (IntPtr) modules.First().BaseAddress;
    ptr = (IntPtr) memory.ReadValue<int>(ptr + 0xF78700);
    vars.ngplus = new MemoryWatcher<int>(ptr + 0x3C);
    ptr = (IntPtr) modules.First().BaseAddress;
    ptr = (IntPtr) memory.ReadValue<int>(ptr + 0xF7E204);
    vars.area   = new MemoryWatcher<byte>(ptr + 0xA12);
    vars.world  = new MemoryWatcher<byte>(ptr + 0xA13);
    vars.mpzone = new MemoryWatcher<int>(ptr + 0xA14);
    ptr = (IntPtr) modules.First().BaseAddress;
    ptr = (IntPtr) memory.ReadValue<int>(ptr + 0xF7D7D4);
    ptr = (IntPtr) memory.ReadValue<int>(ptr + 0);
    vars.eventFlags = new MemoryWatcherList() {
        new MemoryWatcher<uint>(ptr + 0x0000) { Name = "bossMain" },
        new MemoryWatcher<uint>(ptr + 0x0F70) { Name = "bossBurg" },
        new MemoryWatcher<uint>(ptr + 0x1E40) { Name = "dusk" },
        new MemoryWatcher<uint>(ptr + 0x1E70) { Name = "bossMB" },
        new MemoryWatcher<uint>(ptr + 0x2300) { Name = "bossDLC" },
        new MemoryWatcher<uint>(ptr + 0x3C30) { Name = "bossDF" },
        new MemoryWatcher<uint>(ptr + 0x3C70) { Name = "bossCD" },
        new MemoryWatcher<uint>(ptr + 0x4630) { Name = "darkAL" },
        new MemoryWatcher<uint>(ptr + 0x4670) { Name = "bossG" },
        new MemoryWatcher<uint>(ptr + 0x5A70) { Name = "bossSD" }
    };
    vars.watchers = new MemoryWatcherList() {
        vars.bonfire,
        vars.ngplus,
        vars.world,
        vars.area,
        vars.mpzone
    };
    foreach (var ef in vars.eventFlags)
        ef.Current = 0xFFFFFFFF;

    vars.tmp = true;
}

update {
    if (version.Contains("unknown")) return false;
    if (version.Equals("Debug")) return;
    Func<float, float, float, bool> floatEquals = (x, y, p) => (Math.Abs(x - y) <= p);

    vars.isLoaded = current.charPtr != 0; 

    if (vars.isLoaded && current.mpzone != -1) {
        vars.eventFlags.UpdateAll(game);
        vars.watchers.UpdateAll(game);
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

    if (vars.isLoaded) {
        vars.inStartingPos = (vars.world.Current == 18 && 
                              vars.area.Current == 1 && 
                              vars.mpzone.Current == -2 &&
                              floatEquals(current.xPos, -15.45f, 0.001f) && 
                              floatEquals(current.yPos, 184.70f, 0.001f) && 
                              floatEquals(current.zPos, -46.80f, 0.001f));
    }
}

start {
    if (!version.Equals("Steam")) return false;

    if (!(vars.igt == 0 && vars.completedSplits.Count == 0)) {
        vars.igt = 0;
        vars.justStarted = true;
        vars.newNGPlus = false;
        vars.removedQuitoutDelay = true;
        vars.completedSplits.Clear();
        vars.queuedSplits.Clear();
        print("[DS.ASL] start: reinitialized helpers");
    }

    bool shouldStart = false;

    if (vars.isLoaded) {
        shouldStart = vars.inStartingPos;

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
    //if (!settings.StartEnabled) return false;

    bool shouldReset = false;

    // Reset if the current position is the initial spawn in asylum upon
    // creating a new character and if the current IGT is 2 seconds or less
    if (vars.isLoaded) {
        shouldReset = vars.inStartingPos && vars.igt <= 2000;

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

    bool shouldSplit = false;
    vars.queuedSplits.ExceptWith(vars.completedSplits);

    if (vars.isLoaded) {
        // Check to see if a event flag was newly set 
        foreach (var ef in vars.eventFlags) {
            uint mask = (ef.Current > ef.Old) ? ef.Current ^ ef.Old : (uint)0;
            bool splitEnabled = false;
            string splitFlag = "";
            string[] splitTypes = "OnNextLoad ExitZone LastBonfire".Split(' ');

            if (ef.Current > ef.Old)
                print(String.Format("[DS.ASL] {0}: {1:X8} -> {2:X8}", ef.Name, ef.Old, ef.Current));

            if (vars.efMasks[ef.Name].TryGetValue(mask, out splitFlag)) {
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
        // Check queued "OnNextLoad" splits and split 
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

// vim: set ts=4 sw=4 autoindent syntax=cs :
