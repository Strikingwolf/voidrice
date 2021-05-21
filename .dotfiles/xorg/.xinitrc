#!/bin/sh
[ -f "$HOME/.xprofile" ] && . ~/.xprofile

xrdb $HOME/.Xresources

scratchtermrenewal &
$TERMINAL -e fish &
exec bspwm
setxkbmap -option compose:menu &
