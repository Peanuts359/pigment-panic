if (video_started && video_id != -1) {
    var video_data = video_draw();
    var video_status = video_data[0];

    // 0 = playing, 1 = finished, -1 = error
    if (video_status != 0) {
        video_close();
        room_goto_next();
    }
}
