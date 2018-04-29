// TODO: documentation

state("DARKSOULS") {
}

state("DARKSOULS", "steam") {
    // Most of the below pointers and offsets are courtesy of DSCM
    int wfBossMain : 0xF7D7D4, 0, 0x0;     // Most bosses excluding ones below
    int wfBossBurg : 0xF7D7D4, 0, 0xF70;   // Taurus Demon, Capra Demon
    int wfBossMB : 0xF7D7D4, 0, 0x1E70;    // Moonlight Butterfly
    int wfBossDLC : 0xF7D7D4, 0, 0x2300;   // DLC bosses
    int wfBossDF : 0xF7D7D4, 0, 0x3C30;    // Firesage
    int wfBossCD : 0xF7D7D4, 0, 0x3C70;    // Ceaseless, Centipede 
    int wfBossG : 0xF7D7D4, 0, 0x4670;     // Gywndolin
    int wfBossSD : 0xF7D7D4, 0, 0x5A70;    // Stray Demon
    int wfDarkAL : 0xF7D7D4, 0, 0x4630;    // Dark Anor Londo
    int wfDrainedNL : 0xF7D7D4, 0, 0x4B0C; // Drained New Londo
    int wfDusk : 0xF7D7D4, 0, 0x1E40;      // Dusk (Broken Pendant)

    int igt : 0xF78700, 0x68;
    int ngplus: 0xF78700, 0x3C; 
    int mpzone : 0xF7E204, 0xA14;
    int phantom : 0xF7DC70, 4, 0, 0x70;
    int team : 0xF7DC70, 4, 0, 0x74;
    short world : 0xF7E204, 0xA12;
    float xPos : 0xF7DC70, 4, 0, 0x28, 0x1C, 0x10;
    float yPos : 0xF7DC70, 4, 0, 0x28, 0x1C, 0x14;
    float zPos : 0xF7DC70, 4, 0, 0x28, 0x1C, 0x18;
}

state("DARKSOULS", "debug") {
    int igt : 0xF7C8C0, 0x68;
}

