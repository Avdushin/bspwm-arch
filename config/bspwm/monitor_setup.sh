#!/bin/bash

# Получаем имена подключенных мониторов
PRIMARY_MONITOR="DP-0"    # 2k монитор
SECONDARY_MONITOR="DP-4"  # fullHD, вертикальный

# Настраиваем основной монитор
xrandr --output $PRIMARY_MONITOR --primary --mode 2560x1440 --rate 165 --pos 0x0 --rotate normal

# Настраиваем второй монитор справа вертикально
xrandr --output $SECONDARY_MONITOR --mode 1920x1080 --rate 165 --rotate left --pos 2560x0

# Отключаем все остальные
for output in $(xrandr | grep " connected" | awk '{ print $1 }'); do
    if [[ "$output" != "$PRIMARY_MONITOR" && "$output" != "$SECONDARY_MONITOR" ]]; then
        xrandr --output $output --off
    fi
done
