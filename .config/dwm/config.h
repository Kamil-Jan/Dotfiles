/* See LICENSE file for copyright and license details. */

#define TERMINAL "st"

/* appearance */
static const unsigned int borderpx  = 2;        /* border pixel of windows */
static const unsigned int snap      = 32;       /* snap pixel */
static const unsigned int gappih    = 15;       /* horiz inner gap between windows */
static const unsigned int gappiv    = 15;       /* vert inner gap between windows */
static const unsigned int gappoh    = 15;       /* horiz outer gap between windows and screen edge */
static const unsigned int gappov    = 15;       /* vert outer gap between windows and screen edge */
static       int smartgaps          = 0;        /* 1 means no outer gap when there is only one window */
static const int showbar            = 1;        /* 0 means no bar */
static const int topbar             = 1;        /* 0 means bottom bar */
static const char *fonts[]          = {
    "Caskaydia Cove Nerd Font:size=12:antialias=true:autohint=true",
    "JoyPixels:pixelsize=12:antialias=true:autohint=true"
    "FontAwesome5Free:style=Solid:pixelsize=12:antialias=true;1"
};

// Everforest
static const char normbgcolor[]     = "#2f383e";
static const char normbordercolor[] = "#868d80";
static const char normfgcolor[]     = "#d8caac";
static const char selfgcolor[]      = "#2f383e";
static const char selbgcolor[]      = "#a7c080";
static const char selbordercolor[]  = "#a7c080";

// Gruvbox
//static const char normbgcolor[]     = "#282828";
//static const char normbordercolor[] = "#3c3836";
//static const char normfgcolor[]     = "#ebdbb2";
//static const char selfgcolor[]      = "#282828";
//static const char selbgcolor[]      = "#fe8019";
//static const char selbordercolor[]  = "#fe8019";
static const char *colors[][3]      = {
	/*               fg         bg         border   */
	[SchemeNorm] = { normfgcolor, normbgcolor, normbordercolor },
	[SchemeSel]  = { selfgcolor,  selbgcolor,  selbordercolor  },
};

/* tagging */
static const char *tags[] = { "1", "2", "3", "4", "5", "6", "7", "8", "9" };

static const Rule rules[] = {
	/* xprop(1):
	 *	WM_CLASS(STRING) = instance, class
	 *	WM_NAME(STRING) = title
	 */
	/* class                   instance    title       tags mask     isfloating   monitor */
	{ "Gimp",                  NULL,       NULL,       0,            1,           -1 },
	{ "SimpleScreenRecorder",  NULL,       NULL,       0,            1,           -1 }
};

/* layout(s) */
static const float mfact     = 0.5; /* factor of master area size [0.05..0.95] */
static const int nmaster     = 1;    /* number of clients in master area */
static const int resizehints = 1;    /* 1 means respect size hints in tiled resizals */

#define FORCE_VSPLIT 1  /* nrowgrid layout: force two clients to always split vertically */
#include "vanitygaps.c"

static const Layout layouts[] = {
	/* symbol     arrange function */
 	{ "[]=",	tile },			/* Default: Master on left, slaves on right */
	{ "TTT",	bstack },		/* Master on top, slaves on bottom */

	{ "[@]",	spiral },		/* Fibonacci spiral */
	{ "[\\]",	dwindle },		/* Decreasing in size right and leftward */

 	{ "[M]",	monocle },		/* All windows on top of eachother */
	{ "[D]",	deck },			/* Master on left, slaves in monocle-like mode on right */

	{ "|M|",	centeredmaster },		/* Master in middle, slaves on sides */
	{ ">M>",	centeredfloatingmaster },	/* Same but master floats */

	{ "><>",	NULL },			/* no layout function means floating behavior */
	{ NULL,		NULL },
};

