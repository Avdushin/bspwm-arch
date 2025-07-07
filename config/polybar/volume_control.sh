#!/bin/bash

# Найти индекс sink-input с воспроизведением
sink_input_index=$(pactl list sink-inputs short | head -n1 | awk '{print $1}')

if [ -n "$sink_input_index" ]; then
    sink=$(pactl list sink-inputs | grep -A 10 "index: $sink_input_index" | grep 'Sink:' | awk '{print $2}')
fi

if [ -z "$sink" ]; then
    # Попытаться получить Default Sink
    sink=$(pactl info | grep 'Default Sink' | awk '{print $3}')
fi

if [ -z "$sink" ]; then
    # Если дефолтного нет — взять первый RUNNING sink
    sink=$(pactl list sinks short | grep RUNNING | head -n1 | awk '{print $2}')
fi

if [ -z "$sink" ]; then
    echo ""
    exit 1
fi

vol=$(pactl get-sink-volume "$sink" 2>/dev/null | grep -oP '\d+%' | head -1 | tr -d '%')
muted=$(pactl get-sink-mute "$sink" 2>/dev/null | awk '{print $2}')

if ! [[ "$vol" =~ ^[0-9]+$ ]]; then
    vol=0
fi

case "$1" in
    up)
        pactl set-sink-volume "$sink" +5% 2>/dev/null
        ;;
    down)
        pactl set-sink-volume "$sink" -5% 2>/dev/null
        ;;
    toggle)
        pactl set-sink-mute "$sink" toggle 2>/dev/null
        ;;
    status)
        if [[ "$muted" == "yes" || "$muted" == "да" ]]; then
            echo "󰖁 muted"
        else
            if [ "$vol" -eq 0 ]; then
                icon="󰖀"
            elif [ "$vol" -le 30 ]; then
                icon="󰕿"
            elif [ "$vol" -le 70 ]; then
                icon="󰕾"
            else
                icon="󰕾"
            fi
            echo "$icon $vol%"
        fi
        ;;
    *)
        echo "Usage: $0 {up|down|toggle|status}"
        ;;
esac

