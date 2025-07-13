function topprocs -d "Топ процессов с выбором сортировки (--cpu/--mem)"
    # Парсим аргументы
    set -l sort_key "%cpu"  # По умолчанию сортируем по CPU
    set -l header "CPU"     # Заголовок по умолчанию

    if count $argv > /dev/null
        switch $argv[1]
            case "--cpu" "*cpu*"
                set sort_key "%cpu"
                set header "CPU"
            case "--mem" "*mem*"
                set sort_key "%mem"
                set header "MEM"
            case "*"
                echo "Использование: topprocs [--cpu|--mem]"
                echo "По умолчанию: сортировка по CPU"
                return 1
        end
    end

    # Цвета
    set -l reset (set_color normal)
    set -l red (set_color -o red)
    set -l green (set_color -o green)
    set -l blue (set_color -o blue)
    set -l yellow (set_color -o yellow)

    # Динамический заголовок
    echo -e $yellow"    PID       USER   %CPU   %MEM       RAM (Сортировка по $header)"$reset

    # Основной вывод
    ps -eo pid,user,%cpu,%mem,rss,comm --sort=-$sort_key | head -n 11 | tail -n +2 | \
    while read -l pid user cpu mem rss comm
        # Нормализация чисел
        set cpu (string replace ',' '.' $cpu)
        set mem (string replace ',' '.' $mem)

        # Конвертация RAM
        set -l ram_value
        set -l ram_unit
        if test $rss -ge 1048576  # 1 GB = 1024*1024 KB
            set ram_value (math -s2 "$rss/1024/1024")
            set ram_unit "GB"
        else
            set ram_value (math -s0 "$rss/1024")
            set ram_unit "MB"
        end

        # Вывод
        printf "%7s %10s %s%6.1f%s %s%6.1f%s %s%7.2f %s%s %s\n" \
               $pid $user \
               $red $cpu $reset \
               $green $mem $reset \
               $blue $ram_value $reset $ram_unit \
               $comm
    end
end

#function topprocs -d "Топ процессов с автоматическим выбором MB/GB"
#    # Устанавливаем цвета
#    set -l reset (set_color normal)
#    set -l red (set_color -o red)
#    set -l green (set_color -o green)
#    set -l blue (set_color -o blue)
#    set -l yellow (set_color -o yellow)
#
#    # Заголовок (единицы будут динамическими)
#    echo -e $yellow"    PID       USER   %CPU   %MEM  RAM     COMMAND"$reset
#
#    # Получаем и обрабатываем процессы
#    ps -eo pid,user,%cpu,%mem,rss,comm --sort=-%cpu | head -n 11 | tail -n +2 | \
#    while read -l pid user cpu mem rss comm
#        # Заменяем запятые на точки (для локалей где десятичный разделитель - запятая)
#        set cpu (string replace ',' '.' $cpu)
#        set mem (string replace ',' '.' $mem)
#
#        # Определяем подходящие единицы измерения
#        set -l ram_value
#        set -l ram_unit
#        if test $rss -ge 1048576 # 1024*1024 = 1 GB
#            set ram_value (math -s2 "$rss/1024/1024")
#            set ram_unit "GB"
#        else
#            set ram_value (math -s0 "$rss/1024")
#            set ram_unit "MB"
#        end
#
#        # Форматируем вывод
#        printf "%7s %10s %s%6.1f%s %s%6.1f%s %s%7.2f%s %s%s%s %s\n" \
#               $pid $user \
#               $red $cpu $reset \
#               $green $mem $reset \
#               $blue $ram_value $reset \
#               $blue $ram_unit $reset \
#               $comm
#    end
#end
