/*
 * Function to hide text in menus and dialogs
 */
func void Ninja_ShowAlwaysImportantStats_HideText(var int view) {
    // Let me remove myself, if the handle is no longer valid
    if (!Hlp_IsValidHandle(view)) {
        FF_RemoveData(Ninja_ShowAlwaysImportantStats_HideText, view);
    };
    if (_Bar_PlayerStatus() || !InfoManager_HasFinished()) {
        View_Open(view);
	} else {
        View_Close(view);
    };
};
