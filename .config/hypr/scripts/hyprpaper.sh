#!/bin/bash

new=$HOME/wallpaper/$(ls $HOME/wallpaper | sort -R | head -n 1)

hyprctl hyprpaper preload $new
hyprctl hyprpaper wallpaper "eDP-1,$new"

active_wallpaper=$(hyprctl hyprpaper listactive | tail -n 1 | cut -d " " -f 3)

list=$(hyprctl hyprpaper listloaded)

for i in $list; do
    if [ "$i" != "$new" ]; then
        hyprctl hyprpaper unload "$i"
    fi
done
