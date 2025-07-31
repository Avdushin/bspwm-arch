#!/bin/bash

DIR="./zapret-latest"
SITES=("https://www.youtube.com" "https://discord.com")

check_site() {
    url=$1
    curl -s --max-time 10 -o /dev/null -w "%{http_code}" "$url"
}

run_bypass() {
    script=$1
    echo "Запускаем обход: $script"
    if [[ $script == *.bat ]]; then
        wine cmd /c "$script"
    else
        echo "Неизвестный формат скрипта: $script"
        return 1
    fi
}

for script in "$DIR"/*; do
    if [[ ! -f "$script" ]]; then
        echo "Пропускаем не-файл: $script"
        continue
    fi

    echo "Проверяем обход: $script"
    run_bypass "$script"

    all_ok=true
    for site in "${SITES[@]}"; do
        code=$(check_site "$site")
        if [[ "$code" != "200" ]]; then
            echo "FAIL: $site недоступен после запуска $script (код: $code)"
            all_ok=false
        else
            echo "OK: $site доступен"
        fi
    done

    if $all_ok; then
        echo "Найден рабочий обход: $script"
        exit 0
    fi

    # TODO: остановить обход, если надо

done

echo "Рабочий обход не найден"
exit 1

