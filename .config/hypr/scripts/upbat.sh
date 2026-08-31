#!/bin/bash

# Find the main AC adapter and battery dynamically
AC_PATH=$(ls -d /sys/class/power_supply/AC* /sys/class/power_supply/ADP* 2>/dev/null | head -n 1)
BAT_PATH=$(ls -d /sys/class/power_supply/BAT* 2>/dev/null | head -n 1)

send_notif() {
    local title="$1"
    local message="$2"
    local urgency="$3"
    notify-send -u "$urgency" -i battery -a "Battery Monitor" "$title" "$message"
}

get_power_state() {
    if [ -f "$AC_PATH/online" ]; then
        cat "$AC_PATH/online" # Returns 1 if plugged in, 0 if unplugged
    else
        # Fallback to acpi if sysfs path isn't found
        acpi -a | grep -q "on-line" && echo "1" || echo "0"
    fi
}

get_battery_pct() {
    if [ -f "$BAT_PATH/capacity" ]; then
        cat "$BAT_PATH/capacity"
    else
        acpi -b | grep -P -o '[0-9]+(?=%)' | head -n 1
    fi
}

get_time_remaining() {
    acpi -b | awk -F, '{print $3}' | xargs
}

previous_state=$(get_power_state)
previous_pct=$(get_battery_pct)

while true; do
    current_state=$(get_power_state)
    current_pct=$(get_battery_pct)
    time_info=$(get_time_remaining)

    # 1. Detect Power State Change (1 = Plugged, 0 = Unplugged)
    if [ "$current_state" != "$previous_state" ]; then
        if [ "$current_state" -eq 1 ]; then
            send_notif "󱐋 Power Connected" "Charging ${current_pct}%" "normal"
        else
            send_notif $'\uef0e Power Disconnected' "Discharging ${current_pct}%" "normal"
        fi
        previous_state="$current_state"
    fi

    # 2. Critical Low Battery Warning exclusively at 10%
    if [ "$current_state" -eq 0 ]; then
        if [ "$current_pct" -le 10 ] && [ "$previous_pct" -gt 10 ]; then
            send_notif "󰂃 Low Battery" "Battery dropped to 10%. Connect your charger immediately!\n$time_info" "critical"
        fi
    fi

    previous_pct="$current_pct"
    sleep 2
done