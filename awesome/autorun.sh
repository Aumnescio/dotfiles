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
xset r rate 196 80

#: Audio Setup
/usr/sbin/alsactl --file /home/aum/.config/alsa-store/asound.state restore

#: Autostarts
run sxhkd &
run mpd &
run xbanish & disown
run picom --experimental-backends --daemon

#: Start `Kitty Terminal` as Single Instance to launch new terminals faster.
#: NOTE: Problem: The font size for each view is no longer independent.
# run kitty -1 --start-as minimized
