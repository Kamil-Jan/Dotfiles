#!/usr/bin/env bash

declare options=(
"alacritty
bspwm
dunst
i3
neovim
polybar
ranger
sxhkd
zsh
aliases
xinitrc
xprofile
xresources
zprofile
quit"
)

choice=$(echo -e "${options[@]}" | dmenu -nb '#282828' -fn '#ebdbb2' -sb '#af3a03' -p 'Edit config file: ')

case "$choice" in
	quit)
		echo "Program terminated." && exit 1
	;;
	alacritty)
		choice="$HOME/.config/alacritty/alacritty.yml"
    ;;
    bspwm)
        choice="$HOME/.config/bspwm/bspwmrc"
	;;
	dunst)
		choice="$HOME/.config/dunst/dunstrc"
	;;
	i3)
		choice="$HOME/.config/i3/config"
	;;
	neovim)
		choice="$HOME/.config/nvim/init.vim"
	;;
	polybar)
		choice="$HOME/.config/polybar/config"
	;;
    ranger)
        choice="$HOME/.config/ranger/rc.conf"
    ;;
    sxhkd)
        choice="$HOME/.config/sxhkd/sxhkdrc"
    ;;
	zsh)
		choice="$HOME/.config/zsh/.zshrc"
	;;
    aliases)
        choice="$HOME/.config/.aliases"
    ;;
    xinitrc)
        choice="$HOME/.xinitrc"
    ;;
    xprofile)
        choice="$HOME/.xprofile"
    ;;
    xresources)
        choice="$HOME/.Xresources"
    ;;
    zprofile)
        choice="$HOME/.zprofile"
    ;;
	*)
		exit 1
	;;
esac

alacritty -e sh -c "sleep 0.1 && nvim $choice"

