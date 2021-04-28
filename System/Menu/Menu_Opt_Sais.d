const int Ninja_ShowAlwaysImportantStats_Lang = 0; // Will be set automatically

/* posx = <-->
 * posy = /\
		  |
		  \/
 *--------------MENЬ IN EINSTELLUNGEN--------------
 *
 */
instance MenuItem_Ninja_ShowAlwaysImportantStats_Opt(C_MENU_ITEM_DEF)
{	
	if (Ninja_ShowAlwaysImportantStats_Lang == 1) { // DE (Windows 1252)
        text[0] = "SAIS Einstellungen"; //Name
		text[1] = "Zeige immer die wichtigsten Statistiken Einstellungen";  // Kommentar
    } else if (Ninja_ShowAlwaysImportantStats_Lang == 2) { // PL (Windows 1250)
        text[0] = "Ustawienia SAIS"; //Name
		text[1] = "Zawsze pokazuj najwazniejsze ustawienia statystyk"; // Kommentar
    } else if (Ninja_ShowAlwaysImportantStats_Lang == 3) { // RU (Windows 1251)
        text[0] = "Настройки SAIS"; //Name
		text[1] = "Настройки показа различной информации"; // Kommentar
    } else { // EN
        text[0] = "SAIS Settings"; //Name
		text[1] = "Show Always Important Stats Settings"; // Kommentar
    };
	// Position und Dimension
	posx		= 0;		posy		= 0;
	dimx		= 8192;		dimy		= 750;
	// Aktionen
	onSelAction[0]	= NINJA_SAIS_SEL_ACTION_STARTMENU;
	onSelAction_S[0]= "Menu_Ninja_ShowAlwaysImportantStats_Opt";
	// Weitere Eigenschaften
	flags = flags | NINJA_SAIS_IT_TXT_CENTER;
};


/*
 *--------------SAIS HAUPTMENЬ--------------
 *
 */
instance Menu_Ninja_ShowAlwaysImportantStats_Opt(C_MENU_DEF)
{
	backpic		= NINJA_SAIS_MENU_BACK_PIC;
	
	items[0]	= "MenuItem_Ninja_ShowAlwaysImportantStats_Opt_Heading";
	
	items[1] 	= "MenuItem_Ninja_ShowAlwaysImportantStats_Font_Inst";
	items[2] 	= "MenuItem_Ninja_ShowAlwaysImportantStats_Font_Choice";
			
	items[3] 	= "MenuItem_Ninja_ShowAlwaysImportantStats_Exp_Inst";
	items[4] 	= "MenuItem_Ninja_ShowAlwaysImportantStats_Exp_Choice";
	
	items[5] 	= "MenuItem_Ninja_ShowAlwaysImportantStats_Clock_Inst";
	items[6] 	= "MenuItem_Ninja_ShowAlwaysImportantStats_Clock_Choice";
	
	items[7] 	= "MenuItem_Ninja_ShowAlwaysImportantStats_Displays_Choice";
	
	items[8] 	= "MenuItem_Ninja_ShowAlwaysImportantStats_Displays_Mods_Choice";
	
	items[9]	= "MenuItem_Ninja_ShowAlwaysImportantStats_Opt_Back";
	
	//items[20]	= "MENU_ITEM_KEY_UP";
	//items[21]	= "MENU_ITEM_INP_UP";
	
	defaultOutGame	= 0;	// PERFORMANCE-SETTINGS
	defaultInGame	= 0;	// PERFORMANCE-SETTINGS

	flags = flags | NINJA_SAIS_MENU_SHOW_INFO;
};


/*
 *--------------HEADLINE-------------
 *
 */
