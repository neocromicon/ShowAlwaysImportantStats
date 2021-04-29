const int Ninja_ShowAlwaysImportantStats_Lang = 0; // Will be set automatically

/*
 *--------------DISPLAY SETTINGS--------------
 *
 */
instance Menu_Ninja_ShowAlwaysImportantStats_Opt_Display(C_MENU_DEF)
{
	backpic		= NINJA_SAIS_MENU_BACK_PIC;
	
	items[0]	= "MenuItem_Ninja_ShowAlwaysImportantStats_Opt_Display_Heading";
	
	items[1] 	= "MenuItem_Ninja_ShowAlwaysImportantStats_Money_Int";
	items[2] 	= "MenuItem_Ninja_ShowAlwaysImportantStats_Money_Choice";
	
	items[3] 	= "MenuItem_Ninja_ShowAlwaysImportantStats_Ammo_Inst";
	items[4] 	= "MenuItem_Ninja_ShowAlwaysImportantStats_Ammo_Choice";
	
	items[5] 	= "MenuItem_Ninja_ShowaAlwaysImportantStats_AmmoType_Inst";
	items[6] 	= "MenuItem_Ninja_ShowaAlwaysImportantStats_AmmoType_Choice";
	
	items[7] 	= "MenuItem_Ninja_ShowAlwaysImportantStats_Magic_Inst";
	items[8] 	= "MenuItem_Ninja_ShowAlwaysImportantStats_Magic_Choice";
	
	items[9] 	= "MenuItem_Ninja_ShowAlwaysImportantStats_HPMP_Inst";
	items[10] 	= "MenuItem_Ninja_ShowAlwaysImportantStats_HPMP_Choice";

	items[11] 	= "MenuItem_Ninja_ShowAlwaysImportantStats_HPEnemy_Inst";
	items[12] 	= "MenuItem_Ninja_ShowAlwaysImportantStats_HPEnemy_Choice";
	
	items[13]	= "MenuItem_Ninja_ShowAlwaysImportantStats_Opt_Display_Back";
	
	defaultOutGame	= 0;	// PERFORMANCE-SETTINGS
	defaultInGame	= 0;	// PERFORMANCE-SETTINGS

	flags = flags | NINJA_SAIS_MENU_SHOW_INFO;
};


/*
 *--------------HEADLINE-------------
 *
 */
instance MenuItem_Ninja_ShowAlwaysImportantStats_Opt_Display_Heading(C_MENU_ITEM_DEF)
{
	if (Ninja_ShowAlwaysImportantStats_Lang == 1) { // DE (Windows 1252)
        text[0] = "Anzeigen"; //Name
    } else if (Ninja_ShowAlwaysImportantStats_Lang == 2) { // PL (Windows 1250)
        text[0] = "ogіaszaж w gazecie"; //Name
    } else if (Ninja_ShowAlwaysImportantStats_Lang == 3) { // RU (Windows 1251)
        text[0] = "давать объявление"; //Name
    } else { // EN
        text[0] = "Displays"; //Name
    }; 
	type		=	NINJA_SAIS_MENU_ITEM_TEXT;
	// Position und Dimension
	posx		=	0;		posy		=	NINJA_SAIS_MENU_TITLE_Y;
	dimx		=	8192;
	// Weitere Eigenschaften
	flags		= flags & ~NINJA_SAIS_IT_SELECTABLE;
	flags		= flags | NINJA_SAIS_IT_TXT_CENTER;
};



/*
 *--------------MONEY--------------
 *
 */
