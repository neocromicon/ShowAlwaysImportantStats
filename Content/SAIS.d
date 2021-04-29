const int Ninja_ShowAlwaysImportantStats_MOBSI_PRAYBELIAR = 7;
var int PLAYER_MOBSI_PRODUCTION;

/*
 * Credits to Mud-Freak, 65% of all the code from this patch are from him
 *
 * XP Bar Test
 */
instance Ninja_ShowAlwaysImportantStats_Bar(Bar) { // Inherit from Bar directly!
    x = Print_Screen[PS_X] / 2;
    y = Print_Screen[PS_Y] - 20;
    barTop = MEMINT_SwitchG1G2(2, 3);
    barLeft = 7;
    width = 180;
    height = 20;
    backTex = "Bar_Back.tga";
    barTex = "Bar_Misc.tga";
    value = 100;
    valueMax = 100;
};


/*
 * Draw/update text and bar on screen
 */
func void Ninja_ShowAlwaysImportantStats_Update(var int yStart, var string text, var string font, var int yFont, var int showBar, var string textHP, var string textMP, var string textFocus) {
    // Constants to adjust
    const int xMargin = 	10; // Distance to left border
    const int yMargin = 	10; // Distance to upper border

    // Ensure parent view exists
    var int view; var int viewHP; var int viewMP; var int viewFocus; var int bar;
	
	//Create View for stats (Gold, LP ect)
    if (!Hlp_IsValidHandle(view)) {
		PM_BindInt(view);
        view = View_Create(0, 0, PS_VMax, PS_VMax);
        FF_ApplyExtData(Ninja_ShowAlwaysImportantStats_HideText, 0, -1, view);
    };
	
	//Create View for healthbar text
	if (!Hlp_IsValidHandle(viewHP)) {
		PM_BindInt(viewHP);
        viewHP = View_Create(0, 0, PS_VMax, PS_VMax);
        FF_ApplyExtData(Ninja_ShowAlwaysImportantStats_HideText, 0, -1, viewHP);
    };
	
	//Create View for manabar text
	if (!Hlp_IsValidHandle(viewMP)) {
		PM_BindInt(viewMP);
        viewMP = View_Create(0, 0, PS_VMax, PS_VMax);
        FF_ApplyExtData(Ninja_ShowAlwaysImportantStats_HideText, 0, -1, viewMP);
    };

	//Create View for enemy health bar text
	if (!Hlp_IsValidHandle(viewFocus)) {
		PM_BindInt(viewFocus);
        viewFocus = View_Create(0, 0, PS_VMax, PS_VMax);
        FF_ApplyExtData(Ninja_ShowAlwaysImportantStats_HideText, 0, -1, viewFocus);
    };

    // Create View for XP bar
    if (!Hlp_IsValidHandle(bar)) {
		PM_BindInt(bar);
        bar = Bar_Create(Ninja_ShowAlwaysImportantStats_Bar);
        Bar_Show(bar);
    };
	
	//Get x and y of hpBar, manaBar and focusBar
	var oCViewStatusBar bar_hp; bar_hp = MEM_PtrToInst (MEM_GAME.hpBar); //Get Gothic HP-Bar to move viewHP
	var oCViewStatusBar bar_mp; bar_mp = MEM_PtrToInst (MEM_GAME.manaBar); //Get Gothic Mana-Bar to move viewMP
	var oCViewStatusBar bar_focus; bar_focus = MEM_PtrToInst (MEM_GAME.focusBar); //Get Gothic Mana-Bar to move viewMP

	var int xHP; xHP = bar_hp.zCView_vposx; var int yHP; yHP = bar_hp.zCView_vposy;
	var int xSizeHP; xSizeHP = bar_hp.zCView_psizex;

	var int xMP; xMP = bar_mp.zCView_vposx; var int yMP; yMP = bar_mp.zCView_vposy;
	var int xSizeMP; xSizeMP = bar_mp.zCView_psizex;

	var int yFocus; yFocus = bar_focus.zCView_vposy;

	// Update vertical position of view for stats
    View_MoveToPxl(view, xMargin, yMargin+yStart);

	//Update position of viewHP, viewMP and viewFocus
	if (PLAYER_MOBSI_PRODUCTION == Ninja_ShowAlwaysImportantStats_MOBSI_PRAYBELIAR) { //Set new HP/MP text high HP/MP then pray to beliar
		View_MoveTo(viewHP, 0, yHP-4800-yFont);
		View_MoveTo(viewMP, 0, yMP-4600-yFont);
	} else {
		if (Print_Screen[PS_X] <= 1919) {
			View_MoveTo(viewHP, xHP+xSizeHP+80, yHP-210-yFont);
			View_MoveTo(viewMP, xMP+xSizeMP+80, yMP-210-yFont);
		} else {
			View_MoveTo(viewHP, xHP+xSizeHP+10, yHP-210-yFont);
			View_MoveTo(viewMP, xMP+xSizeMP+10, yMP-210-yFont);		
		};
		View_MoveTo(viewFocus, 0, yFocus+210+yFont);
	};

    // Update text
    View_DeleteText(view);
	View_DeleteText(viewHP);
	View_DeleteText(viewMP);
	View_DeleteText(viewFocus);
    View_AddText(view, 0, 0, text, font);
	View_AddText(viewHP, 0, 0, textHP, font);
	View_AddText(viewMP, 0, 0, textMP, font);
	View_AddText(viewFocus, 0, 0, textFocus, font);
	
	//Center viewHP/MP is player pray to beliar
	if (PLAYER_MOBSI_PRODUCTION == Ninja_ShowAlwaysImportantStats_MOBSI_PRAYBELIAR) { //Center HP/MP text then pray to beliar
		ViewPtr_AlignText(getPtr(viewHP), ALIGN_CENTER);
		ViewPtr_AlignText(getPtr(viewMP), ALIGN_CENTER);
	};

	//Center viewFocus
	ViewPtr_AlignText(getPtr(viewFocus), ALIGN_CENTER);

    // Update or hide bar	
	var oCNPC her; her = Hlp_GetNPC(Hero);
    if (showBar && !Hlp_is_oCNpc(her.focus_vob)) {	
		Bar_Show(bar);

        var _bar b; b = get(bar);
        var zCView v; v = View_Get(b.v0);		
        var int bh; bh = v.psizey>>1;
        Bar_MoveToPxl(bar, Print_Screen[PS_X]/2, yMargin+bh);

        // Update bar values
        Bar_SetMax(bar, (hero.level+1) * 500);
        Bar_SetValue(bar, hero.exp - hero.exp_next + (hero.level+1) * 500);
	} else {		
        Bar_Hide(bar);
    };
};