instance MenuItem_Ninja_ShowAlwaysImportantStats_Opt_Heading(C_MENU_ITEM_DEF)
{
	if (Ninja_ShowAlwaysImportantStats_Lang == 1) { // DE (Windows 1252)
        text[0] = "SAIS Einstellungen"; //Name
    } else if (Ninja_ShowAlwaysImportantStats_Lang == 2) { // PL (Windows 1250)
        text[0] = "Ustawienia SAIS"; //Name
    } else if (Ninja_ShowAlwaysImportantStats_Lang == 3) { // RU (Windows 1251)
        text[0] = "Настройки SAIS"; //Name
    } else { // EN
        text[0] = "SAIS Settings"; //Name
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
 *--------------FONT SIZE--------------
 *
 */
instance MenuItem_Ninja_ShowAlwaysImportantStats_Font_Inst(C_MENU_ITEM_DEF)
{	
	if (Ninja_ShowAlwaysImportantStats_Lang == 1) { // DE (Windows 1252)
        text[0] = "SchriftgrцЯe"; //Name
		text[1] = "GrцЯe der Schrift";  // Kommentar
    } else if (Ninja_ShowAlwaysImportantStats_Lang == 2) { // PL (Windows 1250)
        text[0] = "Rozmiar czcionki"; //Name
		text[1] = "Rozmiar czcionki"; // Kommentar
    } else if (Ninja_ShowAlwaysImportantStats_Lang == 3) { // RU (Windows 1251)
        text[0] = "Размер шрифта"; //Name
		text[1] = "Размер шрифтаt"; // Kommentar
    } else { // EN
        text[0] = "Font Size"; //Name
		text[1] = "Font Size"; // Kommentar
    };
	// Position und Dimension	
	posx		=	1000;	posy		=	NINJA_SAIS_MENU_START_Y;
	dimx		=	3000;	dimy		=	750;
	// Aktionen
	onSelAction[0]	= NINJA_SAIS_SEL_ACTION_UNDEF;
	// Weitere Eigenschaften
	flags			= flags | NINJA_SAIS_IT_EFFECTS_NEXT;
};
instance MenuItem_Ninja_ShowAlwaysImportantStats_Font_Choice(C_MENU_ITEM_DEF)
{
	backPic		=	NINJA_SAIS_MENU_CHOICE_BACK_PIC;
	type		=	NINJA_SAIS_MENU_ITEM_CHOICEBOX;
	if (Ninja_ShowAlwaysImportantStats_Lang == 1) { // DE (Windows 1252)
        text[0] = "Klein|GroЯ"; //Name
    } else if (Ninja_ShowAlwaysImportantStats_Lang == 2) { // PL (Windows 1250)
        text[0] = "Maly|Duzy"; //Name
    } else if (Ninja_ShowAlwaysImportantStats_Lang == 3) { // RU (Windows 1251)
        text[0] = "Мал.|Бол."; //Name
    } else { // EN
        text[0] = "Small|Big"; //Name
    };
	fontName    =   NINJA_SAIS_MENU_FONT_DEFAULT;
	// Position und Dimension	
	posx		= 5000;		posy		=	NINJA_SAIS_MENU_START_Y + NINJA_SAIS_MENU_CHOICE_YPLUS;
	dimx = NINJA_SAIS_MENU_SLIDER_DX;	dimy 	= 	NINJA_SAIS_MENU_CHOICE_DY;
	// Aktionen
	onChgSetOption        = "Font"; //Gothic.ini
	onChgSetOptionSection = "NINJA_SHOWALWAYSIMPORTANTSTATS"; //Gothic.ini
	// Weitere Eigenschaften	
	flags		= flags & ~NINJA_SAIS_IT_SELECTABLE;
	flags		= flags  | NINJA_SAIS_IT_TXT_CENTER;
};


/*
 *--------------EXP STYLE--------------
 *
 */
instance MenuItem_Ninja_ShowAlwaysImportantStats_Exp_Inst(C_MENU_ITEM_DEF)
{
	if (Ninja_ShowAlwaysImportantStats_Lang == 1) { // DE (Windows 1252)
        text[0] = "EXP Stil"; //Name
		text[1] = "EXP Stil - Text oder Leiste";  // Kommentar
    } else if (Ninja_ShowAlwaysImportantStats_Lang == 2) { // PL (Windows 1250)
        text[0] = "EXP style"; //Name
		text[1] = "EXP style - tekst lub bar"; // Kommentar
    } else if (Ninja_ShowAlwaysImportantStats_Lang == 3) { // RU (Windows 1251)
        text[0] = "Стиль опыта"; //Name
		text[1] = "Стиль EXP - текст или полоса"; // Kommentar
    } else { // EN
        text[0] = "EXP Style"; //Name
		text[1] = "EXP Style - Text or Bar"; // Kommentar
    };
	// Position und Dimension	
	posx		=	1000;	posy		=	NINJA_SAIS_MENU_START_Y + NINJA_SAIS_MENU_DY*1;
	dimx		=	3000;	dimy		=	750;
	// Aktionen
	onSelAction[0]	= NINJA_SAIS_SEL_ACTION_UNDEF;
	// Weitere Eigenschaften
	flags			= flags | NINJA_SAIS_IT_EFFECTS_NEXT;
};
instance MenuItem_Ninja_ShowAlwaysImportantStats_Exp_Choice(C_MENU_ITEM_DEF)
{
	backPic		=	NINJA_SAIS_MENU_CHOICE_BACK_PIC;
	type		=	NINJA_SAIS_MENU_ITEM_CHOICEBOX;
	if (Ninja_ShowAlwaysImportantStats_Lang == 1) { // DE (Windows 1252)
        text[0] = "Text|Leiste"; //Name
    } else if (Ninja_ShowAlwaysImportantStats_Lang == 2) { // PL (Windows 1250)
        text[0] = "Wylacz|Wlacz"; //Name
    } else if (Ninja_ShowAlwaysImportantStats_Lang == 3) { // RU (Windows 1251)
        text[0] = "Текст|Бар"; //Name
    } else { // EN
        text[0] = "Text|Bar"; //Name
    };
    fontName    =   NINJA_SAIS_MENU_FONT_DEFAULT;
	// Position und Dimension	
	posx		= 5000;					posy		=	NINJA_SAIS_MENU_START_Y + NINJA_SAIS_MENU_DY*1 + NINJA_SAIS_MENU_CHOICE_YPLUS;
	dimx = NINJA_SAIS_MENU_SLIDER_DX;	dimy 		= 	NINJA_SAIS_MENU_CHOICE_DY;
	// Aktionen
    onChgSetOption        = "Exp"; //Gothic.ini
    onChgSetOptionSection = "NINJA_SHOWALWAYSIMPORTANTSTATS"; //Gothic.ini
	// Weitere Eigenschaften	
	flags		= flags & ~NINJA_SAIS_IT_SELECTABLE;
	flags		= flags  | NINJA_SAIS_IT_TXT_CENTER;
};


/*
 *--------------Clock--------------
 *
 */
instance MenuItem_Ninja_ShowAlwaysImportantStats_Clock_Inst(C_MENU_ITEM_DEF)
{
	if (Ninja_ShowAlwaysImportantStats_Lang == 1) { // DE (Windows 1252)
        text[0] = "Uhr"; //Name
		text[1] = "Zeigt die Gothic Spielwelt Zeit an";  // Kommentar
    } else if (Ninja_ShowAlwaysImportantStats_Lang == 2) { // PL (Windows 1250)
        text[0] = "Zegar"; //Name
		text[1] = "Pokazuje czas na њwiecie w grze Gothic"; // Kommentar
    } else if (Ninja_ShowAlwaysImportantStats_Lang == 3) { // RU (Windows 1251)
        text[0] = "Часы"; //Name
		text[1] = "Показывает время в мире готической игры"; // Kommentar
    } else { // EN
        text[0] = "Clock"; //Name
		text[1] = "Shows the Gothic game world time"; // Kommentar
    };
	// Position und Dimension	
	posx		=	1000;	posy		=	NINJA_SAIS_MENU_START_Y + NINJA_SAIS_MENU_DY*2;
	dimx		=	3000;	dimy		=	750;
	// Aktionen
	onSelAction[0]	= NINJA_SAIS_SEL_ACTION_UNDEF;
	// Weitere Eigenschaften
	flags			= flags | NINJA_SAIS_IT_EFFECTS_NEXT;
};
instance MenuItem_Ninja_ShowAlwaysImportantStats_Clock_Choice(C_MENU_ITEM_DEF)
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
	posx		= 5000;					posy		=	NINJA_SAIS_MENU_START_Y + NINJA_SAIS_MENU_DY*2 + NINJA_SAIS_MENU_CHOICE_YPLUS;
	dimx = NINJA_SAIS_MENU_SLIDER_DX;	dimy 		= 	NINJA_SAIS_MENU_CHOICE_DY;
	// Aktionen
    onChgSetOption        = "Clock"; //Gothic.ini
    onChgSetOptionSection = "NINJA_SHOWALWAYSIMPORTANTSTATS"; //Gothic.ini
	// Weitere Eigenschaften	
	flags		= flags & ~NINJA_SAIS_IT_SELECTABLE;
	flags		= flags  | NINJA_SAIS_IT_TXT_CENTER;
};

/*
 *--------------Displays Settings--------------
 *
 */
instance MenuItem_Ninja_ShowAlwaysImportantStats_Displays_Choice(C_MENU_ITEM_DEF)
{	
	if (Ninja_ShowAlwaysImportantStats_Lang == 1) { // DE (Windows 1252)
        text[0] = "Anzeigen"; //Name
		text[1] = "Einstellungen der Anzeigen (Gold, Pfeile...)";  // Kommentar
    } else if (Ninja_ShowAlwaysImportantStats_Lang == 2) { // PL (Windows 1250)
        text[0] = "ogіaszaж w gazecie"; //Name
		text[1] = "Ustawienia wyњwietlacza zіote, strzaіki"; // Kommentar
    } else if (Ninja_ShowAlwaysImportantStats_Lang == 3) { // RU (Windows 1251)
        text[0] = "давать объявление"; //Name
		text[1] = "Настройки дисплея золото, стрелки"; // Kommentar
    } else { // EN
        text[0] = "Displays"; //Name
		text[1] = "Settings of the Displays for gold, arrows..."; // Kommentar
    };
	// Position und Dimension
	posx		=	0;		posy		=	NINJA_SAIS_MENU_START_Y + NINJA_SAIS_MENU_DY*4;
	dimx		=	8192;
	// Aktionen
	onSelAction[0]	= NINJA_SAIS_SEL_ACTION_STARTMENU;
	onSelAction_S[0]= "Menu_Ninja_ShowAlwaysImportantStats_Opt_Display";
	// Weitere Eigenschaften
	flags = flags | NINJA_SAIS_IT_TXT_CENTER;
};



/*
 *--------------Displays Mod Settings--------------
 *
 */
instance MenuItem_Ninja_ShowAlwaysImportantStats_Displays_Mods_Choice(C_MENU_ITEM_DEF)
{	
	if (Ninja_ShowAlwaysImportantStats_Lang == 1) { // DE (Windows 1252)
        text[0] = "Anzeigen Mods/Patches"; //Name
		text[1] = "Einstellungen der Anzeigen fьr Mods/Patches";  // Kommentar
    } else if (Ninja_ShowAlwaysImportantStats_Lang == 2) { // PL (Windows 1250)
        text[0] = "Pokaї mody/poprawki"; //Name
		text[1] = "Ustawienia wyњwietlania dla modуw/poprawek"; // Kommentar
    } else if (Ninja_ShowAlwaysImportantStats_Lang == 3) { // RU (Windows 1251)
        text[0] = "Показать моды/патчи"; //Name
		text[1] = "Настройки дисплеев для модов/патчей"; // Kommentar
    } else { // EN
        text[0] = "Displays Mods/Patches"; //Name
		text[1] = "Settings of the Displays for Mods/Patches"; // Kommentar
    };
	// Position und Dimension
	posx		=	0;		posy		=	NINJA_SAIS_MENU_START_Y + NINJA_SAIS_MENU_DY*5;
	dimx		=	8192;
	// Aktionen
	onSelAction[0]	= NINJA_SAIS_SEL_ACTION_STARTMENU;
	onSelAction_S[0]= "Menu_Ninja_ShowAlwaysImportantStats_Opt_Display_Mod";
	// Weitere Eigenschaften
	flags = flags | NINJA_SAIS_IT_TXT_CENTER;
};



/*
 *--------------ZURЬCK--------------
 *
 */
instance MenuItem_Ninja_ShowAlwaysImportantStats_Opt_Back(C_MENU_ITEM_DEF)
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
