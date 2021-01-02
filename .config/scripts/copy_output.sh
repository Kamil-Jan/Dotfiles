#!/usr/bin/env bash

selected=$(cat ~/.cache/zsh/history | tail -100 | rofi -i -matching normal -dmenu -p "Select command")
[[ -n $selected ]] && eval "$selected" | xclip -selection c

