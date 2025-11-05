/// obj_creds : Create

// --- layout knobs ---
margin_l   = 64;       // left margin inside the 1792 panel
margin_r   = 64;       // right margin
row_gap    = 28;       // vertical spacing between rows
below_pad  = 24;       // gap below the header
panel_w    = 1792;     // header art width
panel_x0   = -panel_w * 0.5; // left edge relative to bottom-middle origin

// optional fonts (keep -1 to use default)
font_role  = -1;
font_name  = -1;

// colors
col_role   = make_color_rgb(26,31,50); // dark navy-ish
col_name   = c_black;
col_bg     = make_color_rgb(230,230,230); // light card (optional)
col_frame  = make_color_rgb(200,200,200);

// --- data ---
roles = [
    "PROGRAMMING",
    "GAME DESIGN",
    "ART DESIGN",
    "SOUND, MUSIC",
    "QA TESTER",
    "PRODUCER"
];

// each entry can be a string or an array of strings
names = [
    "Aaron, Edwin",
    "Yu Peng, Gia",
    "Edwin, Gia",
    "Edwin",
    "Jie Hui",
    "Jie Hui"
];

footer_txt = "This game was produced as part of class NM4260 Semester 1 25/26";

// blinking prompt
prompt_txt   = "Click or press any key to go back";
prompt_phase = 0;

// where to return; set this before entering credits if you like
if (!variable_global_exists("return_room")) global.return_room = rm_start;