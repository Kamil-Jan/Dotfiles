#!/usr/bin/env bash

function setbg {
    echo $1
    cp $1 ~/.config/wall.webp
    DISPLAY=:0.0 feh --bg-scale ~/.config/wall.webp
    notify-send "wallpaper changed"
}

hour=$(date +%H)
time_of_day=$(sunwait poll 55.7558N 37.6173E)
[[ $time_of_day == "DAY" ]] && [ $hour -lt 12 ] && setbg $1
[ $hour -gt 11 ] && [ $hour -lt 15 ]            && setbg $2
[ $hour -gt 14 ] && [[ $time_of_day == "DAY" ]] && setbg $3
[[ $time_of_day == "NIGHT" ]]                   && setbg $4

