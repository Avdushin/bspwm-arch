#!/bin/bash

MAC="6C:DD:BC:1E:BC:3E"

STATUS=$(bluetoothctl info "$MAC" 2>/dev/null)

# Функция для вычисления цвета по заряду (от красного к зелёному)
get_color() {
    local percentage=$1
    local red_start=211
    local green_start=95
    local blue_start=94

    local red_end=160
    local green_end=232
    local blue_end=162

    local r=$(( red_start + (red_end - red_start)*percentage/100 ))
    local g=$(( green_start + (green_end - green_start)*percentage/100 ))
    local b=$(( blue_start + (blue_end - blue_start)*percentage/100 ))

    printf "#%02x%02x%02x" $r $g $b
}

if echo "$STATUS" | grep -q "Connected: yes"; then
    BAT_HEX=$(echo "$STATUS" | grep "Battery Percentage" | awk '{print $3}')
    if [ -n "$BAT_HEX" ]; then
        BATTERY=$((BAT_HEX))
        COLOR=$(get_color $BATTERY)
        ICON_COLOR=$COLOR
        TEXT_COLOR=$COLOR
        echo "%{F$ICON_COLOR}%{F-} %{F$TEXT_COLOR}$BATTERY%%{F-}"
    else
        # Если заряд неизвестен, зелёный цвет для иконки и текста
        echo "%{F#a0e8a2}%{F-} %{F#a0e8a2}Connected%{F-}"
    fi
else
    # Если отключено, красный цвет и для иконки и для текста
    echo "%{F#d35f5e}%{F-} %{F#d35f5e}%{F-}"
fi