startup {
    refreshRate = 30; 
    settings.Add("splits", false, "Splits");
    settings.Add("bossSplits", true, "Boss Splits", "splits");
    settings.Add("misc", true, "Misc. Splits", "splits");

    settings.CurrentDefaultParent = "bossSplits";
    settings.Add("artorias", true, "Artorias"); 
    settings.Add("asylum", true, "Asylum Demon");
    settings.Add("boc", true, "Bed of Chaos");
    settings.Add("capra", true, "Capra Demon");
    settings.Add("ceaseless", true, "Ceaseless Discharge");
    settings.Add("centipede", true, "Centipede Demon"); 
    settings.Add("firesage", true, "Demon Firesage"); 
    settings.Add("fourkings", true, "Four Kings");
    settings.Add("gaping", true, "Gaping Dragon");
    settings.Add("gargs", true, "Gargoyles");
    settings.Add("golem", true, "Iron Golem"); 
    settings.Add("gwyn", true, "Gwyn");
    settings.Add("gwyndolin", true, "Gwyndolin");
    settings.Add("kalameet", true, "Kalameet");
    settings.Add("manus", true, "Manus");
    settings.Add("butterfly", true, "Moonlight Butterfly");
    settings.Add("nito", true, "Nito");
    settings.Add("ons", true, "Ornstein & Smough"); 
    settings.Add("pinwheel", true, "Pinwheel"); 
    settings.Add("priscilla", true, "Priscilla");
    settings.Add("quelaag", true, "Quelaag"); 
    settings.Add("sguardian", true, "Sanctuary Guardian"); 
    settings.Add("seath", true, "Seath");
    settings.Add("sif", true, "Sif");
    settings.Add("stray", true, "Stray Demon");
    settings.Add("taurus", true, "Taurus Demon"); 

    settings.Add("artoriasOnFlagSet", false, "On Victory Achieved", "artorias");
    settings.Add("artoriasOnNextLoad", false, "On Next Load", "artorias");
    settings.Add("artoriasEnterArea", true, "On Entering Oolacile Township", "artorias");
    settings.Add("asylumOnFlagSet", false, "On Victory Achieved", "asylum");
    settings.Add("asylumOnNextLoad", true, "On Next Load", "asylum");
    settings.Add("bocOnFlagSet", false, "On Victory Achieved", "boc");
    settings.Add("bocOnNextLoad", true, "On Next Load", "boc");
    settings.Add("butterflyOnFlagSet", false, "On Victory Achieved", "butterfly");
    settings.Add("butterflyOnNextLoad", true, "On Next Load", "butterfly");
    settings.Add("capraOnFlagSet", false, "On Victory Achieved", "capra");
    settings.Add("capraOnNextLoad", true, "On Next Load", "capra");
    settings.Add("ceaselessOnFlagSet", false, "On Victory Achieved", "ceaseless");
    settings.Add("ceaselessOnNextLoad", true, "On Next Load", "ceaseless");
    settings.Add("centipedeOnFlagSet", true, "On Victory Achieved", "centipede");
    settings.Add("centipedeOnNextLoad", false, "On Next Load", "centipede");
    settings.Add("centipedeEnterArea", false, "On Entering Lost Izalith", "centipede");
    settings.Add("firesageOnFlagSet", true, "On Victory Achieved", "firesage");
    settings.Add("firesageOnNextLoad", false, "On Next Load", "firesage");
    settings.Add("firesageEnterArea", false, "On Exiting Boss Arena", "firesage");
    settings.Add("fourkingsOnFlagSet", false, "On Victory Achieved", "fourkings");
    settings.Add("fourkingsOnNextLoad", true, "On Next Load", "fourkings");
    settings.Add("gapingOnFlagSet", false, "On Victory Achieved", "gaping");
    settings.Add("gapingOnNextLoad", true, "On Next Load", "gaping");
    settings.Add("gargsOnFlagSet", false, "On Victory Achieved", "gargs");
    settings.Add("gargsOnNextLoad", true, "On Next Load", "gargs");
    settings.Add("golemOnFlagSet", false, "On Victory Achieved", "golem");
    settings.Add("golemOnNextLoad", false, "On Next Load", "golem");
    settings.Add("golemEnterArea", true, "On Entering Anor Londo", "golem");
    settings.Add("gwynOnFlagSet", false, "On Victory Achieved", "gwyn");
    settings.Add("gwynOnNextLoad", false, "On Next Load", "gwyn");
    settings.Add("gwynFinalSplit", true, "End of Run", "gwyn");
    settings.Add("gwyndolinOnFlagSet", false, "On Victory Achieved", "gwyndolin");
    settings.Add("gwyndolinOnNextLoad", true, "On Next Load", "gwyndolin");
    settings.Add("kalameetOnFlagSet", false, "On Victory Achieved", "kalameet");
    settings.Add("kalameetOnNextLoad", true, "On Next Load", "kalameet");
    settings.Add("manusOnFlagSet", false, "On Victory Achieved", "manus");
    settings.Add("manusOnNextLoad", true, "On Next Load", "manus");
    settings.Add("nitoOnFlagSet", false, "On Victory Achieved", "nito");
    settings.Add("nitoOnNextLoad", true, "On Next Load", "nito");
    settings.Add("onsOnFlagSet", false, "On Victory Achieved", "ons");
    settings.Add("onsOnNextLoad", false, "On Next Load", "ons");
    settings.Add("gwynevereOnFlagSet", false, "On Turning Anor Londo Dark", "ons");
    settings.Add("gwynevereOnNextLoad", true, "On Next Load After Dark AL", "ons");
    settings.Add("pinwheelOnFlagSet", true, "On Victory Achieved", "pinwheel");
    settings.Add("pinwheelOnNextLoad", false, "On Next Load", "pinwheel");
    settings.Add("priscillaOnFlagSet", false, "On Victory Achieved", "priscilla");
    settings.Add("priscillaOnNextLoad", true, "On Next Load", "priscilla");
    settings.Add("priscillaEnterArea", false, "On Exiting Painted World", "priscilla");
    settings.Add("quelaagOnFlagSet", false, "On Victory Achieved", "quelaag");
    settings.Add("quelaagOnNextLoad", false, "On Next Load", "quelaag");
    settings.Add("quelaagEnterArea", true, "On Entering Demon Ruins", "quelaag");
    settings.Add("seathOnFlagSet", false, "On Victory Achieved", "seath");
    settings.Add("seathOnNextLoad", true, "On Next Load", "seath");
    settings.Add("sguardianOnFlagSet", false, "On Victory Achieved", "sguardian");
    settings.Add("sguardianOnNextLoad", false, "On Next Load", "sguardian");
    settings.Add("sguardianEnterArea", true, "On Entering Oolacile Sanctuary", "sguardian");
    settings.Add("sifOnFlagSet", false, "On Victory Achieved", "sif");
    settings.Add("sifOnNextLoad", true, "On Next Load", "sif");
    settings.Add("strayOnFlagSet", false, "On Victory Achieved", "stray");
    settings.Add("strayOnNextLoad", true, "On Next Load", "stray");
    settings.Add("taurusOnFlagSet", true, "On Victory Achieved", "taurus");
    settings.Add("taurusOnNextLoad", false, "On Next Load", "taurus");

    settings.CurrentDefaultParent = "misc";

    settings.Add("newlondoDrainedOnFlagSet", false, "Drained New Londo");
    settings.Add("duskOnFlagSet", false, "Dusk Freed");
    settings.Add("duskOnNextLoad", true, "Dusk Freed (on next load)");
    //settings.Add("sensGateSkip", false, "Sen's Gate Skip (on next load)");

    //settings.SetToolTip("bossOnFlagSet", "Splits as soon as the game flags a" +
        //" particular boss dead (on the \"Victory Achieved\" message)");
    //settings.SetToolTip("bossOnNextLoad", "Splits on the next loading screen" + 
        //" after the game flags a particular boss dead. This would usually" +
        //" occur using a homeward bone or save and quitting after killing a" +
        //" boss (splits on the first load screen upon reloading the save file" +         " in the event of a S&Q).");
    //settings.SetToolTip("event", "Autosplit conditions for other events," +
        //" skips, or bosses that don't directly fit into above categories");
    //settings.SetToolTip("gwynevereOnFlagSet", "Split upon retreiving the" + 
        //" Lordvessel from killing Gwynevere and turning Anor Londo dark" +
        //" (could be used for an O&S split).");
    //settings.SetToolTip("gwynevereOnNextLoad", "Split on the next loading" +
        //" screen after killing Gwynevere and turning Anor Londo dark (could" +
        //" be used for an O&S split).");
    //settings.SetToolTip("duskOnFlagSet", "Splits as soon as Dusk is freed" +
        //" from the golden crystal golem (flag is set as she spawns in)");
    //settings.SetToolTip("duskOnNextLoad", "Splits on the next loading" +
        //" screen after freeing Dusk from the golden crystal golem");
    //settings.SetToolTip("gwynFinalSplit", "Split upon save and quitting from the" +
        //" the asylum (after killing Gwyn and entering NG+)");
    //settings.SetToolTip("golemEnterAL", "Split upon entering Anor Londo" +
        //" after killing Iron Golem");
    //settings.SetToolTip("sensGateSkip", "Split upon reloading into Sen's" +
        //" Fortress after performing Sen's Gate Skip");

    // Key: name of flag, Value: [mask for flag, index for worldflags]
    // Example: key "asylum" has mask 0x8000 and index 0 for `worldflags'
    vars.flagMasks = new Dictionary<string, uint[]>() {
        {"asylum", new uint[] {0x8000, 0} },
        {"boc", new uint[] {0x200000, 0} },
        {"gargs", new uint[] {0x10000000, 0} },
        {"fourkings", new uint[] {0x40000, 0} },
        {"gaping", new uint[] {0x20000000, 0} },
        {"gwyn", new uint[] {0x10000, 0} },
        {"golem", new uint[] {0x100000, 0} },
        {"nito", new uint[] {0x1000000, 0} },
        {"ons", new uint[] {0x80000, 0} },
        {"pinwheel", new uint[] {0x2000000, 0} },
        {"priscilla", new uint[] {0x8000000, 0} },
        {"quelaag", new uint[] {0x400000, 0} },
        {"seath", new uint[] {0x20000, 0} },
        {"sif", new uint[] {0x4000000, 0} },
        {"capra", new uint[] {0x2000000, 1} },
        {"taurus", new uint[] {0x4000000, 1} },
        {"butterfly", new uint[] {0x8000000, 2} },
        {"artorias", new uint[] {0x40000000, 3} },
        {"kalameet", new uint[] {0x8000000, 3} },
        {"manus", new uint[] {0x20000000, 3} },
        {"sguardian", new uint[] {0x80000000, 3} },
        {"firesage", new uint[] {0x20, 4} },
        {"ceaseless", new uint[] {0x8000000, 5} },
        {"centipede", new uint[] {0x4000000, 5} },
        {"gwynevere", new uint[] {0x8000, 6} },
        {"gwyndolin", new uint[] {0x8000000, 7} },
        {"newlondoDrained", new uint[] {0x8000000, 8} },
        {"stray", new uint[] {0x8000000, 9} },
        {"dusk", new uint[] {0x2000, 10} }
    };

    // Key: name of autosplit condition; Value: [world, mpzone]
    vars.areaChecks = new Dictionary<string, int[]>() {
        {"artoriasEnterArea", new int[] {0x0C01, -2} }, // zPos >= 840.8
        {"centipedeEnterArea", new int[] {0x0E01, -2} }, 
        {"firesageEnterArea", new int[] {0x0E01, -2} }, // stairs down
        {"golemEnterArea", new int[] {0x0F01, -2} },
        {"priscillaEnterArea", new int[] {0x0F01, -1} }, // FIXME
        {"quelaagEnterArea", new int[] {0x0E01, -2} }, 
        {"sguardianEnterArea", new int[] {0x0C01, -2} }
    };

    vars.autosplit = new Dictionary<string, bool>() {
        {"artoriasOnFlagSet", false},
        {"artoriasOnNextLoad", false},
        {"artoriasEnterArea", false},
        {"asylumOnFlagSet", false},
        {"asylumOnNextLoad", false},
        {"bocOnFlagSet", false},
        {"bocOnNextLoad", false},
        {"butterflyOnFlagSet", false},
        {"butterflyOnNextLoad", false},
        {"capraOnFlagSet", false},
        {"capraOnNextLoad", false},
        {"ceaselessOnFlagSet", false},
        {"ceaselessOnNextLoad", false},
        {"centipedeOnFlagSet", false},
        {"centipedeOnNextLoad", false},
        {"centipedeEnterArea", false},
        {"firesageOnFlagSet", false},
        {"firesageOnNextLoad", false},
        //{"firesageEnterArea", false},
        {"fourkingsOnFlagSet", false},
        {"fourkingsOnNextLoad", false},
        {"gapingOnFlagSet", false},
        {"gapingOnNextLoad", false},
        {"gargsOnFlagSet", false},
        {"gargsOnNextLoad", false},
        {"golemOnFlagSet", false},
        {"golemOnNextLoad", false},
        {"golemEnterArea", false},
        {"gwynOnFlagSet", false},
        {"gwynOnNextLoad", false},
        {"gwynFinalSplit", false},
        {"gwyndolinOnFlagSet", false},
        {"gwyndolinOnNextLoad", false},
        {"kalameetOnFlagSet", false},
        {"kalameetOnNextLoad", false},
        {"manusOnFlagSet", false},
        {"manusOnNextLoad", false},
        {"nitoOnFlagSet", false},
        {"nitoOnNextLoad", false},
        {"onsOnFlagSet", false},
        {"onsOnNextLoad", false},
        {"gwynevereOnFlagSet", false},
        {"gwynevereOnNextLoad", false},
        {"pinwheelOnFlagSet", false},
        {"pinwheelOnNextLoad", false},
        {"priscillaOnFlagSet", false},
        {"priscillaOnNextLoad", false},
        //{"priscillaEnterArea", false},
        {"quelaagOnFlagSet", false},
        {"quelaagOnNextLoad", false},
        {"quelaagEnterArea", false},
        {"seathOnFlagSet", false},
        {"seathOnNextLoad", false},
        {"sguardianOnFlagSet", false},
        {"sguardianOnNextLoad", false},
        {"sguardianEnterArea", false},
        {"sifOnFlagSet", false},
        {"sifOnNextLoad", false},
        {"strayOnFlagSet", false},
        {"strayOnNextLoad", false},
        {"taurusOnFlagSet", false},
        {"taurusOnNextLoad", false},
        {"newlondoDrainedOnFlagSet", false},
        {"duskOnFlagSet", false},
        {"duskOnNextLoad", true}
        //{"sensGateSkip", false},
    };


    vars.reinit = false;
    vars.igt = 0;
    vars.initialNGPlus = Int32.MaxValue;
    //vars.sgsDone = false;
    vars.startedNGPlus = false;
}

