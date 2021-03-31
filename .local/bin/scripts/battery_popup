#!/usr/bin/env bash

error () {
    echo "$1" >&2
    echo "Exiting" >&2
    exit "$2"
}

while getopts 'L:d:m:t:D' opt; do
    case $opt in
        L)
            [[ $OPTARG =~ ^[0-9]+$ ]] || error "${opt}: ${OPTARG} is not a number" 2
            UPPER_LIMIT="${OPTARG}"
            ;;
        d)
            [[ $OPTARG =~ ^[0-9]+$ ]] || error "${opt}: ${OPTARG} is not a number" 2
            DELTA="${OPTARG}"
            ;;
        m)
            MESSAGE="${OPTARG}"
            ;;
        t)
            [[ $OPTARG =~ ^[0-9]+[ms]?$ ]] || error "${opt}: ${OPTARG} is not a valid period" 2
            SLEEP_TIME="${OPTARG}"
            ;;
        D)
            DEBUG="y"
            ;;
        :)
            error "Option -$OPTARG requires an argument." 2
            ;;
        \?)
            exit 2
            ;;
    esac
done

is_battery_discharging() {
    grep STATUS=Discharging "${BATTERIES[@]}" && return 0
    return 1
} >/dev/null

get_battery_perc() {
    grep CAPACITY= "${BATTERIES[@]}" | awk -F= '{ print $2 }'
}

show_notify() {
    GNOME_ICON="/usr/share/icons/gnome/scalable/status/battery-low-symbolic.svg"
    XFCE_ICON="/usr/share/icons/elementary-xfce/status/48/battery-low.png"

    if [[ -f $GNOME_ICON ]]; then
        NOTIFY_ICON="${GNOME_ICON}"
    elif [[ -f $XFCE_ICON ]]; then
        NOTIFY_ICON="${XFCE_ICON}"
    fi

    NOTIFY_OPT="-i ${NOTIFY_ICON}"
    notify-send -u critical "${1}" ${NOTIFY_OPT}
}

show_message() {
    if which notify-send; then
        show_notify "$1"
    fi
} >/dev/null

debug() {
    [[ -n $DEBUG ]] && echo "$1"
}

UPPER_LIMIT="${UPPER_LIMIT:-10}"
DELTA="${DELTA:-5}"
MESSAGE="${MESSAGE:-Warning: Battery is getting low}"
SLEEP_TIME="${SLEEP_TIME:-5m}"
BATTERIES=( /sys/class/power_supply/BAT1/uevent )

debug "Upper ${UPPER_LIMIT}; Delta ${DELTA}; sleep ${SLEEP_TIME}"
debug "Current: $(get_battery_perc)%"

LIMIT="${UPPER_LIMIT}"

while true; do
    debug "Checking.. "
    PERC=$(get_battery_perc)
    debug "PERC=${PERC}%"

    if is_battery_discharging; then
        debug "Battery is discharging"

        if [[ $PERC -le $LIMIT ]]; then
            debug "Showing warning"
            show_message "${MESSAGE}"
            if [[ $(($PERC % $DELTA)) -eq 0 ]]; then
                LIMIT=$(($PERC - $DELTA))
            else
                LIMIT=$(($PERC - ($PERC % $DELTA)))
            fi
        fi
    else
        LIMIT=${UPPER_LIMIT}
    fi

    debug "Sleeping $SLEEP_TIME; current limit ${LIMIT}%"
    sleep "${SLEEP_TIME}"
done

