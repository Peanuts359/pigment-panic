if (!video_started) {
    video_started = true;

    video_id = video_open("splash.webm");

    video_enable_loop(false);
}


//room_goto_next();