#!/bin/bash

echo "Ожидание завершения загрузки в Steam..."

while true; do
    # Проверяем: 
    # 1. Нет процессов загрузки Steam.
    # 2. Папка downloading пуста.
    if ! pgrep -f "steam.*download" >/dev/null && \
       [ -z "$(ls -A ~/.local/share/Steam/steamapps/downloading/ 2>/dev/null)" ]; then
        echo "Загрузка завершена. Выключение через 10 секунд..."
        sleep 10
        systemctl poweroff
        exit 0
    fi
    sleep 10
done