instance MenuItem_Ninja_ShowAlwaysImportantStats_Money_Int(C_MENU_ITEM_DEF)
{
	if (Ninja_ShowAlwaysImportantStats_Lang == 1) { // DE (Windows 1252)
        text[0] = "Geld"; //Name
		text[1] = "Anzeigen von Geld";  // Kommentar
    } else if (Ninja_ShowAlwaysImportantStats_Lang == 2) { // PL (Windows 1250)
        text[0] = "pieniadze"; //Name
		text[1] = "Widok pieniedzy"; // Kommentar
    } else if (Ninja_ShowAlwaysImportantStats_Lang == 3) { // RU (Windows 1251)
        text[0] = "Деньги"; //Name
		text[1] = "Просмотр денег"; // Kommentar
    } else { // EN
        text[0] = "Money"; //Name
		text[1] = "View of money"; // Kommentar
    };
	// Position und Dimension	
	posx		=	1000;	posy		=	NINJA_SAIS_MENU_START_Y;
	dimx		=	3000;	dimy		=	750;
	// Aktionen
	onSelAction[0]	= NINJA_SAIS_SEL_ACTION_UNDEF;
	// Weitere Eigenschaften
	flags			= flags | NINJA_SAIS_IT_EFFECTS_NEXT;
};
instance MenuItem_Ninja_ShowAlwaysImportantStats_Money_Choice(C_MENU_ITEM_DEF)
{
	backPic		=	NINJA_SAIS_MENU_CHOICE_BACK_PIC;
	type		=	NINJA_SAIS_MENU_ITEM_CHOICEBOX;
	if (Ninja_ShowAlwaysImportantStats_Lang == 1) { // DE (Windows 1252)
        text[0] = "Aus|An"; //Name
    } else if (Ninja_ShowAlwaysImportantStats_Lang == 2) { // PL (Windows 1250)
        text[0] = "Wylacz|Wlacz"; //Name
    } else if (Ninja_ShowAlwaysImportantStats_Lang == 3) { // RU (Windows 1251)
        text[0] = "Выкл|Вкл"; //Name
    } else { // EN
        text[0] = "Off|On"; //Name
    };
    fontName    =   NINJA_SAIS_MENU_FONT_DEFAULT;
	// Position und Dimension	
	posx		= 5000;					posy		=	NINJA_SAIS_MENU_START_Y + NINJA_SAIS_MENU_CHOICE_YPLUS;
	dimx = NINJA_SAIS_MENU_SLIDER_DX;	dimy 		= 	NINJA_SAIS_MENU_CHOICE_DY;
	// Aktionen
    onChgSetOption        = "Money"; //Gothic.ini
    onChgSetOptionSection = "NINJA_SHOWALWAYSIMPORTANTSTATS"; //Gothic.ini
	// Weitere Eigenschaften	
	flags		= flags & ~NINJA_SAIS_IT_SELECTABLE;
	flags		= flags  | NINJA_SAIS_IT_TXT_CENTER;
};


/*
 *--------------AMMO--------------
 *
 */
