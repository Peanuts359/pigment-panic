if (!video_started) {
    // draw first frame as frozen splash (optional)
    draw_sprite(spr_firstframe, 0, 0, 0);
} else if (video_id != -1) {
    // get video draw info
    var video_data = video_draw();
    var video_status = video_data[0];
    var video_surface = video_data[1];

    if (video_status == 0) { 
        // draw fullscreen
        var sw = surface_get_width(video_surface);
        var sh = surface_get_height(video_surface);

        draw_surface_stretched(video_surface, 0, 0, display_get_width(), display_get_height());
    }
}
