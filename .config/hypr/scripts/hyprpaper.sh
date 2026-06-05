#!/bin/bash

$1
if [ $? -ne 0 ]; then
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

hyprctl hyprpaper wallpaper "eDP-1,$new"

prev=$(hyprctl hyprpaper listactive | tail -n 1 | cut -d " " -f 3)

if [ "$prev" != "$new" ]; then
    wallust -s run "$new"
    hyprctl hyprpaper unload "$prev"
    notify-send "$new" -i "$new"
    pkill -SIGUSR2 waybar
fi

