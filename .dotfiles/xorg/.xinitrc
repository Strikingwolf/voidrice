#!/bin/sh
[ -f "$HOME/.xprofile" ] && . ~/.xprofile

xrdb $HOME/.Xresources

scratchtermrenewal &
$TERMINAL &
exec bspwm
