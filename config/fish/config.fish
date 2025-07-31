# aliases
#sh $HOME/bin/fetchs/fetch
alias cls="clear"
alias g="git"
alias n="nvim"
alias m="micro"
alias md="mkdir"
alias ls="lsd"
#alias history="history | cat -n"
alias h="history | cat -n"

# monitoring
alias psf="procstats"
alias prs="procstats"
# proc stats pool
alias topcpu="topprocs --cpu"
alias topmem="topprocs --mem"

# Spirited away Aburya wallpapers
alias wp="feh --bg-fill  /home/user/Images/walls.png"

# fetches
alias ff="fastfetch"
alias fetch="~/bin/fetchs/fetch"
alias sysfetch="~/bin/fetchs/sysfetch"

# scripts
alias animals="~/bin/color-scripts/animals"

# Setup monitors
alias setupmon="xrandr --output DP-0 --primary --mode 2560x1440 --rate 165 --pos 0x0 \
               --output DP-4 --mode 1920x1080 --rate 165 --rotate left --pos 2560x0"

alias steam_shutdown='echo "Запуск скрипта выключения после Steam..."; nohup ~/bin/scripts/shutdown_after_steam_install.sh > ~/shutdown.log 2>&1 &; echo "Скрипт запущен в фоне. Логи в ~/shutdown.log"'

set -U fish_greeting
set fish_color_command green
set -gx EDITOR vim
set -gx VISUAL vim
set -gx BROWSER /usr/bin/firefox

set -x DOCKER_HOST unix:///var/run/docker.sock

if status is-interactive
    # Commands to run in interactive sessions can go here
end
