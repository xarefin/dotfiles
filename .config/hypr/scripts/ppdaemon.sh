#!/bin/bash

# Fetch current profile
current=$(powerprofilesctl get)

# Cycle profiles and trigger styled notifications
if [ "$current" = "performance" ]; then
    powerprofilesctl set balanced
    notify-send -u low -t 2000 "󰾆  Power Profile" "Switched to <b>Balanced</b> Mode" -h string:x-canonical-private-synchronous:power
elif [ "$current" = "balanced" ]; then
    powerprofilesctl set power-saver
    notify-send -u low -t 2000 "󰌪  Power Profile" "Switched to <b>Power Saver</b> Mode" -h string:x-canonical-private-synchronous:power
else
    powerprofilesctl set performance
    notify-send -u normal -t 2000 "󰓅  Power Profile" "Switched to <b>Performance</b> Mode" -h string:x-canonical-private-synchronous:power
fi