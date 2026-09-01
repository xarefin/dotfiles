#!/bin/bash

WALLPAPER_DIR="$HOME/Pictures/Wallpapers"

# Safe color application
apply_colors() {
    local image_path="$1"
    
    # Safely terminate previous runs without corrupting color files
    pkill -15 -x matugen 2>/dev/null
    sleep 0.2

    # Run matugen silently without capturing output
    if ! matugen image "$image_path" --source-color-index 0 >/dev/null 2>&1; then
        sleep 0.3
        matugen image "$image_path" --source-color-index 0 >/dev/null 2>&1
    fi
}

# When Rofi initializes
if [ -z "$ROFI_RETV" ] || [ "$ROFI_RETV" -eq 0 ]; then
    if [ ! -d "$WALLPAPER_DIR" ]; then
        exit 1
    fi

    find "$WALLPAPER_DIR" -maxdepth 1 -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.webp" \) | while read -r filepath; do
        filename=$(basename "$filepath")
        echo -en "${filename}\0icon\x1f${filepath}\n"
    done
    exit 0
fi

# When an item is selected
if [ "$ROFI_RETV" -eq 1 ] && [ -n "$1" ]; then
    image_path="$WALLPAPER_DIR/$1"

    if [ -f "$image_path" ]; then
        # Ensure awww daemon is running
        if ! awww query &>/dev/null; then
            awww-daemon >/dev/null 2>&1 &
            sleep 0.2
        fi

        # Set wallpaper in background silently
        awww img "$image_path" \
            --transition-type any \
            --transition-pos 0.5,0.5 \
            --transition-step 30 \
            --transition-fps 144 \
            --transition-duration 2.5 >/dev/null 2>&1 &

        # Copy image in background silently
        cp "$image_path" "$HOME/.cache/log.png" >/dev/null 2>&1 &

        # Run color update detached completely discarding output
        ( apply_colors "$image_path" ) >/dev/null 2>&1 &
        disown
    fi
fi