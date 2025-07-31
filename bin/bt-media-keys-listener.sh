#!/bin/bash

DEVICE="/dev/input/event26" #257
PLAYERCTL="/usr/bin/playerctl"

export DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/$(id -u)/bus"
export XDG_RUNTIME_DIR="/run/user/$(id -u)"

stdbuf -oL evtest --grab "$DEVICE" | while read -r line; do
    if echo "$line" | grep -q "type 1 (EV_KEY), code 201 (KEY_PAUSECD), value 1"; then
        $PLAYERCTL play-pause
    elif echo "$line" | grep -q "type 1 (EV_KEY), code 200 (KEY_PLAYCD), value 1"; then
        $PLAYERCTL play-pause
    elif echo "$line" | grep -q "type 1 (EV_KEY), code 163 (KEY_NEXTSONG), value 1"; then
        $PLAYERCTL next
    elif echo "$line" | grep -q "type 1 (EV_KEY), code 165 (KEY_PREVIOUSSONG), value 1"; then
        $PLAYERCTL previous
    fi
done

