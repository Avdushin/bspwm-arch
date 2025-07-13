# Create aliases
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

alias vpn_server="ssh -i ~/.ssh/id_rsa root@80.78.243.36"

set -U fish_greeting
set fish_color_command green
set -gx EDITOR vim
set -gx VISUAL vim
set -gx BROWSER /usr/bin/firefox

set -x DOCKER_HOST unix:///var/run/docker.sock

# ByeDPI
#function byedpi
#    # подставьте свой путь, если он другой
#    set bin ~/bin/apps/byedpi/ciadpi
#
#    if test ! -x $bin
#        echo "Не найден или нет прав на выполнение: $bin" >&2
#        return 1
#    end

    # здесь ваши флаги
    #    sudo $bin \
	    #      -Kt,h \
	    #      -d1 -s0+s \
	    #      -d3+s -s6+s \
	    #      -d9+s -s12+s \
	    #      -d15+s -s20+s \
	    #      -d25+s -s30+s \
	    #      -d35+s \
	    #      -An -Ku \
	    #      -a1 -An
    #end

if status is-interactive
    # Commands to run in interactive sessions can go here
end
