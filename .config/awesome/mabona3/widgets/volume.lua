local vicious = require("vicious")
local wibox = require("wibox")
local gears = require("gears")
local awful = require("awful")

local volume_buttons = gears.table.join(
    awful.button({ }, 1, function()
        awful.spawn("pavucontrol")
    end)
)

-- Create the volume widget
local volume = wibox.widget.textbox()
volume.font = "0xProtoNerdFont 8"

-- Initial value: just the icon without percentage
local volume_icon = " " -- Default icon for unmuted
local volume_percentage = ""

-- Register the vicious widget for volume updates
vicious.register(volume, vicious.widgets.volume, function(widget, args)
    if args[2] == "🔈" then
        volume_icon = "   " -- Mute icon
    else
        volume_icon = "   " -- Unmuted icon
    end
    volume_percentage = (" %d%% "):format(args[1])
    return volume_icon
end, 1, "Master")

-- Mouse enter event to show percentage
volume:connect_signal("mouse::enter", function()
    volume.text = volume_percentage
end)

-- Mouse leave event to restore the icon
volume:connect_signal("mouse::leave", function()
    volume.text = volume_icon
end)

-- Set up mouse button interaction
volume:buttons(volume_buttons)

return volume

