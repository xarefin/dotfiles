#!/usr/bin/env bash

case "$1" in
    "paste")
        selected=$(cliphist list | rofi -dmenu -display-columns 2 -p "Clipboard")
        if [ -n "$selected" ]; then
            echo "$selected" | cliphist decode | wl-copy
            sleep 0.1
            ydotool key 29:1 47:1 47:0 29:0 # Simulates Ctrl+V (Left Ctrl down, V down, V up, Left Ctrl up)
        fi
        ;;
    "wipe")
        cliphist wipe
        notify-send -i edit-clear "Clipboard Cleared" "All history has been wiped" -t 2000
        ;;
    "delete")
        cliphist list | head -n 1 | cliphist delete
        wl-copy --clear
        notify-send -i edit-delete "Clipboard Item Deleted" "Latest item removed from history" -t 2000
        ;;
esac