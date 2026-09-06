#!/usr/bin/env bash
pids=$(hyprctl clients -j | jq -r '.[].pid')
for pid in $pids; do
kill -15 "$pid"
done

#imposter
pkill -15 spotify