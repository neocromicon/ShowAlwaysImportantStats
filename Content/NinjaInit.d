// Version des Patches
const string NINJA_SHOWALWAYSIMPORTANTSTATS_VERSION = "SAIS 2.5.0";

func void Ninja_ShowAlwaysImportantStats_Menu(var int menuPtr) {
    MEM_InitAll();
	
	// Version check
    if (NINJA_VERSION < 2409) {
        MEM_SendToSpy(zERR_TYPE_FATAL, "ShowAlwaysImportantStats requires at least Ninja 2.4.09 or higher. Zeige immer die wichtigsten Statistiken benoetigt Ninja 2.4.09 oder hoeher. Download: https://bit.ly/2XFFFEn");
    };

	//Prüft ob ob der Gothic.ini eintrag vorhanden ist und erstellt ihn gegebenfalls
	const int Ninja_SAIS_setGothOptOnce = 0;
    if (!Ninja_SAIS_setGothOptOnce) 
	{
		if (!MEM_GothOptExists("NINJA_SHOWALWAYSIMPORTANTSTATS", "Font"))
		{ MEM_SetGothOpt("NINJA_SHOWALWAYSIMPORTANTSTATS", "Font", "0"); };
		
		if (!MEM_GothOptExists("NINJA_SHOWALWAYSIMPORTANTSTATS", "Exp"))
		{ MEM_SetGothOpt("NINJA_SHOWALWAYSIMPORTANTSTATS", "Exp", "0"); };
		
		if (!MEM_GothOptExists("NINJA_SHOWALWAYSIMPORTANTSTATS", "Money"))
		{ MEM_SetGothOpt("NINJA_SHOWALWAYSIMPORTANTSTATS", "Money", "1"); };
		
		if (!MEM_GothOptExists("NINJA_SHOWALWAYSIMPORTANTSTATS", "Ammo"))
		{ MEM_SetGothOpt("NINJA_SHOWALWAYSIMPORTANTSTATS", "Ammo", "1"); };
		
		if (!MEM_GothOptExists("NINJA_SHOWALWAYSIMPORTANTSTATS", "AmmoType"))
		{ MEM_SetGothOpt("NINJA_SHOWALWAYSIMPORTANTSTATS", "AmmoType", "2"); };
		
		if (!MEM_GothOptExists("NINJA_SHOWALWAYSIMPORTANTSTATS", "Magic"))
		{ MEM_SetGothOpt("NINJA_SHOWALWAYSIMPORTANTSTATS", "Magic", "1"); };
		
		if (!MEM_GothOptExists("NINJA_SHOWALWAYSIMPORTANTSTATS", "Quest"))
		{ MEM_SetGothOpt("NINJA_SHOWALWAYSIMPORTANTSTATS", "Quest", "1"); };
		
		if (!MEM_GothOptExists("NINJA_SHOWALWAYSIMPORTANTSTATS", "Clock"))
		{ MEM_SetGothOpt("NINJA_SHOWALWAYSIMPORTANTSTATS", "Clock", "0"); };

		if (!MEM_GothOptExists("NINJA_SHOWALWAYSIMPORTANTSTATS", "HpMp"))
		{ MEM_SetGothOpt("NINJA_SHOWALWAYSIMPORTANTSTATS", "HpMp", "0"); };

        if (!MEM_GothOptExists("NINJA_SHOWALWAYSIMPORTANTSTATS", "HpEnemy"))
		{ MEM_SetGothOpt("NINJA_SHOWALWAYSIMPORTANTSTATS", "HpEnemy", "0"); };
		
		if (!MEM_GothOptExists("NINJA_SHOWALWAYSIMPORTANTSTATS", "LoA_Bugs"))
		{ MEM_SetGothOpt("NINJA_SHOWALWAYSIMPORTANTSTATS", "LoA_Bugs", "0"); };
		
        Ninja_SAIS_setGothOptOnce = 1;
    };
	
    // Get menu and menu item list, corresponds to C_MENU_DEF.items[]
	
    var zCMenu menu; menu = _^(menuPtr);
    var int items; items = _@(menu.m_listItems_array);
	
    // Modify each menu by its name
    if (Hlp_StrCmp(menu.name, "MENU_OPTIONS")) {
		// New menu instances
		var string itm1Str; itm1Str = "MenuItem_Ninja_ShowAlwaysImportantStats_Opt";
	
        // Get bottom most menu item and new menu items
        var int itmL; itmL = MEM_ArrayPop(items); // Typically "BACK"
        var int itm1; itm1 = MEM_GetMenuItemByString(itm1Str);		

        // If the new ones do not exist yet, create them the first time
        if (!itm1) {
			Ninja_ShowAlwaysImportantStats_SetMenuLocalization();
            itm1 = Ninja_ShowAlwaysImportantStats_CreateMenuItem(itm1Str);

            // Also adjust vertical positions of the menu items
            var zCMenuItem itm;
            itm = _^(itmL);
            var int y; y = itm.m_parPosY;
            itm.m_parPosY = y+300; // Move bottom item down

            itm = _^(itm1);
            itm.m_parPosY = y-260; // Move new item 1 up
        };

        // (Re-)insert the menu items in the correct order
        MEM_ArrayInsert(items, itm1);
        MEM_ArrayInsert(items, itmL);
    };
};

/*
 * Initialization function called by Ninja after "Init_Global" (G2) / "Init_<Levelname>" (G1)
 */
func void Ninja_ShowAlwaysImportantStats_Init() {	
    // Wrapper for "LeGo_Init" to ensure correct LeGo initialization without breaking the mod
    LeGo_MergeFlags(LeGo_FrameFunctions | LeGo_Bars | LeGo_Interface | LeGo_View);

    MEM_Info(ConcatStrings(ConcatStrings("Initialize ", NINJA_SHOWALWAYSIMPORTANTSTATS_VERSION), "."));
    FF_ApplyOnceGT(Ninja_ShowAlwaysImportantStats_Main);
	if (!STR_ToInt(MEM_GetGothOpt("NINJA_SHOWALWAYSIMPORTANTSTATS", "FirstRun"))) {
		FF_ApplyExtGT(Ninja_ShowAlwaysImportantStats_FirstRun, 500, 40);
		MEM_SetGothOpt("NINJA_SHOWALWAYSIMPORTANTSTATS", "FirstRun", "1");
	};
    MEM_Info(ConcatStrings(NINJA_SHOWALWAYSIMPORTANTSTATS_VERSION, " was initialized successfully."));
};