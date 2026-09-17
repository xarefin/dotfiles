#!/usr/bin/env bash

# CPU Usage & Temp (Clean integers + units)
CPU_TEMP=$(sensors 2>/dev/null | grep -E 'Package id 0|Tctl|CPU' | awk '{print $4}' | tr -d '+°C' | awk '{print int($1)}' | head -n 1)
[ -z "$CPU_TEMP" ] && CPU_TEMP=0
CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print int(100 - $1)}')

# GPU Usage & Temp (Clean integers + units)
if command -v nvidia-smi &> /dev/null; then
    GPU_INFO=$(nvidia-smi --query-gpu=utilization.gpu,temperature.gpu --format=csv,noheader,nounits 2>/dev/null)
    GPU_USAGE=$(echo "$GPU_INFO" | awk -F', ' '{print int($1)}')
    GPU_TEMP=$(echo "$GPU_INFO" | awk -F', ' '{print int($2)}')
elif [ -d "/sys/class/drm/card0/device/hwmon" ]; then
    GPU_TEMP=$(cat /sys/class/drm/card0/device/hwmon/hwmon*/temp1_input 2>/dev/null | awk '{print int($1/1000)}')
    GPU_USAGE=0
else
    GPU_USAGE=0
    GPU_TEMP=0
fi

# RAM Usage (Clean integer % + units)
RAM_INFO=$(free -m | awk 'NR==2{printf "%dGB / %dGB (%d%%)", $3/1024, $2/1024, $3*100/$2}')

# Disk Usage (Clean integer % + units)
DISK_INFO=$(df -h / | awk 'NR==2{print $3 " / " $2 " (" int($5) "%)"}')

# Fan Speed
FAN_SPEED=$(sensors 2>/dev/null | grep -i 'fan' | awk '{print $2}' | head -n 1)
[ -z "$FAN_SPEED" ] && FAN_SPEED=0

# Network Speeds
IFACE=$(ip route | grep default | awk '{print $5}' | head -n 1)
if [ -n "$IFACE" ]; then
    R1=$(cat /sys/class/net/"$IFACE"/statistics/rx_bytes 2>/dev/null || echo 0)
    T1=$(cat /sys/class/net/"$IFACE"/statistics/tx_bytes 2>/dev/null || echo 0)
    sleep 1
    R2=$(cat /sys/class/net/"$IFACE"/statistics/rx_bytes 2>/dev/null || echo 0)
    T2=$(cat /sys/class/net/"$IFACE"/statistics/tx_bytes 2>/dev/null || echo 0)
    
    DOWN=$(( (R2 - R1) / 1024 ))
    UP=$(( (T2 - T1) / 1024 ))
    NET_STAT="󰕒 ${UP} KB/s  󰇚 ${DOWN} KB/s"
else
    NET_STAT="Disconnected"
fi

# JSON payload for Waybar
cat <<EOF
{"text": "󰟌 ${CPU_TEMP}°C", "tooltip": " CPU Usage: ${CPU_USAGE}%\n CPU Temp: ${CPU_TEMP}°C\n󰢮 GPU Usage: ${GPU_USAGE}%\n󰢮 GPU Temp: ${GPU_TEMP}°C\n󰍛 RAM: ${RAM_INFO}\n󰋊 Disk: ${DISK_INFO}\n󰈐 Fan Speed: ${FAN_SPEED} RPM\n󰛳 Network: ${NET_STAT}\n󰟌 Temp: ${CPU_TEMP}°C"}
EOF