function procstats -d "Показать статистику процессов по имени (CPU, RAM)"
    if test (count $argv) -eq 0
        echo "Использование: procstats <имя_процесса> [--cpu|--mem]"
        return 1
    end

    set -l process_name $argv[1]
    set -l sort_key "%cpu"  # Сортировка по CPU по умолчанию

    # Если указан --mem, сортируем по RAM
    if contains -- --mem $argv
        set sort_key "%mem"
    else if contains -- --cpu $argv
        set sort_key "%cpu"
    end

    # Выводим заголовок
    echo -e "PID\tUSER\t%CPU\t%MEM\tRAM(MB)\tCOMMAND"

    # Получаем данные и форматируем
    ps -eo pid,user,%cpu,%mem,rss,comm --sort=-$sort_key \
        | grep -i "$process_name" \
        | grep -v grep \
        | awk -v OFS='\t' '{
            rss_mb = $5 / 1024;
            printf "%s\t%s\t%.1f\t%.1f\t%.1f\t%s\n", $1, $2, $3, $4, rss_mb, $6
        }'
end
