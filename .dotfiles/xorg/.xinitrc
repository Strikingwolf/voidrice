#!/bin/sh
[ -f "$HOME/.xprofile" ] && . ~/.xprofile

xrdb $HOME/.Xresources

scratchtermrenewal &
$TERMINAL -e fish &
setxkbmap -option compose:menu
exec bspwm
