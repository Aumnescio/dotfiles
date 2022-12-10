#!/bin/bash

#: Autostart script for AwesomeWM

function run() {
    #: If process does not exist, start new one.
    if [ ! "$(pgrep -f "$1")" ]; then
        "$@"
    fi
}

#: Keyboard Setup
setxkbmap us
xset r rate 192 72

#: Audio Setup
/usr/sbin/alsactl --file /home/aum/.config/alsa-store/asound.state restore

#: Autostarts
run sxhkd &
run mpd &
run xbanish & disown
run picom --experimental-backends --daemon
