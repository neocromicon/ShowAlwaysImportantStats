const int Ninja_ShowAlwaysImportantStats_Lang = 0; // Will be set automatically

/*
 *--------------DISPLAY MOD SETTINGS--------------
 *
 */
instance Menu_Ninja_ShowAlwaysImportantStats_Opt_Display_Mod(C_MENU_DEF)
{
	backpic		= NINJA_SAIS_MENU_BACK_PIC;
	
	items[0]	= "MenuItem_Ninja_ShowAlwaysImportantStats_Opt_Display_Mods_Heading";
	
	items[1] 	= "MenuItem_Ninja_ShowAlwaysImportantStats_Quest_Inst";
	items[2] 	= "MenuItem_Ninja_ShowAlwaysImportantStats_Quest_Choice";
	
	items[3] 	= "MenuItem_Ninja_ShowAlwaysImportantStats_LoaBugs_Inst";
	items[4] 	= "MenuItem_Ninja_ShowAlwaysImportantStats_LoaBugs_Choice";
	
	items[5]	= "MenuItem_Ninja_ShowAlwaysImportantStats_Opt_Display_Mods_Back";
	
	defaultOutGame	= 0;	// PERFORMANCE-SETTINGS
	defaultInGame	= 0;	// PERFORMANCE-SETTINGS

	flags = flags | NINJA_SAIS_MENU_SHOW_INFO;
};


/*
 *--------------HEADLINE-------------
 *
 */
instance MenuItem_Ninja_ShowAlwaysImportantStats_Opt_Display_Mods_Heading(C_MENU_ITEM_DEF)
{
	if (Ninja_ShowAlwaysImportantStats_Lang == 1) { // DE (Windows 1252)
        text[0] = "Anzeigen Mods/Patches"; //Name
    } else if (Ninja_ShowAlwaysImportantStats_Lang == 2) { // PL (Windows 1250)
        text[0] = "Pokaї mody/poprawki"; //Name
    } else if (Ninja_ShowAlwaysImportantStats_Lang == 3) { // RU (Windows 1251)
        text[0] = "Показать моды/патчи"; //Name
    } else { // EN
        text[0] = "Displays Mods/Patches"; //Name
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
 *--------------QUEST--------------
 *
 */
instance MenuItem_Ninja_ShowAlwaysImportantStats_Quest_Inst(C_MENU_ITEM_DEF)
{
	if (Ninja_ShowAlwaysImportantStats_Lang == 1) { // DE (Windows 1252)
        text[0] = "Quest"; //Name
		text[1] = "Anzeigen von Quest's wenn Ordered Logs installiert ist";  // Kommentar
    } else if (Ninja_ShowAlwaysImportantStats_Lang == 2) { // PL (Windows 1250)
        text[0] = "Zadanie"; //Name
		text[1] = "Pokaz zadania, jesli zamowione dzienniki sa zainstalowane"; // Kommentar
    } else if (Ninja_ShowAlwaysImportantStats_Lang == 3) { // RU (Windows 1251)
        text[0] = "Квест"; //Name
		text[1] = "Показывать квесты, если установлены упорядоченные журналы"; // Kommentar
    } else { // EN
        text[0] = "Quest"; //Name
		text[1] = "Show quests if Ordered Logs is installed"; // Kommentar
    };
	// Position und Dimension	
	posx		=	1000;	posy		=	NINJA_SAIS_MENU_START_Y;
	dimx		=	3000;	dimy		=	750;
	// Aktionen
	onSelAction[0]	= NINJA_SAIS_SEL_ACTION_UNDEF;
	// Weitere Eigenschaften
	flags			= flags | NINJA_SAIS_IT_EFFECTS_NEXT;
};
instance MenuItem_Ninja_ShowAlwaysImportantStats_Quest_Choice(C_MENU_ITEM_DEF)
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
    onChgSetOption        = "Quest"; //Gothic.ini
    onChgSetOptionSection = "NINJA_SHOWALWAYSIMPORTANTSTATS"; //Gothic.ini
	// Weitere Eigenschaften	
	flags		= flags & ~NINJA_SAIS_IT_SELECTABLE;
	flags		= flags  | NINJA_SAIS_IT_TXT_CENTER;
};

/*
 *--------------LOA BUGS--------------
 *
 */
instance MenuItem_Ninja_ShowAlwaysImportantStats_LoaBugs_Inst(C_MENU_ITEM_DEF)
{
	if (Ninja_ShowAlwaysImportantStats_Lang == 1) { // DE (Windows 1252)
        text[0] = "LoA Bugs"; //Name
		text[1] = "Zeigt die Wдhrung 'Bugs' wenn im Gesprдch mit Lucigoth";  // Kommentar
    } else if (Ninja_ShowAlwaysImportantStats_Lang == 2) { // PL (Windows 1250)
        text[0] = "LoA robaki"; //Name
		text[1] = "Pokazuje bікdy zwi№zane z walut№ podczas rozmowy z Lucigoth"; // Kommentar
    } else if (Ninja_ShowAlwaysImportantStats_Lang == 3) { // RU (Windows 1251)
        text[0] = "LoA Ошибки"; //Name
		text[1] = "Показывает валютные 'ошибки' при разговоре с Люциготом"; // Kommentar
    } else { // EN
        text[0] = "LoA Bugs"; //Name
		text[1] = "Shows the Currency 'bugs' when talking to Lucigoth"; // Kommentar
    };
	// Position und Dimension	
	posx		=	1000;	posy		=	NINJA_SAIS_MENU_START_Y + NINJA_SAIS_MENU_DY*1;
	dimx		=	3000;	dimy		=	750;
	// Aktionen
	onSelAction[0]	= NINJA_SAIS_SEL_ACTION_UNDEF;
	// Weitere Eigenschaften
	flags			= flags | NINJA_SAIS_IT_EFFECTS_NEXT;
};
instance MenuItem_Ninja_ShowAlwaysImportantStats_LoaBugs_Choice(C_MENU_ITEM_DEF)
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
	posx		= 5000;					posy		=	NINJA_SAIS_MENU_START_Y + NINJA_SAIS_MENU_DY*1 + NINJA_SAIS_MENU_CHOICE_YPLUS;
	dimx = NINJA_SAIS_MENU_SLIDER_DX;	dimy 		= 	NINJA_SAIS_MENU_CHOICE_DY;
	// Aktionen
    onChgSetOption        = "LoA_Bugs"; //Gothic.ini
    onChgSetOptionSection = "NINJA_SHOWALWAYSIMPORTANTSTATS"; //Gothic.ini
	// Weitere Eigenschaften	
	flags		= flags & ~NINJA_SAIS_IT_SELECTABLE;
	flags		= flags  | NINJA_SAIS_IT_TXT_CENTER;
};



/*
 *--------------ZURЬCK--------------
 *
 */
instance MenuItem_Ninja_ShowAlwaysImportantStats_Opt_Display_Mods_Back(C_MENU_ITEM_DEF)
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
	posx		=	1000;		posy		=	NINJA_SAIS_MENU_START_Y + NINJA_SAIS_MENU_DY*3;
	dimx		=	6192;
	// Aktionen
	onSelAction[0]	= 	NINJA_SAIS_SEL_ACTION_BACK;
	// Weitere Eigenschaften
	flags			= flags | NINJA_SAIS_IT_TXT_CENTER;
};
