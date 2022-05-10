
/* the rate at which the mouse moves in Hz
 * does not change its speed */
static const unsigned int move_rate = 50;

/* the default speed of the mouse pointer
 * in pixels per second */
static const unsigned int default_speed = 500;

/* changes the speed of the mouse pointer */
static SpeedBinding speed_bindings[] = {
    /* key             speed */  
    { XK_Shift_L,      2000 },
    { XK_Control_L,    1000 },
    { XK_space,        100  },
    { XK_o,            1000 },
    { XK_apostrophe,   2000 },
};

/* moves the mouse pointer
 * you can also add any other direction (e.g. diagonals) */
static MoveBinding move_bindings[] = {
    /* key         x      y */
    { XK_h,        -1,     0 },
    { XK_l,         1,     0 },
    { XK_k,         0,    -1 },
    { XK_j,         0,     1 },
    { XK_a,        -1,     0 },
    { XK_s,         1,     0 },
    { XK_w,         0,    -1 },
    { XK_r,         0,     1 },
};

/* 1: left
 * 2: middle
 * 3: right */
static ClickBinding click_bindings[] = {
    /* key         button */  
    { XK_n,        1 },
    { XK_e,        3 },
    { XK_i,        2 },
    { XK_f,        1 },
    { XK_q,        3 },
    { XK_p,        2 },
};

/* scrolls up, down, left and right
 * a higher value scrolls faster */
static ScrollBinding scroll_bindings[] = {
    /* key        x      y */
    { XK_y,        0 ,    25 },
    { XK_semicolon,        0 ,   -25 },
    { XK_d,        0 ,    80 },
    { XK_u,        0 ,   -80 },
    { XK_comma,   -25,    0  },
    { XK_period,   25,    0  },
};

/* executes shell commands */
static ShellBinding shell_bindings[] = {
    /* key         command */  
    { XK_g,        "xdotool mousedown 1" },
    { XK_t,        "xdotool mouseup 1" },
};

/* exits on key release which allows click and exit with one key */
static KeySym exit_keys[] = {
    XK_Escape, XK_backslash
};
