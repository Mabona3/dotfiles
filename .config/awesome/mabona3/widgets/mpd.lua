local vicious = require("vicious")
local wibox = require("wibox")

local mympd = wibox.widget.textbox()
mympd.font = "FiraCodeNerdFont 8"
vicious.register(mympd, vicious.widgets.mpd,
function (widget, args)
  if args["{Artist}"] == "N/A" and args["{Title}"] == "N/A" then
    return ' - '
  else
    return (' ')
  end
end)

return mympd
