local vicious = require("vicious")
local wibox = require("wibox")


local network = wibox.widget.textbox()
network.font = "0xProtoNerdFont 8"

vicious.register(network, vicious.widgets.net, function (widget,args)
  if args["{wlan0 carrier}"] == 1 then
    if args["{wlan0 down_kb}"] ~= 0 then
      return " "
    end
  elseif args["{enp2s0f1 carrier}"] == 1 then
    return "  "
  else
    return "  "
  end
end, 1)

return network
