#!/bin/env bash

img="`find ~/wallpaper/ -type f | shuf -n1`";

if [ -n `pidof swaybg` ]; then
    pkill swaybg;
fi

swaybg -i $img -m fill&

notify-send "wallpaper $(basename $img)" -i $img