instance MenuItem_Ninja_ShowAlwaysImportantStats_Ammo_Inst(C_MENU_ITEM_DEF)
{
	if (Ninja_ShowAlwaysImportantStats_Lang == 1) { // DE (Windows 1252)
        text[0] = "Munition"; //Name
		text[1] = "Anzeigen von Pfeilen und Bolzen";  // Kommentar
    } else if (Ninja_ShowAlwaysImportantStats_Lang == 2) { // PL (Windows 1250)
        text[0] = "amunicja"; //Name
		text[1] = "Pokazywanie strzalek i beltow"; // Kommentar
    } else if (Ninja_ShowAlwaysImportantStats_Lang == 3) { // RU (Windows 1251)
        text[0] = "боеприпасы"; //Name
		text[1] = "Показаны стрелки и болты"; // Kommentar
    } else { // EN
        text[0] = "Ammo"; //Name
		text[1] = "Showing arrows and bolts"; // Kommentar
    };
	// Position und Dimension	
	posx		=	1000;	posy		=	NINJA_SAIS_MENU_START_Y + NINJA_SAIS_MENU_DY*1;
	dimx		=	3000;	dimy		=	750;
	// Aktionen
	onSelAction[0]	= NINJA_SAIS_SEL_ACTION_UNDEF;
	// Weitere Eigenschaften
	flags			= flags | NINJA_SAIS_IT_EFFECTS_NEXT;
};
instance MenuItem_Ninja_ShowAlwaysImportantStats_Ammo_Choice(C_MENU_ITEM_DEF)
{
	backPic		=	NINJA_SAIS_MENU_CHOICE_BACK_PIC;
	type		=	NINJA_SAIS_MENU_ITEM_CHOICEBOX;
	if (Ninja_ShowAlwaysImportantStats_Lang == 1) { // DE (Windows 1252)
        text[0] = "Aus|Nur Waffe|Immer"; //Name
    } else if (Ninja_ShowAlwaysImportantStats_Lang == 2) { // PL (Windows 1250)
        text[0] = "Wylacz|Tylko bron|Zawsze"; //Name
    } else if (Ninja_ShowAlwaysImportantStats_Lang == 3) { // RU (Windows 1251)
        text[0] = "Выкл|Только оружие|Всегда"; //Name
    } else { // EN
        text[0] = "Off|Weapon only|Always"; //Name
    };
    fontName    =   NINJA_SAIS_MENU_FONT_DEFAULT;
	// Position und Dimension	
	posx		= 5000;					posy		=	NINJA_SAIS_MENU_START_Y + NINJA_SAIS_MENU_DY*1 + NINJA_SAIS_MENU_CHOICE_YPLUS;
	dimx = NINJA_SAIS_MENU_SLIDER_DX;	dimy 		= 	NINJA_SAIS_MENU_CHOICE_DY;
	// Aktionen
    onChgSetOption        = "Ammo"; //Gothic.ini
    onChgSetOptionSection = "NINJA_SHOWALWAYSIMPORTANTSTATS"; //Gothic.ini
	// Weitere Eigenschaften	
	flags		= flags & ~NINJA_SAIS_IT_SELECTABLE;
	flags		= flags  | NINJA_SAIS_IT_TXT_CENTER;
};


/*
 *--------------AMMO TYPE--------------
 *
 */
instance MenuItem_Ninja_ShowaAlwaysImportantStats_AmmoType_Inst(C_MENU_ITEM_DEF)
{
	if (Ninja_ShowAlwaysImportantStats_Lang == 1) { // DE (Windows 1252)
        text[0] = "Munitions Typ"; //Name
		text[1] = "Welche Munitionsart soll angezeigt werden";  // Kommentar
    } else if (Ninja_ShowAlwaysImportantStats_Lang == 2) { // PL (Windows 1250)
        text[0] = "Rodzaj amunicji"; //Name
		text[1] = "Jaki rodzaj amunicji powinien byc wyswietlany"; // Kommentar
    } else if (Ninja_ShowAlwaysImportantStats_Lang == 3) { // RU (Windows 1251)
        text[0] = "Тип боеприпаса"; //Name
		text[1] = "Какой тип боеприпасов следует отображать"; // Kommentar
    } else { // EN
        text[0] = "Ammo type"; //Name
		text[1] = "Which type of ammo should be displayed"; // Kommentar
    };
	// Position und Dimension	
	posx		=	1000;	posy		=	NINJA_SAIS_MENU_START_Y + NINJA_SAIS_MENU_DY*2;
	dimx		=	3000;	dimy		=	750;
	// Aktionen
	onSelAction[0]	= NINJA_SAIS_SEL_ACTION_UNDEF;
	// Weitere Eigenschaften
	flags			= flags | NINJA_SAIS_IT_EFFECTS_NEXT;
};
INSTANCE MenuItem_Ninja_ShowaAlwaysImportantStats_AmmoType_Choice(C_MENU_ITEM_DEF)
{
	backPic		=	NINJA_SAIS_MENU_CHOICE_BACK_PIC;
	type		=	NINJA_SAIS_MENU_ITEM_CHOICEBOX;
	if (Ninja_ShowAlwaysImportantStats_Lang == 1) { // DE (Windows 1252)
        text[0] = "Nur Pfeile|Nur Bolzen|Beides"; //Name
    } else if (Ninja_ShowAlwaysImportantStats_Lang == 2) { // PL (Windows 1250)
        text[0] = "Tylko strzaly|Tylko sruby|Obie"; //Name
    } else if (Ninja_ShowAlwaysImportantStats_Lang == 3) { // RU (Windows 1251)
        text[0] = "Только стрелки|Только болты|Оба"; //Name
    } else { // EN
        text[0] = "Arrows only|Bolts only|Both"; //Name
    };
    fontName    =   NINJA_SAIS_MENU_FONT_DEFAULT;
	// Position und Dimension	
	posx		= 5000;					posy		=	NINJA_SAIS_MENU_START_Y + NINJA_SAIS_MENU_DY*2 + NINJA_SAIS_MENU_CHOICE_YPLUS;
	dimx = NINJA_SAIS_MENU_SLIDER_DX;	dimy 		= 	NINJA_SAIS_MENU_CHOICE_DY;
	// Aktionen
    onChgSetOption        = "AmmoType"; //Gothic.ini
    onChgSetOptionSection = "NINJA_SHOWALWAYSIMPORTANTSTATS"; //Gothic.ini
	// Weitere Eigenschaften	
	flags		= flags & ~NINJA_SAIS_IT_SELECTABLE;
	flags		= flags  | NINJA_SAIS_IT_TXT_CENTER;
};


