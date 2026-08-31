#!/bin/bash

iDIR="$HOME/.config/swaync/icons"
step=1  # INCREASE/DECREASE BY THIS VALUE

# Get brightness percentage
get_backlight() {
    brightnessctl -m | cut -d, -f4 | sed 's/%//'
}

# Get icons based on current brightness
get_icon() {
    current=$(get_backlight)
    if   [ "$current" -le "20" ]; then
        icon="$iDIR/brightness-20.png"
    elif [ "$current" -le "40" ]; then
        icon="$iDIR/brightness-40.png"
    elif [ "$current" -le "60" ]; then
        icon="$iDIR/brightness-60.png"
    elif [ "$current" -le "80" ]; then
        icon="$iDIR/brightness-80.png"
    else
        icon="$iDIR/brightness-100.png"
    fi
}

# Send desktop notification via dunst / mako / swaync
notify_user() {
    current=$(get_backlight)
    get_icon
    notify-send -e -h string:x-canonical-private-synchronous:brightness_notif -h int:value:$current -u low -i "$icon" "Screen" "Brightness: ${current}%"
}

# Change brightness
case "$1" in
    "--get")
        get_backlight
        ;;
    "--inc")
        brightnessctl set "${step}%+"
        notify_user
        ;;
    "--dec")
        brightnessctl set "${step}%-"
        notify_user
        ;;
    *)
        get_backlight
        ;;
esac