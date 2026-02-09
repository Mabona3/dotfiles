local awful = require('awful')

local tags = {
  { names = { '1', '2', '3'}},
  { names = { '4', '5', '6'}},
  { names = { '7', '8', '9'}},
}

awful.screen.connect_for_each_screen(function(s)

  if s.index == 1 then
    awful.tag(tags[1].names , awful.layout.suit.tile)
  elseif s.index == 2 then
    awful.tag(tags[2].names , awful.layout.suit.tile)
  elseif s.index == 3 then
    awful.tag(tags[3].names , awful.layout.suit.tile)
  end
end)
