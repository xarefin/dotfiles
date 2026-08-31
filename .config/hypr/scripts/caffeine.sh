#!/usr/bin/env bash

if pgrep -x "hypridle" > /dev/null; then
    pkill -x hypridle
    notify-send -u low -t 2000 "󰅶 Caffeine" "<b>Status:</b> Enabled\n<i>Screen idle disabled</i>"
else
    nohup hypridle >/dev/null 2>&1 &
    disown
    notify-send -u low -t 2000 "󰅶 Caffeine" "<b>Status:</b> Disabled\n<i>Screen idle active</i>"
fi