/* key definitions */
#define MODKEY Mod4Mask
#define TAGKEYS(KEY,TAG) \
	{ MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
	{ MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

/* commands */
static const char *termcmd[]  = { TERMINAL, NULL };

#include <X11/XF86keysym.h>

static Key keys[] = {
	/* modifier                     key        function        argument */
	{ MODKEY,                       XK_q,      killclient,     {0} },
	{ MODKEY|ShiftMask,             XK_q,      spawn,          SHCMD("killall xinit") },
	{ MODKEY|ShiftMask,             XK_r,      quit,           {0} },
	{ MODKEY,                       XK_e,      spawn,          SHCMD("dmenuunicode") },
	{ MODKEY,			            XK_t,	   setlayout,	   {.v = &layouts[0]} }, /* tile */
	{ MODKEY|ShiftMask,		        XK_t,	   setlayout,	   {.v = &layouts[1]} }, /* bstack */
	{ MODKEY,			            XK_y,	   setlayout,	   {.v = &layouts[2]} }, /* spiral */
	{ MODKEY|ShiftMask,		        XK_y,	   setlayout,	   {.v = &layouts[3]} }, /* dwindle */
	{ MODKEY,			            XK_u,	   setlayout,	   {.v = &layouts[4]} }, /* monocle */
	{ MODKEY|ShiftMask,		        XK_u,	   setlayout,	   {.v = &layouts[5]} }, /* deck */
	{ MODKEY,			            XK_i,	   setlayout,	   {.v = &layouts[6]} }, /* centeredmaster */
	{ MODKEY|ShiftMask,		        XK_i,	   setlayout,	   {.v = &layouts[7]} }, /* centeredfloatingmaster */
	{ MODKEY,                       XK_Tab,    view,           {0} },
	{ MODKEY,                       XK_d,      spawn,          SHCMD("dmenu_run") },
	{ MODKEY,                       XK_f,      togglefullscr,  {0} },
	{ MODKEY,                       XK_h,      setmfact,       {.f = -0.05} },
	{ MODKEY,                       XK_l,      setmfact,       {.f = +0.05} },
	{ MODKEY,                       XK_j,      focusstack,     {.i = +1 } },
	{ MODKEY,                       XK_k,      focusstack,     {.i = -1 } },
	{ MODKEY,                       XK_Return, spawn,          {.v = termcmd } },
	{ MODKEY,                       XK_c,      spawn,          SHCMD("edit-configs") },
	{ MODKEY,                       XK_v,      focusmaster,    {0} },
	{ MODKEY,                       XK_b,      spawn,          SHCMD("firefox") },
	{ MODKEY|ShiftMask,             XK_b,      togglebar,      {0} },
	{ MODKEY,                       XK_m,      spawn,          SHCMD("telegram-desktop") },
	{ MODKEY,                       XK_comma,  focusmon,       {.i = -1 } },
	{ MODKEY|ShiftMask,             XK_comma,  tagmon,         {.i = -1 } },
	{ MODKEY,                       XK_period, focusmon,       {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_period, tagmon,         {.i = +1 } },
	{ MODKEY,                       XK_space,  zoom,           {0} },
	{ MODKEY|ShiftMask,             XK_space,  togglefloating, {0} },
	{ MODKEY,                       XK_0,      view,           {.ui = ~0 } },
	{ MODKEY|ShiftMask,             XK_0,      tag,            {.ui = ~0 } },
    { MODKEY,                       XK_F1,     spawn,          SHCMD("betterlockscreen -l dim") },
    { ShiftMask,                    XK_Escape, spawn,          SHCMD("xkb-switch -n; kill -41 $(pidof dwmblocks)") },
	{ 0, XF86XK_AudioMute,		    spawn,	   SHCMD("pactl set-sink-mute @DEFAULT_SINK@ toggle; kill -44 $(pidof dwmblocks)") },
	{ 0, XF86XK_AudioRaiseVolume,	spawn,	   SHCMD("pactl set-sink-volume @DEFAULT_SINK@ +5%; kill -44 $(pidof dwmblocks)") },
	{ 0, XF86XK_AudioLowerVolume,	spawn,	   SHCMD("pactl set-sink-volume @DEFAULT_SINK@ -5%; kill -44 $(pidof dwmblocks)") },
	{ 0, XF86XK_MonBrightnessUp,	spawn,	   SHCMD("light -A 5; kill -46 $(pidof dwmblocks)") },
	{ 0, XF86XK_MonBrightnessDown,	spawn,	   SHCMD("light -U 5; kill -46 $(pidof dwmblocks)") },
	{ 0, XK_Print,	                spawn,	   SHCMD("scrot /tmp/screenshot-$(date +%F_%T).png -e 'xclip -selection c -t image/png < $f'") },
	{ ShiftMask, XK_Print,	        spawn,	   SHCMD("scrot -s /tmp/screenshot-$(date +%F_%T).png -e 'xclip -selection c -t image/png < $f'") },
	{ ControlMask, XK_Print,	    spawn,	   SHCMD("scrot /tmp/screenshot-$(date +%F_%T).png -u -e 'xclip -selection c -t image/png < $f'") },
	TAGKEYS(                        XK_1,                      0)
	TAGKEYS(                        XK_2,                      1)
	TAGKEYS(                        XK_3,                      2)
	TAGKEYS(                        XK_4,                      3)
	TAGKEYS(                        XK_5,                      4)
	TAGKEYS(                        XK_6,                      5)
	TAGKEYS(                        XK_7,                      6)
	TAGKEYS(                        XK_8,                      7)
	TAGKEYS(                        XK_9,                      8)
};

/* button definitions */
/* click can be ClkTagBar, ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static Button buttons[] = {
	/* click                event mask      button          function        argument */
#ifndef __OpenBSD__
	{ ClkWinTitle,          0,              Button2,        zoom,           {0} },
	{ ClkStatusText,        0,              Button1,        sigdwmblocks,   {.i = 1} },
	{ ClkStatusText,        0,              Button2,        sigdwmblocks,   {.i = 2} },
	{ ClkStatusText,        0,              Button3,        sigdwmblocks,   {.i = 3} },
	{ ClkStatusText,        0,              Button4,        sigdwmblocks,   {.i = 4} },
	{ ClkStatusText,        0,              Button5,        sigdwmblocks,   {.i = 5} },
	{ ClkStatusText,        ShiftMask,      Button1,        sigdwmblocks,   {.i = 6} },
#endif
	{ ClkLtSymbol,          0,              Button1,        setlayout,      {0} },
	{ ClkLtSymbol,          0,              Button3,        setlayout,      {.v = &layouts[2]} },
	{ ClkWinTitle,          0,              Button2,        zoom,           {0} },
	{ ClkStatusText,        0,              Button2,        spawn,          {.v = termcmd } },
	{ ClkClientWin,         MODKEY,         Button1,        movemouse,      {0} },
	{ ClkClientWin,         MODKEY,         Button2,        togglefloating, {0} },
	{ ClkClientWin,         MODKEY,         Button3,        resizemouse,    {0} },
	{ ClkTagBar,            0,              Button1,        view,           {0} },
	{ ClkTagBar,            0,              Button3,        toggleview,     {0} },
	{ ClkTagBar,            MODKEY,         Button1,        tag,            {0} },
	{ ClkTagBar,            MODKEY,         Button3,        toggletag,      {0} },
};

