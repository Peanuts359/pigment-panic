switch(room) {
    case rm_lv_base:
        play_music(snd_level_1);
        break;
    case rm_splash:
        play_music(snd_menu_music);
        break;
	case rm_lv_two_mix:
        play_music(snd_level_2);
        break;
	case rm_lv_three_mix:
        play_music(snd_level_3);
        break;
    case rm_level_select:
        play_music(snd_menu_music);
        break;
	case rm_lv_four:
		play_music(snd_level_4);
        break;
	case rm_lv_five:
		play_music(snd_level_5);
        break;
}