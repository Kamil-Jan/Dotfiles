//Modify this file to change what commands output to your statusbar, and recompile using the make command.
static const Block blocks[] = {
	/*Icon*/	/*Command*/		   /*Update Interval*/	/*Update Signal*/
    {"",        "sb-brightness",   0,                   12},
    {"",        "sb-volume",       0,                   10},
    {"",        "sb-xkeyboard",    0,                   7},
    {"",        "sb-cpu-usage",    10,                  14},
    {"",        "sb-temperature",  10,                  18},
    {"",        "sb-battery",      10,                  3},
    {"",        "sb-internet",     3,                   4},
    {"",        "sb-date",	       60,                  1},
};

//sets delimeter between status commands. NULL character ('\0') means no delimeter.
static char delim[] = " | ";
static unsigned int delimLen = 5;
