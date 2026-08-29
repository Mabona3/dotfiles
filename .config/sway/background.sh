#!/bin/env bash

if [ "$#" -eq 1 ]; then
    new=$(find $HOME/wallpaper -type f | sort -R | head -n 1);
else
    new=`find ~/wallpaper/ -type f \( -name "*.jpg" -o -name "*.png" \) | while read -r img; do
    base=$(basename "$img")
    echo -en "${base^}\0icon\x1f$img\n"
    done | rofi -dmenu -case-smart -theme-str '
    window { width: 30%; }
    element-icon { size: 3em; }
    listview { columns: 1; lines: 6; }
    '`;
    new=`find ~/wallpaper/ -type f -iname $new`
fi

if [[ -z $new ]]; then
    echo $new;
    return
fi

swaybg -i $new -m fill&

if [ "$prev" != "$new" ]; then
    wallust -s run "$new"
    hyprctl hyprpaper unload "$prev"
    notify-send "$new" -i "$new"
    pkill -SIGUSR2 waybar
fi

