audio_play_sound(snd_menu_music, 10, true)

function play_music(new_music) {
    if (current_music != new_music) {
        if (audio_is_playing(current_music)) {
            audio_stop_sound(current_music);
        }
        current_music = new_music;
        audio_play_sound(current_music, 10, true); // 10 is the priority, true makes it loop
    }
}