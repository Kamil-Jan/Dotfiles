#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

. "$HOME/.xprofile"

[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources
#~/.config/dwm/startdwm.sh
exec bspwm

