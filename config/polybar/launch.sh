# #!/usr/bin/env bash

# # Полная очистка предыдущих процессов
# killall -q polybar
# while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# # Получаем список мониторов в правильном порядке
# PRIMARY=$(xrandr --query | grep " connected primary" | awk '{print $1}')
# if [ -z "$PRIMARY" ]; then
#     PRIMARY=$(xrandr --query | grep " connected" | head -n1 | awk '{print $1}')
# fi

# SECONDARY=$(xrandr --query | grep " connected" | grep -v "$PRIMARY" | head -n1 | awk '{print $1}')

# # Запускаем панели с проверкой
# if [ -n "$PRIMARY" ]; then
#     echo "Запуск main панели на $PRIMARY"
#     MONITOR=$PRIMARY polybar main -r >>/tmp/polybar_primary.log 2>&1 &
#     sleep 0.3  # Важная задержка!
# fi

# if [ -n "$SECONDARY" ]; then
#     echo "Запуск vertical панели на $SECONDARY"
#     MONITOR=$SECONDARY polybar vertical -r >>/tmp/polybar_secondary.log 2>&1 &
# fi

# # Настройка рабочих столов
# if [ -n "$PRIMARY" ]; then
#     bspc monitor $PRIMARY -d 1 2 3 4 5 6 7
# fi

# if [ -n "$SECONDARY" ]; then
#     bspc monitor $SECONDARY -d 8 9
# fi

# echo "Состояние мониторов:"
# echo "Primary: $PRIMARY"
# echo "Secondary: $SECONDARY"

# # Финализация настроек
# bspc config top_padding 30
# bspc config bottom_padding 0

# #!/usr/bin/env bash

# killall -q polybar
# while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# # Автоматически определяем мониторы
# PRIMARY_MON=$(xrandr --query | grep "2560x1440" -B1 | grep " connected" | awk '{print $1}')
# SECONDARY_MON=$(xrandr --query | grep "1920x1080" -B1 | grep " connected" | awk '{print $1}')

# # Запускаем Polybar
# if [[ -n "$PRIMARY_MON" ]]; then
#     MONITOR="$PRIMARY_MON" polybar top -r >>/tmp/polybar1.log 2>&1 &
# fi

# if [[ -n "$SECONDARY_MON" ]]; then
#     MONITOR="$SECONDARY_MON" polybar vertical -r >>/tmp/polybar2.log 2>&1 &
# fi

# echo "Polybar запущен: Основной=$PRIMARY_MON, Вертикальный=$SECONDARY_MON"

# #!/usr/bin/env bash

# # Terminate already running bar instances
# killall -q polybar

# # Wait until the processes have been shut down
# while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# # Launch bars for each monitor
# for m in $(polybar --list-monitors | cut -d":" -f1); do
#     if [ "$m" = "DP-3" ]; then
#         MONITOR=$m polybar top -r >>/tmp/polybar1.log 2>&1 &
#     elif [ "$m" = "DP-1" ]; then
#         MONITOR=$m polybar bottom -r >>/tmp/polybar2.log 2>&1 &
#     fi
# done

# echo "Bars launched..."

#!/usr/bin/env bash

# Terminate already running bar instances
#killall -q polybar

# Launch bar1 and bar2
#echo "---" | tee -a /tmp/polybar1.log /tmp/polybar2.log

#polybar example  >>/tmp/polybar1.log 2>&1 &
#polybar top -r >>/tmp/polybar1.log 2>&1 & disown
#polybar vertical -r >>/tmp/polybar3.log 2>&2 & disown

#echo "Bars launched..."

# NEW ONE
#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

# Запускаем top на основном мониторе
MONITOR=DP-0 polybar top -r >>/tmp/polybar1.log 2>&1 & disown

# Запускаем vertical на втором мониторе
MONITOR=DP-4 polybar vertical -r >>/tmp/polybar2.log 2>&1 & disown

echo "Bars launched..."


