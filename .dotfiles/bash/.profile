#!/bin/bash
# Profile file. Runs on login.

#Adds `~/.local/bin/` and all subdirectories to $PATH
export PATH="$PATH:$(du "$HOME/.local/bin/" | cut -f2 | tr '\n' ':' | sed 's/:*$//')"
export PATH="$PATH:$(du "$HOME/Games/Steam/steamapps/common" --max-depth 1 | cut -f2 | tr '\n' ':' | sed 's/:*$//')"

export DISPLAY=:0


export EDITOR="nvim"
export TERMINAL="st"
export BROWSER="firefox"
export READER="zathura"
export FILE="lf"
export BIB="$HOME/Documents/LaTeX/uni.bib"
export REFER="$HOME/Documents/referbib"
export SUDO_ASKPASS="$HOME/.local/bin/tools/dmenupass"
export SSH_ASKPASS=$SUDO_ASKPASS
export NOTMUCH_CONFIG="$HOME/.config/notmuch-config"
export GTK2_RC_FILES="$HOME/.config/gtk-2.0/gtkrc-2.0"

export TEX_INPUT="$HOME/.texinput"
export VIDEOS="$HOME/Media/Videos/"
export AUDIO="$HOME/Media/Music/"
export BOOKS="$HOME/Documents/Books/"
export HMWK="$HOME/Documents/Homework/03-Semester/"
export TORRENTS="/var/lib/transmission/Downloads/"
export DOWNLOADS="$HOME/Downloads/"
export REPOS="$HOME/Documents/Repos"

export BAT="BAT1"

export XDG_CURRENT_DESKTOP="bspwm"

# less/man colors
export LESS=-R
export LESS_TERMCAP_mb="$(printf '%b' '[1;31m')"; a="${a%_}"
export LESS_TERMCAP_md="$(printf '%b' '[1;36m')"; a="${a%_}"
export LESS_TERMCAP_me="$(printf '%b' '[0m')"; a="${a%_}"
export LESS_TERMCAP_so="$(printf '%b' '[01;44;33m')"; a="${a%_}"
export LESS_TERMCAP_se="$(printf '%b' '[0m')"; a="${a%_}"
export LESS_TERMCAP_us="$(printf '%b' '[1;32m')"; a="${a%_}"
export LESS_TERMCAP_ue="$(printf '%b' '[0m')"; a="${a%_}"

export MOSH_ESCAPE_KEY="<F13>"

export MENU="menu"
export MENU_RUN="menurun"

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_DIR="$HOME/.local/share"

export CRONGIT_REPOS="$HOME/Documents/Homework"
export WEBSITES="$HOME/Documents/Websites"
export STEAM_COMMON="$HOME/Games/Steam/steamapps/common"

mpd >/dev/null 2>&1 &

[ ! -f ~/.config/shortcutrc ] && shortcuts >/dev/null 2>&1

echo "$0" | grep "bash$" >/dev/null && [ -f ~/.bashrc ] && source "$HOME/.bashrc"

# Start graphical server if i3 not already running.
[ "$(tty)" = "/dev/tty1" ] && ! pgrep -x i3 >/dev/null && exec startx -- :0

# Switch escape and caps if tty:
