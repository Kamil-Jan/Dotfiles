#!/usr/bin/env bash

error () {
    echo "$1" >&2
    echo "Exiting" >&2
    exit "$2"
}

show_info () {
    echo -e "copy_output - Copies output of a parsed command\n"
    echo -e "Usage: copy_output [-h] [-s \"command\"]\n"
    echo -e "Optional arguments:"
    echo -e "  -h, --help       Show this help message and exit"
    echo -e "  -s \"command\"     Copy output of given command"
}

while getopts ':-h' opt; do
    case $opt in
        h)
            show_info
            exit 0
            ;;
        :)
            error "Option -$OPTARG requires an argument." 2
            ;;
        \?)
            error "Invalid option: $OPTARG" 2
            exit 2
            ;;
    esac
done
shift $((OPTIND -1))

selected=$(cat ~/.cache/zsh/history | tail -100 | rofi -i -matching normal -dmenu -p "Select command")
[[ -n $selected ]] && eval "$selected" | xclip -selection c

