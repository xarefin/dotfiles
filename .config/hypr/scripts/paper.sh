#!/bin/bash

WALLPAPER_DIR="$HOME/Pictures/Wallpapers"
LOG_FILE="$HOME/.cache/matugen_error.log"

# Function to log custom error messages with timestamps
log_err() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] ERROR: $1" >> "$LOG_FILE"
}

# Safe color application
apply_colors() {
    local image_path="$1"
    
    # Safely terminate previous runs without corrupting color files
    pkill -15 -x matugen 2>/dev/null
    sleep 0.2

    # Run matugen and capture any errors to the log file
    if ! matugen image "$image_path" --source-color-index 0 >> "$LOG_FILE" 2>&1; then
        sleep 0.3
        if ! matugen image "$image_path" --source-color-index 0 >> "$LOG_FILE" 2>&1; then
            log_err "Matugen failed twice for image: $image_path"
        fi
    fi
}

# When Rofi initializes
if [ -z "$ROFI_RETV" ] || [ "$ROFI_RETV" -eq 0 ]; then
    if [ ! -d "$WALLPAPER_DIR" ]; then
        log_err "Wallpaper directory not found: $WALLPAPER_DIR"
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
            awww-daemon >> "$LOG_FILE" 2>&1 &
            sleep 0.2
        fi

        # Set wallpaper in background
        awww img "$image_path" \
            --transition-type any \
            --transition-pos 0.5,0.5 \
            --transition-step 30 \
            --transition-fps 144 \
            --transition-duration 2.5 >> "$LOG_FILE" 2>&1 &

        # Copy image in background
        cp "$image_path" "$HOME/.cache/log.png" >> "$LOG_FILE" 2>&1 &

        # Run color update detached (logging stdout/stderr instead of suppressing with /dev/null)
        ( apply_colors "$image_path" ) >> "$LOG_FILE" 2>&1 &
        disown
    else
        log_err "Selected image path does not exist: $image_path"
    fi
fi