/*
 * FrameFunction to update the on screen info
 */
func void Ninja_ShowAlwaysImportantStats_Main() {
	
    var string text;    // Text
	var string textHP;    // Text HP
	var string textMP;    // Text MP
	var string textFocus; // Text enemy focus
    var string font;    // Font
	var int    yFont;
    var int    showBar; // Whether to show the bar or not
	var int    showMoney; // Whether to show money or not
	var int	   showAmmo; //Whether to show ammo or not
	var int	   showAmmoType; //Whether to show ammo or not
	var int	   showMagic; //Whether to show spells or not
	var int    showQuest; //Whether to show quest's or not
	var int    showClock; //Whether to show clock or not
	var int	   showHealthMana; //Whether to show the HP or MP or not
	var int	   showHealthEnemy; //Whether to show the HP for enemy or not
	var int	   showBugs; //Whether to show special currency "Bugs" from the Mod Legen Asshun
	var string tpc; // Questbook list
	
    // Reset text
    text = "";
	textHP = "";
	textMP = "";
	textFocus = "";
	
	// Obtain descriptions once only
    const string lvl = "";
    const string lp  = "";
    const string xp  = "";
	const string quest = "";
	const string lastSpellInHand = "";
	
    if (Hlp_StrCmp(lvl, "")) { // This is only true first time
        var int lang; lang = Ninja_ShowAlwaysImportantStats_GuessLocalization();
        if (lang == 1) { // DE
            lvl = "Stufe: ";
            lp  = "Lernpunkte: ";
            xp  = "XP bis Aufstieg: ";
			quest = "Quest: ";
        } else if (lang == 2) { // PL
            lvl = "Poziom: ";
            lp  = "Punkty nauki: ";
            xp  = "Doswiadczenie na nast. Poziom: ";
			quest = "Zadanie: ";
        } else if (lang == 3) { // RU
            lvl = "Уров.: ";
            lp  = "Очки обучения: ";
            xp  = "Опыта для след. уровня: ";
			quest = "Квест: ";
        } else { // EN
            lvl = "Level: ";
            lp  = "Learning Pts.: ";
            xp  = "XP to next Level: ";
			quest = "Quest: ";
        };
    };
	
	// Decide on vertical position shift (if "ShowGameTime" of "Velen")	
    const int ypos = -1;
    if (ypos == -1) { // Check only once per session
        var int ShowGameTimeInstalled; ShowGameTimeInstalled = Hlp_StrCmp(STR_Prefix(NINJA_MODNAME, 5), "Velen");
        repeat(i, Ninja_GetPatchNum());
            ShowGameTimeInstalled += Hlp_StrCmp(Ninja_GetPatchName(i), "SHOWGAMETIME");
        end;
		ypos = 0;
    };
	if (ShowGameTimeInstalled > 0) {
		ypos = Print_GetFontHeight("FONT_OLD_20_WHITE.TGA");
	};
	
    // Decide on font
    if (!STR_ToInt(MEM_GetGothOpt("NINJA_SHOWALWAYSIMPORTANTSTATS", "Font"))) {
        font = "FONT_OLD_10_WHITE.TGA";
		yFont = 0;
    } else {
        font = "FONT_OLD_20_WHITE.tga";
		yFont = Print_GetFontHeight("FONT_OLD_20_WHITE.tga");
    };
	
	//Clock function
	showClock = STR_ToInt(MEM_GetGothOpt("NINJA_SHOWALWAYSIMPORTANTSTATS", "Clock"));
	if (!ShowGameTimeInstalled && showClock) {
		text = ConcatStrings(Ninja_ShowAlwaysImportantStats_PrintTimeDay(Ninja_ShowAlwaysImportantStats_GetTimeDay()), Print_LineSeperator);
	};
	
	// List active Quest if ORDEREDLOGS installed
    const int OrderedLogsInstalled = -1;
    if (OrderedLogsInstalled == -1) { // Check only once per session
        OrderedLogsInstalled = 0;
        repeat(i, Ninja_GetPatchNum()); var int i;
            OrderedLogsInstalled += Hlp_StrCmp(Ninja_GetPatchName(i), "ORDEREDLOGS");
        end;
    };
	showQuest = STR_ToInt(MEM_GetGothOpt("NINJA_SHOWALWAYSIMPORTANTSTATS", "Quest"));
    if (OrderedLogsInstalled && showQuest) {
        // Receive first Quest in list
        tpc = Ninja_ShowAlwaysImportantStats_PrintActiveMissionDescription();

        text = ConcatStrings(text, quest);
        text = ConcatStrings(text, tpc);
        text = ConcatStrings(text, Print_LineSeperator);
    };

    // Fill remainder of the text
    text = ConcatStrings(text, lvl);
    text = ConcatStrings(text, IntToString(hero.level));
    text = ConcatStrings(text, Print_LineSeperator);
    text = ConcatStrings(text, lp);
    text = ConcatStrings(text, IntToString(hero.lp));

    // Decide whether to show the bar or not
    showBar = STR_ToInt(MEM_GetGothOpt("NINJA_SHOWALWAYSIMPORTANTSTATS", "Exp"));
    if (!showBar) {
        text = ConcatStrings(text, Print_LineSeperator);
        text = ConcatStrings(text, xp);
        text = ConcatStrings(text, IntToString(hero.exp_next - hero.exp));
		text = ConcatStrings(text, Print_LineSeperator);
    } else {
		text = ConcatStrings(text, Print_LineSeperator);
	};
	
	// Obtain currency and ammo, if any
    var int symbMoneyID; var int symbBugsID; var int symbLucigothID; var int symbArrowID; var int symbBoldID;
    if (GOTHIC_BASE_VERSION == 1) {
        symbMoneyID = MEM_FindParserSymbol("ITMINUGGET");
		symbArrowID = MEM_FindParserSymbol("ITAMARROW");
		symbBoldID = MEM_FindParserSymbol("ITAMBOLT");
    } else {
        symbMoneyID = MEM_FindParserSymbol("TRADE_CURRENCY_INSTANCE");
		symbBugsID = MEM_FindParserSymbol("ITMI_BUG");
		symbLucigothID = MEM_FindParserSymbol("LOA_VLK_6314_LUCIGOTH");
		symbArrowID = MEM_FindParserSymbol("ITRW_ARROW");
		symbBoldID = MEM_FindParserSymbol("ITRW_BOLT");		
        if (symbMoneyID != -1) {
            var zCPar_Symbol symb; symb = _^(MEM_GetSymbolByIndex(symbMoneyID));
            symbMoneyID = MEM_FindParserSymbol(MEM_ReadString(symb.content));
        };
    };
	
	//Show Money if more then 1 in inventory
	showMoney = STR_ToInt(MEM_GetGothOpt("NINJA_SHOWALWAYSIMPORTANTSTATS", "Money"));
	if (showMoney && symbMoneyID != -1) {
		if (Itm_GetPtr(symbMoneyID)) { // Separate If-Block to avoid warnings
			if (Npc_HasItems(hero, symbMoneyID) > 0) {
				text = ConcatStrings(text, Print_LineSeperator);
				text = ConcatStrings(text, item.name);
				text = ConcatStrings(text, ": ");
				text = ConcatStrings(text, IntToString(Npc_HasItems(hero, symbMoneyID)));
			};
		};	
	};
	
	//Show Bugs special currency from Legend of Asshun Mod
	var int LoaRunning; LoaRunning = Hlp_StrCmp(STR_Prefix(NINJA_MODNAME, 5), "Loa");
	showBugs = STR_ToInt(MEM_GetGothOpt("NINJA_SHOWALWAYSIMPORTANTSTATS", "LoA_Bugs"));
	
	if (LoaRunning && showBugs) {
		if (Itm_GetPtr(symbBugsID)) { // Separate If-Block to avoid warnings
			var C_NPC her;    her = Hlp_GetNpc(hero);
			var C_NPC lucigoth; lucigoth = Hlp_GetNpc(symbLucigothID);
			if ((Npc_GetDistToNpc(her, lucigoth) < 600 && !_Bar_PlayerStatus()) && (Npc_HasItems(hero, symbBugsID) > 0)) {
				text = ConcatStrings(text, Print_LineSeperator);
				text = ConcatStrings(ConcatStrings(text, item.name),"s: ");
				text = ConcatStrings(text, IntToString(Npc_HasItems(hero, symbBugsID)));
			};
		};
	};
	
	var oCNpc her; her = Hlp_GetNpc(hero); var int herPtr; herPtr = _@(her); var int fmode; fmode = her.fmode;
	//Show Ammo for Bow and Crossbow is in hero hand
	showAmmo = STR_ToInt(MEM_GetGothOpt("NINJA_SHOWALWAYSIMPORTANTSTATS", "Ammo"));
	showAmmoType = STR_ToInt(MEM_GetGothOpt("NINJA_SHOWALWAYSIMPORTANTSTATS", "AmmoType"));
	if (showAmmo || showAmmo == 2) {
		if (symbArrowID != -1) {
			if (Itm_GetPtr(symbArrowID)) { // Separate If-Block to avoid warnings
				if (fmode == 5 || showAmmo == 2) { // FMODE_FAR(Bow)
					var int arrowFix;
					if (fmode == 5) {
						arrowFix = Npc_HasItems(hero, symbArrowID) + 1; //Fix 1 Arrow in Hero Hand
					} else {
						arrowFix = Npc_HasItems(hero, symbArrowID);
					};
					if (arrowFix == 0) {
					} else if(showAmmoType == 0 || showAmmoType == 2) {
					text = ConcatStrings(text, Print_LineSeperator);
						if (Hlp_StrCmp(item.name, "Pfeil") && arrowFix > 1) { // Only for German version, is more then one arrow in the inventory rename "Pfeil" to "Pfeile"
							text = ConcatStrings(text, "Pfeile");						
						} else {
							text = ConcatStrings(text, item.name); // Any other language
						};
						text = ConcatStrings(text, ": ");
						text = ConcatStrings(text, IntToString(arrowFix));	
					};
				};          
			};	
		};
		if (symbBoldID != -1) { 
			if (Itm_GetPtr(symbBoldID)) { // Separate If-Block to avoid warnings
				if (fmode == 6 || showAmmo == 2) { // FMODE_FAR(Crossbow)
					var int boldFix;
					if (fmode == 6) {
						boldFix = Npc_HasItems(hero, symbBoldID) + 1; //Fix 1 Bolt in Hero Hand
					} else {
						boldFix = Npc_HasItems(hero, symbBoldID);
					};
					if (boldFix == 0) {
					} else if (showAmmoType == 1 || showAmmoType == 2){
						text = ConcatStrings(text, Print_LineSeperator);
						text = ConcatStrings(text, item.name);
						text = ConcatStrings(text, ": ");
						text = ConcatStrings(text, IntToString(boldFix));
					};
				};
			};	
		};
	};

	//Show value of scroll and name
	showMagic = STR_ToInt(MEM_GetGothOpt("NINJA_SHOWALWAYSIMPORTANTSTATS", "Magic"));
	if (showMagic || showMagic == 2) {
		if (fmode == 7 || showMagic == 2) { // FMODE_MAGIC
			if (her.mag_book) { //get hero magicbook
				var oCMag_Book magBook; magBook = _^ (her.mag_book);         
				if (magBook.spellitems_array) {
					var int selectedSpell; selectedSpell = MEM_ReadIntArray(magBook.spellitems_array, magBook.spellnr); //get active scroll in hand
					var oCItem selectedSpellItem; selectedSpellItem = _^(selectedSpell);
					
					if (Hlp_IsValidItem(selectedSpellItem)) {
						text = ConcatStrings(text, Print_LineSeperator);
						text = ConcatStrings(text, selectedSpellItem.description);
						lastSpellInHand = selectedSpellItem.description;
						if ((selectedSpellItem.flags & ITEM_MULTI) == ITEM_MULTI) {
							text = ConcatStrings(text, ": ");
							text = ConcatStrings(text, IntToString(Npc_HasItems(hero, Hlp_getInstanceID(selectedSpellItem))));
							lastSpellInHand = ConcatStrings(selectedSpellItem.description, ": 0"); 
						};						 
					} else {
						text = ConcatStrings(text, Print_LineSeperator);
						text = ConcatStrings(text, lastSpellInHand);
					};						
				};
			};
		};
    };
	
	// Text for HP and Mana
	showHealthMana = STR_ToInt(MEM_GetGothOpt("NINJA_SHOWALWAYSIMPORTANTSTATS", "HpMp"));
	if (showHealthMana > 0) {
		if (showHealthMana == 1 || showHealthMana == 3) {		
			if ((_Bar_PlayerStatus()) || (PLAYER_MOBSI_PRODUCTION == Ninja_ShowAlwaysImportantStats_MOBSI_PRAYBELIAR)) { //Is the player hp/mp bars on screen? Pray the Player to Beliar?
				textHP = ConcatStrings("HP: ", IntToString(hero.attribute[ATR_HITPOINTS]));
				textHP = ConcatStrings(textHP, "/");
				textHP = ConcatStrings(textHP, IntToString(hero.attribute[ATR_HITPOINTS_MAX]));
			};
		};
		if (showHealthMana == 2 || showHealthMana == 3) {
			var zCView v; v = _^(MEM_Game.manaBar);
			if ((v.ondesk) || (PLAYER_MOBSI_PRODUCTION == Ninja_ShowAlwaysImportantStats_MOBSI_PRAYBELIAR)) { // Is the Manabar onscreen?
				textMP = ConcatStrings("MP: ", IntToString(hero.attribute[ATR_MANA]));
				textMP = ConcatStrings(textMP, "/");
				textMP = ConcatStrings(textMP, IntToString(hero.attribute[ATR_MANA_MAX]));
			};
		};
	};

	//Text for enemy hp
	showHealthEnemy = STR_ToInt(MEM_GetGothOpt("NINJA_SHOWALWAYSIMPORTANTSTATS", "HpEnemy"));
	var C_NPC target; target = _^(her.focus_vob); //Get hero target
	if (showHealthEnemy && _Bar_PlayerStatus() && Hlp_is_oCNpc(her.focus_vob)) { //Is option on? Is Show the Player bar? Have hero someone in focus?
		textFocus = ConcatStrings("HP: ", IntToString(target.attribute[ATR_HITPOINTS]));
		textFocus = ConcatStrings(textFocus, "/");
		textFocus = ConcatStrings(textFocus, IntToString(target.attribute[ATR_HITPOINTS_MAX]));	
	};

    // Update the text and bar
    Ninja_ShowAlwaysImportantStats_Update(ypos, text, font, yFont, showBar, textHP, textMP, textFocus);
};