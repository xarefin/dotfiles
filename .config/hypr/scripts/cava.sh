#!/usr/bin/env bash

# ── Set up permanent config (once) ────────────────────────────────
CONFIG_FILE="/tmp/waybar_cava_config"
if [[ ! -f "$CONFIG_FILE" ]]; then
    cat > "$CONFIG_FILE" <<'EOF'
[general]
bars = 16

[output]
method = raw
raw_target = /dev/stdout
data_format = ascii
ascii_max_range = 7

[smoothing]
integral = 77
monstercat = 0
waves = 0
EOF
fi

# ── Block characters (index = value 0–7) ─────────────────────────
dict=(" " "▂" "▃" "▄" "▅" "▆" "▇" "█")

# Ensure cava is killed if the script exits
trap "pkill -f 'cava -p $CONFIG_FILE'; exit" INT TERM EXIT

# ── Main loop using process substitution to avoid subshell locks ───
while true; do
    if [[ "$(playerctl status 2>/dev/null)" == "Playing" ]]; then
        while IFS= read -r line; do
            if [[ "$(playerctl status 2>/dev/null)" != "Playing" ]]; then
                break
            fi
            
            output=""
            for (( i=0; i<${#line}; i++ )); do
                char="${line:$i:1}"
                if [[ "$char" =~ ^[0-7]$ ]]; then
                    output+="${dict[$char]}"
                fi
            done
            printf "%s\n" "$output"
        done < <(stdbuf -oL cava -p "$CONFIG_FILE")
        
        pkill -f "cava -p $CONFIG_FILE" 2>/dev/null
    else
        echo ""
        sleep 1
    fi
done