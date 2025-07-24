#!/bin/bash
# https://github.com/MrPowerGamerBR/DiscordLinuxAttentionOnNotification

dbus-monitor "interface='org.freedesktop.Notifications'" | grep --line-buffered '^\s*string "discord"$' | while read -r; do
    echo "Received Discord Notification!"
    WINDOW_IDS=$(kdotool search --classname discord)
    for i in $(echo $WINDOW_IDS | tr ";" "\n"); do
        kdotool windowstate --add demands_attention $i
    done
done
