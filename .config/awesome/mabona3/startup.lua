local awful = require('awful');
local beautiful = require("beautiful")

beautiful.init("/home/mabona/.config/awesome/theme.lua")

beautiful.useless_gap = 1
beautiful.cursor_theme = "BreezeX-Dark"
beautiful.cursor_size = 24

awful.spawn('picom --backend glx --vsync --no-fading-openclose')
-- awful.util.spawn.with_shell("feh --bg-scale ~/wallpaper/my_wallpaper.jpg")
awful.spawn.with_shell("feh --bg-scale `find ~/wallpaper/ -type f | shuf -n1`")
-- awful.spawn.with_shell("xsetroot -cursor_name BreezeX-Dark")
