////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//	All the Wld_*-Functions are taken from the diverse time scripts by Milky-Way from the WoG-Forum!
// 	https://forum.worldofplayers.de/forum/threads/752130-TIPP-Diverse-Zeit-Skripte?p=11760314&viewfull=1#post11760314
//	Changed script by Bloodfly91, optimized for "Ninja" by neocromicon
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

func int Ninja_ShowAlwaysImportantStats_FindMinute(var int Hour, var int From, var int Till) {
	if (From >= 60) {
		return -1;
	};
	if (Wld_IsTime(Hour,59,Hour+1,10)) {
		return 59;
	} else if (Wld_IsTime(Hour,58,Hour+1,10)) {
		return 58;
	} else if (Wld_IsTime(Hour,57,Hour+1,10)) {
		return 57;
	} else if (Wld_IsTime(Hour,From+1,Hour,Till)) {
		return Ninja_ShowAlwaysImportantStats_FindMinute(Hour,From+1,Till);
	} else {
		return From;
	};
};

func int Ninja_ShowAlwaysImportantStats_FindHour(var int From, var int Till) {
	if (Wld_IsTime(23,00,0,0)) {
		return 23;
	} else if (Wld_IsTime(22,55,23,10)) {
		return 22;
	} else if (From >= 24) {
		return -1;    
	} else if (Wld_IsTime(From+1,0,Till,0)) {
		return Ninja_ShowAlwaysImportantStats_FindHour(From+1,Till);
	} else {
		return From;
	};
};

func int Ninja_ShowAlwaysImportantStats_GetHour () {
	var int Hour; Hour = Ninja_ShowAlwaysImportantStats_FindHour(0,23);
	return Hour;
};

func int Ninja_ShowAlwaysImportantStats_GetMinute () {
	var int Minute; Minute = Ninja_ShowAlwaysImportantStats_FindMinute(Ninja_ShowAlwaysImportantStats_GetHour(),0,59);
	return Minute;
};

func int Ninja_ShowAlwaysImportantStats_GetTimeDay() {
	var int Day;
	var int Hour;
	var int Minute;
	
	Hour = Ninja_ShowAlwaysImportantStats_GetHour();
	Minute = Ninja_ShowAlwaysImportantStats_GetMinute();
	Day = Wld_GetDay ();
	
	var int time;
	time = Day * 10000 + Hour * 100 + Minute;
	return time;
};

Func string Ninja_ShowAlwaysImportantStats_PrintTimeDay (var int TimeFormatDhhmm) {
    const string textDay = "";
	
	if (Hlp_StrCmp(textDay, "")) { // This is only true first time
		var int lang; lang = Ninja_ShowAlwaysImportantStats_GuessLocalization();
		if (lang == 1) { // DE
			textDay = "Tag ";
		} else if (lang == 2) { // PL
			textDay = "Dzieñ ";
		} else if (lang == 3) { // RU
			textDay = "Äåíü ";
		} else { // EN
			textDay = "Day ";
		};
	};

	var int curDay;
	var int curHour;
	var int curMinute;
	
	curDay = TimeFormatDhhmm / 10000;
	
	curHour = TimeFormatDhhmm % 10000;
	curHour = curHour / 100;
	curMinute = TimeFormatDhhmm % 100;
	
	var string prntTimeDay;
	var string textDy;
	var string textHr;
	var string textMin;
	
	textDy = IntToString(curDay+1);
	textHr = IntToString(curHour);
	textMin = IntToString(curMinute);
	
	if (curHour < 10) {
		textHr = ConcatStrings ("0", textHr);
	};
	if (curMinute < 10) {
		textMin = ConcatStrings ("0", textMin);
	};
	
	prntTimeDay  = ConcatStrings (textDay, textDy);
	prntTimeDay  = ConcatStrings (prntTimeDay, " - ");
	prntTimeDay  = ConcatStrings (prntTimeDay, textHr);
	prntTimeDay  = ConcatStrings (prntTimeDay, ":");
	prntTimeDay  = ConcatStrings (prntTimeDay, textMin);

	return prntTimeDay;
};