init {
    int mms = modules.First().ModuleMemorySize;
	if (mms == 0x11C2000)
        version = "steam";
	else if (mms == 0x11C6000) 
        version = "debug";
    else // Could not find version or version not supported
        version = "<unknown>";

    print("[DS.ASL] Version: `" + version + "' (" + 
        String.Format("{0:X8}", mms) + ")");
}

exit {
    version = "";
}

update {
    if (version.Equals("") || version.Equals("<unknown>")) return false;

    // Flag for autosplit and other variables to be reset on a new run
    if (timer.CurrentPhase != TimerPhase.NotRunning) {
        vars.reinit = true;
    } else if (vars.reinit) { // && timer.CurrentPhase == TimerPhase.NotRunning
        print("[DS.ASL] Re-initializing autosplit variables...");
        vars.reinit = false;

        foreach (string s in new List<string>(vars.autosplit.Keys))
            vars.autosplit[s] = false;
        vars.igt = 0;
        vars.initialNGPlus = Int32.MaxValue;
        //vars.sgsDone = false;
        vars.startedNGPlus = false;
    }
}

split {
    // Don't run autosplit logic if disabled by user (small performance gain?)
    if (!settings.SplitEnabled || !settings["splits"]) return false;
    // Autosplitting only supported on current Steam version
    if (!version.Equals("steam")) return false;

    int[] worldflags = { current.wfBossMain, current.wfBossBurg, 
        current.wfBossMB, current.wfBossDLC, current.wfBossDF, 
        current.wfBossCD, current.wfDarkAL, current.wfBossG, 
        current.wfDrainedNL, current.wfBossSD, current.wfDusk };
    bool delaySplit = current.team == 0;

    //if (!vars.sgsDone && current.world == 0x0F00 && current.zPos >= 179.0)
        //vars.sgsDone = true;

    if (vars.initialNGPlus == Int32.MaxValue && current.igt > old.igt)
        vars.initialNGPlus = current.ngplus;

    if (!vars.startedNGPlus && current.ngplus > vars.initialNGPlus)
        vars.startedNGPlus = current.world == 0x1201;

    // START: Debug Info
    //if (delaySplit && current.igt != 0) {
        //print("[DS.ASL] ==========");
        //print("[DS.ASL] Livesplit: " + timer.CurrentTime.GameTime);
        //print("[DS.ASL] IGT (old): " + TimeSpan.FromMilliseconds(old.igt));
        //print("[DS.ASL] IGT (cur): " + TimeSpan.FromMilliseconds(current.igt));
        //print("[DS.ASL] delaySplit: " + delaySplit + " (" + current.team + ")");
        //print("[DS.ASL] startedNGPlus: " + vars.startedNGPlus + " (" + 
            //current.ngplus + ", " + vars.endrun_ngplus + ")");

        // Location data (world area, mp area {xPos, yPos, zPos})
        //print("[DS.ASL] ----------");
        //print("[DS.ASL] Pos: " + String.Format("{0:X4}", current.world) + ", " +
            //String.Format("{0:X6}", current.mpzone) + " {" + 
            //String.Format("{0:N2}", current.xPos) + ", " + 
            //String.Format("{0:N2}", current.yPos) + ", " + 
            //String.Format("{0:N2}", current.zPos) + "}");
    //}
    //print("[DS.ASL] flag: " + String.Format("{0:X8}", current.wfDusk));
    // END: Debug Info 

    if (vars.autosplit["gwynFinalSplit"] && vars.startedNGPlus && delaySplit) {
        print("[DS.ASL] Ending run (final split)...");
        return settings["gwynFinalSplit"];
    }

    //if (!vars.autosplit["sensGateSkip"] && vars.sgsDone && delaySplit) {
        //vars.autosplit["sensGateSkip"] = true;
        //print("[DS.ASL] sensGateSkip set to true");
        //return settings["sensGateSkip"];
    //}
    
    foreach (KeyValuePair<string, uint[]> kvp in vars.flagMasks) {
        if ((worldflags[kvp.Value[1]] & kvp.Value[0]) != 0) {
            bool b = true;
            string s = kvp.Key+"OnFlagSet";

            // Splits on "Victory Achieved" or as soon as relevant flag is set
            if (vars.autosplit.TryGetValue(s, out b) && !b) {
                if (kvp.Key.Equals("gwyn"))
                    vars.autosplit["gwynFinalSplit"] = true;
                vars.autosplit[s] = true;
                print("[DS.ASL] " + s + " set to true");
                return settings[s];
            }

            s = kvp.Key+"EnterArea";
            // Splits when entering a certain "area" after relevant flag is set
            if (vars.autosplit.TryGetValue(s, out b) && !b) {
                if ((vars.areaChecks[s][0] == current.world) && 
                        (vars.areaChecks[s][1] == current.mpzone)) {
                    if (kvp.Key.Equals("artorias"))
                        vars.autosplit[s] = current.zPos >= 840.8;
                    else
                        vars.autosplit[s] = true;
                    print("[DS.ASL] " + s + " set to true");
                    return vars.autosplit[s] && settings[s];
                }
            }

            s = kvp.Key+"OnNextLoad";
            // Splits on a loading screen after relevant flag is set
            if (vars.autosplit.TryGetValue(s, out b) && !b) {
                if (delaySplit) {
                    vars.autosplit[s] = true;
                    print("[DS.ASL] " + s + " set to true");
                    return settings[s];
                }
            }
        }
    }
}

isLoading {
    return true;
}

gameTime {
    if (current.igt != 0) {
        vars.igt = current.igt;
        return TimeSpan.FromMilliseconds(current.igt);
    } else if (vars.igt != 0)
        return TimeSpan.FromMilliseconds(vars.igt-594);
    else
        return TimeSpan.FromMilliseconds(vars.igt);
}

// vim: set ts=4 sw=4 autoindent syntax=cs :