/*
 *--------------MAGIC--------------
 *
 */
instance MenuItem_Ninja_ShowAlwaysImportantStats_Magic_Inst(C_MENU_ITEM_DEF)
{
	if (Ninja_ShowAlwaysImportantStats_Lang == 1) { // DE (Windows 1252)
        text[0] = "Zauber"; //Name
		text[1] = "Anzeigen von restlichen Spruchrollen";  // Kommentar
    } else if (Ninja_ShowAlwaysImportantStats_Lang == 2) { // PL (Windows 1250)
        text[0] = "magia"; //Name
		text[1] = "Pokaz pozostale zwoje"; // Kommentar
    } else if (Ninja_ShowAlwaysImportantStats_Lang == 3) { // RU (Windows 1251)
        text[0] = "Магия"; //Name
		text[1] = "Показать оставшиеся свитки"; // Kommentar
    } else { // EN
        text[0] = "Magic"; //Name
		text[1] = "Show remaining scrolls"; // Kommentar
    };
	// Position und Dimension	
	posx		=	1000;	posy		=	NINJA_SAIS_MENU_START_Y + NINJA_SAIS_MENU_DY*3;
	dimx		=	3000;	dimy		=	750;
	// Aktionen
	onSelAction[0]	= NINJA_SAIS_SEL_ACTION_UNDEF;
	// Weitere Eigenschaften
	flags			= flags | NINJA_SAIS_IT_EFFECTS_NEXT;
};
instance MenuItem_Ninja_ShowAlwaysImportantStats_Magic_Choice(C_MENU_ITEM_DEF)
{
	backPic		=	NINJA_SAIS_MENU_CHOICE_BACK_PIC;
	type		=	NINJA_SAIS_MENU_ITEM_CHOICEBOX;
	if (Ninja_ShowAlwaysImportantStats_Lang == 1) { // DE (Windows 1252)
        text[0] = "Aus|Nur Hand|Immer"; //Name
    } else if (Ninja_ShowAlwaysImportantStats_Lang == 2) { // PL (Windows 1250)
        text[0] = "Wylacz|Tylko reka|Zawsze"; //Name
    } else if (Ninja_ShowAlwaysImportantStats_Lang == 3) { // RU (Windows 1251)
        text[0] = "Выкл|Только рука|Всегда"; //Name
    } else { // EN
        text[0] = "Off|Hand only|Always"; //Name
    };
    fontName    =   NINJA_SAIS_MENU_FONT_DEFAULT;
	// Position und Dimension	
	posx		= 5000;					posy		=	NINJA_SAIS_MENU_START_Y + NINJA_SAIS_MENU_DY*3 + NINJA_SAIS_MENU_CHOICE_YPLUS;
	dimx = NINJA_SAIS_MENU_SLIDER_DX;	dimy 		= 	NINJA_SAIS_MENU_CHOICE_DY;
	// Aktionen
    onChgSetOption        = "Magic"; //Gothic.ini
    onChgSetOptionSection = "NINJA_SHOWALWAYSIMPORTANTSTATS"; //Gothic.ini
	// Weitere Eigenschaften	
	flags		= flags & ~NINJA_SAIS_IT_SELECTABLE;
	flags		= flags  | NINJA_SAIS_IT_TXT_CENTER;
};



