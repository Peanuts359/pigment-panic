hint_lv     = global.lv_name;
hint_sprite = get_hint(hint_lv); // or whatever your function is called

if !is_popup_needed(hint_lv) || global.LevelTutorialSeen[hint_lv] {
	instance_destroy();
	exit;
}

if global.LevelTutorialSeen[hint_lv] exit;
global.tutorial_active = true;