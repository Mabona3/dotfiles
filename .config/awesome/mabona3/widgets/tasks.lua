local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")

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

return function (s)
local mytasklist = awful.widget.tasklist {
    screen  = s,
    filter  = awful.widget.tasklist.filter.currenttags,
    buttons = tasklist_buttons,
    style = {
      bg_normal = "#22222222",
      bg_focus = "#c0c0c000",
      fg_focus = "#ffffff",
    },
    widget_template = {
        {
            {
                {
                    {
                        id     = 'icon_role',
                        widget = wibox.widget.imagebox,
                        style = {
                            shape = gears.shape.circle,
                            valign = 'center',
                            halign = 'center',
                            widget = wibox.container.place
                        },
                    },
                    margins = 1,
                    widget  = wibox.container.margin,
                },
                {
                    id     = 'text_role',
                    widget = wibox.widget.textbox,
                },
                layout = wibox.layout.fixed.horizontal,
            },
            valign = 'center',
            halign = 'center',
            widget = wibox.container.place,
            -- left = 10,
            -- right = 10,
            -- widget = wibox.container.margin,
        },
        id     = 'background_role',
        widget = wibox.container.background,
        placement = awful.placement.center,
    },

  }

  return mytasklist
end
