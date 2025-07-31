
# Create aliases
alias cls="clear"
alias ls="lsd"
alias md="mkdir"
alias g="git"
alias n="nvim"
alias v="vim"
alias m="micro"

# Display critical errors
alias syslog_emerg="sudo dmesg --level=emerg,alert,crit"

# Output common errors
alias syslog="sudo dmesg --level=err,warn"

# Print logs from x server
alias xlog='grep "(EE)\|(WW)\|error\|failed" ~/.local/share/xorg/Xorg.0.log'

# Remove archived journal files until the disk space they use falls below 100M
alias vacuum="journalctl --vacuum-size=100M"

# Make all journal files contain no data older than 2 weeks
alias vacuum_time="journalctl --vacuum-time=2weeks"

alias ff="fastfetch"
alias fetch="~/bin/fetchs/fetch"
alias sysfetch="~/bin/fetchs/sysfetch"

# Zapret
alias zapret="sudo bash ~/zapret-discord-youtube-linux/main_script.sh"

# Setup monitors
alias setupmon="xrandr --output DP-0 --primary --mode 2560x1440 --rate 165 --pos 0x0 \
               --output DP-4 --mode 1920x1080 --rate 165 --rotate left --pos 2560x0"

# Steam
alias steam_shutdown='echo "Запуск скрипта выключения после Steam..."; nohup ~/bin/scripts/shutdown_after_steam_install.sh > ~/shutdown.log 2>&1 &; echo "Скрипт запущен в фоне. Логи в ~/shutdown.log"'

set -U fish_greeting
set fish_color_command green
set -gx EDITOR vim
set -gx VISUAL vim
set -gx BROWSER /usr/bin/firefox


# Places
function pr
    switch $argv[1]
        case go-bot
            cd /home/user/pr/CRAB@v0.1.0/core/go-spreads-bot@v0.1.0
        case rtw
            cd /home/user/pr/CRAB@v0.1.0/core/rtw@v0.1.0
        case spreads
            cd /home/user/pr/CRAB@v0.1.0/core/spreads-consumer@v0.1.0
        case db
            cd /home/user/pr/CRAB@v0.1.0/core/spreads-consumer@v0.1.0/db_rework
        case log
            cd /home/user/pr/CRAB@v0.1.0/utils/log_cleaner
        case ob_streamer
            cd /home/user/pr/CRAB@v0.1.0/utils/orderbook-streamer
        case '*'
            echo "Unknown project. Available options:"
            echo "  go-bot    → ~/pr/CRAB@v0.1.0/core/go-spreads-bot@v0.1.0"
            echo "  rtw       → ~/pr/CRAB@v0.1.0/core/rtw@v0.1.0"
            echo "  spreads   → ~/pr/CRAB@v0.1.0/core/spreads-consumer@v0.1.0"
            echo "  db        → ~/pr/CRAB@v0.1.0/core/spreads-consumer@v0.1.0/db_rework"
            echo "  log       → ~/pr/CRAB@v0.1.0/utils/log_cleaner"
            echo "  ob-streamer → ~/pr/CRAB@v0.1.0/utils/orderbook-streamer"
    end
end

if status is-interactive
    # Commands to run in interactive sessions can go here
end
