local gears = require("gears")
local awful = require("awful")
local wibox = require("wibox")

-- Taglist buttons
local taglist_buttons = gears.table.join(
awful.button({ }, 1, function(t) t:view_only() end),
awful.button({ modkey }, 1, function(t)
  if client.focus then
    client.focus:move_to_tag(t)
  end
end),
awful.button({ }, 3, awful.tag.viewtoggle),
awful.button({ modkey }, 3, function(t)
  if client.focus then
    client.focus:toggle_tag(t)
  end
end),
awful.button({ }, 4, function(t) awful.tag.viewnext(t.screen) end),
awful.button({ }, 5, function(t) awful.tag.viewprev(t.screen) end),
tag.connect_signal("property::selected", function(t)
  local s = t.screen
  local fullscreen_exists = false
  for _, cl in ipairs(s.clients) do
    if cl.fullscreen then
      fullscreen_exists = true
      break
    end
  end
  s.mywibox.visible = not fullscreen_exists
end)
)

return function(s)
  local mytaglist = awful.widget.taglist {
    screen  = s,
    filter  = awful.widget.taglist.filter.noempty,
    style = {
      shape = gears.shape.rounded_rect,
      font = "FiraCodeNerdFont 10",
    },
    layout = {
      spacing = 2,
      layout = wibox.layout.fixed.horizontal,
    },
    buttons = taglist_buttons
  }
  return mytaglist
end
