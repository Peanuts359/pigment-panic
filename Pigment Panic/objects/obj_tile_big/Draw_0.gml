/// obj_tile_big : Draw
// Frame is already 128×128 (origin 0,0). Draw at 1×.
draw_self();

var sc = 2; // overlays are authored at 64×64 → scale them to 128×128

// ----- Fill (if any)
if (color_index != Color.NONE && fill_status > -1) {
    draw_sprite_ext(
        global.fills[fill_status],  // 64×64 fill sprite
        0,
        x, y,
        sc, sc,                      // <- scale overlays to 128×128
        0,
        make_color_rgb(
            global.Color_rgb[color_index][0],
            global.Color_rgb[color_index][1],
            global.Color_rgb[color_index][2]
        ),
        1
    );

    // Damage overlay (also 64×64) — scale to match
    if (tile_health < 0) {
        var scratch_col = make_color_rgb(1,1,1);
        if (color_index == Color.BLACK) scratch_col = make_color_rgb(255,255,255);
        draw_sprite_ext(spr_scratch, 0, x, y, sc, sc, 0, scratch_col, 0.5);
    }
}

// ----- Color symbol (64×64 glyphs) — scale to 128×128
draw_sprite_ext(
    spr_color_alphabet,
    2 * desired_color,              // your frame index logic
    x, y,
    sc, sc,                         // <- scale
    0,
    make_color_rgb(255, 255, 255),
    1
);
