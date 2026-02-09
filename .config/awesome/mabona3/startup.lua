local awful = require('awful');
local beautiful = require("beautiful")

beautiful.init("/home/mabona3/.config/awesome/theme.lua")

-- beautiful.useless_gap = 2
beautiful.cursor_theme = "BreezeX-Dark"
beautiful.cursor_size = 24

awful.spawn('picom --backend glx --vsync --no-fading-openclose')
-- awful.util.spawn.with_shell("feh --bg-scale ~/wallpaper/my_wallpaper.jpg")
awful.spawn.with_shell("feh --bg-scale --randomize ~/wallpaper/*")
awful.spawn.with_shell("xsetroot -cursor_name BreezeX-Dark")
