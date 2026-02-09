local vicious = require("vicious")
local awful = require("awful");
local wibox = require("wibox")
local gears = require("gears")

awful.layout.layouts = {
  awful.layout.suit.tile
}

-- local mpdwidget = awful.widget.mpd
local mytextclock = wibox.widget.textclock()
mytextclock.font = "FiraCodeNerdFont 9"
local tasklist_buttons = gears.table.join(
awful.button({ }, 1, function (c)
  if c == client.focus then
    c.minimized = true
  else
    c:emit_signal(
    "request::activate",
    "tasklist",
    {raise = true})
  end
end),

awful.button({ }, 3, function()
  awful.menu.client_list({ theme = { width = 250 } })
end),

awful.button({ }, 4, function ()
  awful.client.focus.byidx(1)
end),

awful.button({ }, 5, function ()
  awful.client.focus.byidx(-1)
end))


awful.screen.connect_for_each_screen(function(s)

  -- awful.tag({ "1", "2", "3", "4" ,"5", "6", "7"}, s, awful.layout.layouts[1])

  if s.index == 1 then
    awful.tag({ "1", "2", "3" }, s, awful.layout.layouts[1])
  elseif s.index == 2 then
    awful.tag({  "1", "2", "3", "4" ,"5", "6" }, s, awful.layout.layouts[1])
  end

  s.volume = require("mabona3.widgets.volume")

  s.mympd = require("mabona3.widgets.mpd")

  s.network = require("mabona3.widgets.network")

  s.uptimewidget = wibox.widget.textbox()
  s.uptimewidget.font = "FiraCodeNerdFont 10"
  vicious.register(s.uptimewidget, vicious.widgets.uptime,
  function (widget, args)
    return ("%dD %dH %dM "):format(
    args[1], args[2], args[3])
  end, 61)

  s.mytaglist = require("mabona3.widgets.taglist")(s)
  -- Create a tasklist widget
  s.mytasklist = require("mabona3.widgets.tasks")(s)

  s.mywibox = awful.wibar({ position = "bottom", screen = s , opacity = 0.9, fg = "#FFFFFF", bg = "c0c0c0c"})

  s.mywibox:setup {
    layout = wibox.layout.align.horizontal,
    {
      layout = wibox.layout.fixed.horizontal,
      s.mytaglist,
    },
    s.mytasklist,
    {
      layout = wibox.layout.fixed.horizontal,
      s.mympd,
      s.volume,
      s.network,
      mytextclock,
      -- s.uptimewidget
    },
  }
end)

client.connect_signal("property::fullscreen", function(c)
  c.screen.mywibox.visible = not c.fullscreen
end)

client.connect_signal("property::minimized", function(c)
  c.screen.mywibox.visible = not c.minimized
end)

client.connect_signal("unmanage", function(c)
  c.screen.mywibox.visible = true
end)