/*
 *--------------Health/Mana--------------
 *
 */
instance MenuItem_Ninja_ShowAlwaysImportantStats_HPMP_Inst(C_MENU_ITEM_DEF)
{
	if (Ninja_ShowAlwaysImportantStats_Lang == 1) { // DE (Windows 1252)
        text[0] = "HP/MP Text"; //Name
		text[1] = "Zeigt die HP und/oder die MP als Text";  // Kommentar
    } else if (Ninja_ShowAlwaysImportantStats_Lang == 2) { // PL (Windows 1250)
        text[0] = "Tekst HP/MP"; //Name
		text[1] = "Pokazuje PЇ i/lub PZ jako tekst"; // Kommentar
    } else if (Ninja_ShowAlwaysImportantStats_Lang == 3) { // RU (Windows 1251)
        text[0] = "Текст HP/MP"; //Name
		text[1] = "Показывает HP и/или MP в виде текста"; // Kommentar
    } else { // EN
        text[0] = "HP/MP Text"; //Name
		text[1] = "Shows the HP and/or the MP as text"; // Kommentar
    };
	// Position und Dimension	
	posx		=	1000;	posy		=	NINJA_SAIS_MENU_START_Y + NINJA_SAIS_MENU_DY*4;
	dimx		=	3000;	dimy		=	750;
	// Aktionen
	onSelAction[0]	= NINJA_SAIS_SEL_ACTION_UNDEF;
	// Weitere Eigenschaften
	flags			= flags | NINJA_SAIS_IT_EFFECTS_NEXT;
};
instance MenuItem_Ninja_ShowAlwaysImportantStats_HPMP_Choice(C_MENU_ITEM_DEF)
{
	backPic		=	NINJA_SAIS_MENU_CHOICE_BACK_PIC;
	type		=	NINJA_SAIS_MENU_ITEM_CHOICEBOX;
	if (Ninja_ShowAlwaysImportantStats_Lang == 1) { // DE (Windows 1252)
        text[0] = "Aus|Nur HP|Nur MP|Beide"; //Name
    } else if (Ninja_ShowAlwaysImportantStats_Lang == 2) { // PL (Windows 1250)
        text[0] = "Wylacz|Tylko HP|Tylko MP|Oba"; //Name
    } else if (Ninja_ShowAlwaysImportantStats_Lang == 3) { // RU (Windows 1251)
        text[0] = "Выкл.|Только HP|Только MP|Оба"; //Name
    } else { // EN
        text[0] = "Off|HP only|MP only|Both"; //Name
    };
    fontName    =   NINJA_SAIS_MENU_FONT_DEFAULT;
	// Position und Dimension	
	posx		= 5000;					posy		=	NINJA_SAIS_MENU_START_Y + NINJA_SAIS_MENU_DY*4 + NINJA_SAIS_MENU_CHOICE_YPLUS;
	dimx = NINJA_SAIS_MENU_SLIDER_DX;	dimy 		= 	NINJA_SAIS_MENU_CHOICE_DY;
	// Aktionen
    onChgSetOption        = "HpMp"; //Gothic.ini
    onChgSetOptionSection = "NINJA_SHOWALWAYSIMPORTANTSTATS"; //Gothic.ini
	// Weitere Eigenschaften	
	flags		= flags & ~NINJA_SAIS_IT_SELECTABLE;
	flags		= flags  | NINJA_SAIS_IT_TXT_CENTER;
};



/*
 *--------------Health Enemy--------------
 *
 */
