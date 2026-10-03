#!/usr/bin/env bash

# Select region
SELECTION=$(slurp 2>/dev/null)
if [ -z "$SELECTION" ]; then
    exit 0
fi

# Capture & decode QR code, trimming trailing newlines/spaces
QR=$(grim -g "$SELECTION" - | zbarimg --raw - 2>/dev/null | xargs)

if [ -n "$QR" ]; then
    # Copy extracted text to clipboard
    echo -n "$QR" | wl-copy
    notify-send "📷 QR Code Scanned" "$QR"
    
    # Check if it's already a full URL with scheme
    if [[ "$QR" =~ ^https?:// ]]; then
        xdg-open "$QR"
    # Check if it starts with www. or looks like a plain domain (e.g., facebook.com)
    elif [[ "$QR" =~ ^www\. ]] || [[ "$QR" =~ ^[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}(/.*)?$ ]]; then
        xdg-open "https://$QR"
    fi
else
    notify-send "QR Code Scanner" "No QR code detected"
fi
