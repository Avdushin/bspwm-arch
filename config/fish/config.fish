
# Create aliases
alias cls="clear"
alias g="git"
alias n="nvim"
alias m="micro"
alias md="mkdir"
alias ls="lsd"
#alias history="history | cat -n"
alias h="history | cat -n"

# Spirited away Aburya wallpapers
alias wp="feh --bg-fill  /home/user/Images/walls.png"

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


set -x DOCKER_HOST unix:///var/run/docker.sock

set -U fish_greeting
set fish_color_command green
set -gx EDITOR vim
set -gx VISUAL vim
set -gx BROWSER /usr/bin/firefox

set YOUTUBE_IPS (dig +short youtube.com)
set DISCORD_IPS (dig +short discord.com)

if status is-interactive
    # Commands to run in interactive sessions can go here
end