instance MenuItem_Ninja_ShowAlwaysImportantStats_HPEnemy_Inst(C_MENU_ITEM_DEF)
{
	if (Ninja_ShowAlwaysImportantStats_Lang == 1) { // DE (Windows 1252)
        text[0] = "HP NPC"; //Name
		text[1] = "Zeigt die HP des angeschauten NPC's an";  // Kommentar
    } else if (Ninja_ShowAlwaysImportantStats_Lang == 2) { // PL (Windows 1250)
        text[0] = "HP NPC"; //Name
		text[1] = "Pokazuje HP ogl№danego NPC"; // Kommentar
    } else if (Ninja_ShowAlwaysImportantStats_Lang == 3) { // RU (Windows 1251)
        text[0] = "HP NPC"; //Name
		text[1] = "Показывает HP просматриваемого NPC"; // Kommentar
    } else { // EN
        text[0] = "HP NPC"; //Name
		text[1] = "Shows the HP of the viewed NPC"; // Kommentar
    };
	// Position und Dimension	
	posx		=	1000;	posy		=	NINJA_SAIS_MENU_START_Y + NINJA_SAIS_MENU_DY*5;
	dimx		=	3000;	dimy		=	750;
	// Aktionen
	onSelAction[0]	= NINJA_SAIS_SEL_ACTION_UNDEF;
	// Weitere Eigenschaften
	flags			= flags | NINJA_SAIS_IT_EFFECTS_NEXT;
};
instance MenuItem_Ninja_ShowAlwaysImportantStats_HPEnemy_Choice(C_MENU_ITEM_DEF)
{
	backPic		=	NINJA_SAIS_MENU_CHOICE_BACK_PIC;
	type		=	NINJA_SAIS_MENU_ITEM_CHOICEBOX;
	if (Ninja_ShowAlwaysImportantStats_Lang == 1) { // DE (Windows 1252)
        text[0] = "Aus|An"; //Name
    } else if (Ninja_ShowAlwaysImportantStats_Lang == 2) { // PL (Windows 1250)
        text[0] = "Wyі№cz|Wі№cz"; //Name
    } else if (Ninja_ShowAlwaysImportantStats_Lang == 3) { // RU (Windows 1251)
        text[0] = "Выкл.|Вкл."; //Name
    } else { // EN
        text[0] = "Off|On"; //Name
    };
    fontName    =   NINJA_SAIS_MENU_FONT_DEFAULT;
	// Position und Dimension	
	posx		= 5000;					posy		=	NINJA_SAIS_MENU_START_Y + NINJA_SAIS_MENU_DY*5 + NINJA_SAIS_MENU_CHOICE_YPLUS;
	dimx = NINJA_SAIS_MENU_SLIDER_DX;	dimy 		= 	NINJA_SAIS_MENU_CHOICE_DY;
	// Aktionen
    onChgSetOption        = "HpEnemy"; //Gothic.ini
    onChgSetOptionSection = "NINJA_SHOWALWAYSIMPORTANTSTATS"; //Gothic.ini
	// Weitere Eigenschaften	
	flags		= flags & ~NINJA_SAIS_IT_SELECTABLE;
	flags		= flags  | NINJA_SAIS_IT_TXT_CENTER;
};



/*
 *--------------ZURЬCK--------------
 *
 */
instance MenuItem_Ninja_ShowAlwaysImportantStats_Opt_Display_Back(C_MENU_ITEM_DEF)
{
	if (Ninja_ShowAlwaysImportantStats_Lang == 1) { // DE (Windows 1252)
        text[0] = "Zurьck"; //Name
    } else if (Ninja_ShowAlwaysImportantStats_Lang == 2) { // PL (Windows 1250)
        text[0] = "Plecy"; //Name
    } else if (Ninja_ShowAlwaysImportantStats_Lang == 3) { // RU (Windows 1251)
        text[0] = "Назад"; //Name
    } else { // EN
        text[0] = "Back"; //Name
    };
	// Position und Dimension
	posx		=	1000;		posy		=	NINJA_SAIS_MENU_START_Y + NINJA_SAIS_MENU_DY*7;
	dimx		=	6192;
	// Aktionen
	onSelAction[0]	= 	NINJA_SAIS_SEL_ACTION_BACK;
	// Weitere Eigenschaften
	flags			= flags | NINJA_SAIS_IT_TXT_CENTER;
};
