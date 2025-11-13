// ignore if a dialog is already active
if (global.forfeit_dialog != -1) exit;

// open confirmation dialog
global.forfeit_dialog = show_question_async("Forfeit the level?");
