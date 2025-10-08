function room_to_gui(_x, _y) {
    var cam = view_camera[0];
    var vx = camera_get_view_x(cam), vy = camera_get_view_y(cam);
    var vw = camera_get_view_width(cam), vh = camera_get_view_height(cam);
    var gw = display_get_gui_width(),  gh = display_get_gui_height();
    return [ (_x - vx) * (gw / vw), (_y - vy) * (gh / vh) ];
}

function sprite_center_room(_inst) {
    var w = sprite_get_width(_inst.sprite_index)  * abs(_inst.image_xscale);
    var h = sprite_get_height(_inst.sprite_index) * abs(_inst.image_yscale);
    var cx = _inst.x - _inst.sprite_xoffset * _inst.image_xscale + w * 0.5;
    var cy = _inst.y - _inst.sprite_yoffset * _inst.image_yscale + h * 0.5;
    return [cx, cy];
}