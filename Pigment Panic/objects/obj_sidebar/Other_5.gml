global.grade = grade(global.lv_name, global.time_left, global.mistakes);

if (is_popup_needed(global.lv_name) && !global.LevelTutorialSeen[global.lv_name]) {
        global.LevelTutorialSeen[global.lv_name] = true;
}
