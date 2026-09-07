#!/usr/bin/env bash
workspace_name=$(hyprctl activeworkspace -j | jq -r '.name')
state_file="/tmp/hypr_layout_$workspace_name"

if [ -f "$state_file" ]; then
    current=$(cat "$state_file")
else
    current="dwindle"
fi

if [ "$current" = "dwindle" ]; then
    target="scrolling"
else
    target="dwindle"
fi

echo "$target" > "$state_file"
hyprctl keyword workspace "name:$workspace_name, layout:$target"