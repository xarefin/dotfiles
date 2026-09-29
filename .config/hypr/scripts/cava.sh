#!/bin/bash

bar="▁▂▃▄▅▆▇█"
dict="s/;//g"

bar_length=${#bar}
for ((i = 0; i < bar_length; i++)); do
    dict+=";s/$i/${bar:$i:1}/g"
done

config_file="/tmp/bar_cava_config"
cat >"$config_file" <<EOF
[general]
framerate = 30
bars = 16

[input]
method = pulse
source = auto

[output]
method = raw
raw_target = /dev/stdout
data_format = ascii
ascii_max_range = 7
EOF

# Ensure cleanup when Waybar restarts/kills this script
trap 'pkill -P $$; exit' EXIT INT TERM

# Function to check player status
is_playing() {
    status=$(playerctl status 2>/dev/null)
    [ "$status" = "Playing" ]
}

# Stream CAVA output line-by-line while checking player state
cava -p "$config_file" | sed -u "$dict" | while read -r line; do
    if is_playing; then
        echo "$line"
    else
        echo ""
    fi
done
