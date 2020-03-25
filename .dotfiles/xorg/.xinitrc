#!/bin/sh
[ -f "$HOME/.xprofile" ] && . ~/.xprofile

xrdb $HOME/.Xresources

exec bspwm

