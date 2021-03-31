#!/usr/bin/env bash

function setbg {
    image="$dir/$1"
    DISPLAY=:0.0 feh --bg-scale $image
    notify-send "wallpaper changed"
}

images=($1/*)
hour=$(date +%H)
time_of_day=$(sunwait poll 55.7558N 37.6173E)
[[ $time_of_day == "DAY" ]] && [ $hour -lt 12 ] && setbg ${images[0]}
[ $hour -gt 11 ] && [ $hour -lt 15 ]            && setbg ${images[1]}
[ $hour -gt 14 ] && [[ $time_of_day == "DAY" ]] && setbg ${images[2]}
[[ $time_of_day == "NIGHT" ]]                   && setbg ${images[3]}

