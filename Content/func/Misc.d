/*
 * Guess localization (0 = EN, 1 = DE, 2 = PL, 3 = RU)
 * Source: https://github.com/szapp/Ninja/wiki/Inject-Changes#localization
 */
func int Ninja_ShowAlwaysImportantStats_GuessLocalization() {
    var int pan; pan = MEM_GetSymbol("MOBNAME_PAN");
    if (pan) {
        var zCPar_Symbol panSymb; panSymb = _^(pan);
        var string panName; panName = MEM_ReadString(panSymb.content);
        if (Hlp_StrCmp(panName, "Pfanne")) { // DE (Windows 1252)
            return 1;
        } else if (Hlp_StrCmp(panName, "Patelnia")) { // PL (Windows 1250)
            return 2;
        } else if (Hlp_StrCmp(panName, "Сковорода")) { // RU (Windows 1251)
            return 3;
        };
    };
    return 0; // Otherwise EN
};


/*
 * Set localization indicator in menu scripts
 * Source: https://github.com/szapp/Ninja/wiki/Inject-Changes
 */
func void Ninja_ShowAlwaysImportantStats_SetMenuLocalization() {
    const int zCPar_SymbolTable__GetSymbol_G1 = 7316336; //0x6FA370
    const int zCPar_SymbolTable__GetSymbol_G2 = 8011328; //0x7A3E40

    var string symbolName; symbolName = "NINJA_SHOWALWAYSIMPORTANTSTATS_LANG";
    var int symTab; symTab = MEM_ReadInt(menuParserPointerAddress) + 16;
    var int namePtr; namePtr = _@s(symbolName);

    const int call = 0;
    if (CALL_Begin(call)) {
        CALL_PtrParam(_@(namePtr));
        CALL_PutRetValTo(_@(symbPtr));
        CALL__thiscall(_@(symTab), MEMINT_SwitchG1G2(zCPar_SymbolTable__GetSymbol_G1, zCPar_SymbolTable__GetSymbol_G2));
        call = CALL_End();
    };

    var int symbPtr;
    if (symbPtr) {
        var zCPar_Symbol symb; symb = _^(symbPtr);
        symb.content = Ninja_ShowAlwaysImportantStats_GuessLocalization();
    };
};


/*
 * Create menu item from script instance name
 * Source: https://github.com/szapp/Ninja/wiki/Inject-Changes
 */
func int Ninja_ShowAlwaysImportantStats_CreateMenuItem(var string scriptName) {
    const int zCMenuItem__Create_G1 = 5052784; //0x4D1970
    const int zCMenuItem__Create_G2 = 5105600; //0x4DE7C0
    var int strPtr; strPtr = _@s(scriptName);

    const int call = 0;
    if (CALL_Begin(call)) {
        CALL_PtrParam(_@(strPtr));
        CALL_PutRetValTo(_@(ret));
        CALL__cdecl(MEMINT_SwitchG1G2(zCMenuItem__Create_G1,
                                      zCMenuItem__Create_G2));
        call = CALL_End();
    };

    var int ret;
    return +ret;
};


/*
 * Functions for retrieving information about loaded patches
 * Source: https://github.com/szapp/Ninja/wiki/Inject-Changes#helper-symbols
 */
func int Ninja_GetPatchNum() {
    if (!NINJA_PATCHES) {
        return 0;
    };
    var zCArray arr; arr = _^(NINJA_PATCHES);
    return arr.numInArray;
};

func int Ninja_GetPatchObj(var int index) {
    if (index >= Ninja_GetPatchNum()) {
        MEM_Error("Ninja_GetPatchObj: Index out of bounds!");
        return 0;
    };
    return MEM_ArrayRead(NINJA_PATCHES, index);
};

func string Ninja_GetPatchName(var int index) {
    var int patch; patch = Ninja_GetPatchObj(index);
    if (patch) {
        return STR_FromChar(patch+4);
    } else {
        return "";
    };
};

func string Ninja_GetPatchDescription(var int index) {
    var int patch; patch = Ninja_GetPatchObj(index);
    if (patch) {
        return STR_FromChar(patch+4+288);
    } else {
        return "";
    };
};


/*
 * Function to get first quest in active quests in questbook //Credits: Kirides
 */
func string Ninja_ShowAlwaysImportantStats_PrintActiveMissionDescription() {

    var int topicNodePtr; topicNodePtr = oCLogManager_Ptr;

    var zCList topicNode;
    var oCLogTopic topic;

    while(topicNodePtr);
        topicNode = _^(topicNodePtr);
        
        if (topicNode.data) {
            topic = _^(topicNode.data);
            if (topic.m_enuSection == 0  /*LOG_MISSION*/ )
            && (topic.m_enuStatus  == 1  /*LOG_RUNNING*/ ) {
				return topic.m_strDescription;
            };
        };
		topicNodePtr = topicNode.next;
    end;
	return ""; // Access Violation Bugfix, with new game or nothing in Questbook
};


func void Ninja_ShowAlwaysImportantStats_FirstRun() {
	const string firstRunInfo = "";
	if (Hlp_StrCmp(firstRunInfo, "")) { // This is only true first time
        var int lang; lang = Ninja_ShowAlwaysImportantStats_GuessLocalization();
        if (lang == 1) { // DE
            firstRunInfo = "SAIS besitzt nun eine eigene Spielwelt Uhr. Du kannst sie im Optionsmenь aktivieren, aber falls du den Patch 'Spielzeitanzeige' benutzt, entferne diesen vorher(Data/ShowGameTime.vdf)";
        } else if (lang == 2) { // PL
			firstRunInfo = "SAIS ma teraz swуj wґasny zegar їwiata gry, ale jest on domyїlnie wyґЬczony. Mo»esz go aktywowaж w menu opcji, ale jeїli u»ywasz ґatki 'Show Game Time', najpierw jЬ usuс (Data/ShowGameTime.vdf)";
        } else if (lang == 3) { // RU
			firstRunInfo = "“ SAIS теперь есть собственные игровые мировые часы, но по умолчанию они отключены. ‚ы можете активировать его в меню параметров, но если вы используете патч 'Show Game Time', сначала удалите его (Data/ShowGameTime.vdf)";
        } else { // EN
			firstRunInfo = "SAIS now has its own game world clock, but this is deactivated by default. You can activate it in the options menu, but if you use the 'Show Game Time' patch, remove it first (Data/ShowGameTime.vdf)";
        };
    };
	Print(firstRunInfo);
};

/*func void SAISDebug(var string text, var int info) {
	print(ConcatStrings(text, IntToString(info)));
};*/
	