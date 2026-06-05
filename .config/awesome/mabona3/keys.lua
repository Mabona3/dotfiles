local gears = require('gears')
local naughty = require("naughty")
local awful = require('awful')
local hotkeys_popup = require("awful.hotkeys_popup")
local xrandr = require("xrandr")
require("awful.autofocus")

local layouts = { "us", "ara" }
local current_layout = 1

modkey = "Mod4"
-- {{{ Mouse bindings
root.buttons(gears.table.join(
  awful.button({}, 4, awful.tag.viewnext),
  awful.button({}, 5, awful.tag.viewprev)
))

globalkeys = gears.table.join(
  awful.key({ modkey }, "s", hotkeys_popup.show_help,
    { description = "show help", group = "awesome" }),
  awful.key({ modkey, "Shift" }, "j", awful.tag.viewprev,
    { description = "view previous", group = "Mabona3" }),
  awful.key({ modkey, "Shift" }, "k", awful.tag.viewnext,
    { description = "view next", group = "Mabona3" }),
  awful.key({ modkey, }, "Left", awful.tag.viewprev,
    { description = "view previous", group = "tag" }),
  awful.key({ modkey, }, "Right", awful.tag.viewnext,
    { description = "view next", group = "tag" }),
  awful.key({ modkey, }, "Escape", awful.tag.history.restore,
    { description = "go back", group = "tag" }),
  awful.key({ modkey }, "F3", function() awful.util.spawn("amixer sset Master 5%+") end,
    { description = "Volume Up", group = "Mabona3" }),
  awful.key({ modkey }, "F1", function() awful.util.spawn("amixer sset Master 5%-") end,
    { description = "Volume Down", group = "Mabona3" }),
  awful.key({ modkey }, "F2", function() awful.util.spawn("amixer sset Master toggle") end,
    { description = "Volume Mute", group = "Mabona3" }),
  awful.key({ modkey, "Shift" }, "y", function() naughty.destroy_all_notifications() end,
    { description = "Destroy notifications", group = "hotkeys" }),
  -- Brightness Bindings
  awful.key({ modkey }, "F5", function() awful.util.spawn("brightnessctl s 10%-") end,
    { description = "Brightness Decrease", group = "Mabona3" }),
  awful.key({ modkey }, "F6", function() awful.util.spawn("brightnessctl s 10%+") end,
    { description = "Brightness Increase", group = "Mabona3" }),

  -- Music Daemon Bindings
  awful.key({ modkey, }, "F10", function() awful.util.spawn("mpc prev") end,
    { description = "Previous Music", group = "Mabona3" }),
  awful.key({ modkey, }, "F11", function()
      awful.util.spawn('mpd'); awful.util.spawn("mpc toggle")
    end,
    { description = "Open Music Daemon  ", group = "Mabona3" }),
  awful.key({ modkey, }, "F12", function() awful.util.spawn("mpc next") end,
    { description = "Next Music", group = "Mabona3" }),
  awful.key({ modkey, }, "j", function() awful.client.focus.byidx(1) end,
    { description = "focus next by index", group = "client" }),
  awful.key({ modkey, }, "k", function() awful.client.focus.byidx(-1) end,
    { description = "focus previous by index", group = "client" }),
  awful.key({ modkey, }, "w", function() xrandr.xrandr() end,
    { description = "xrandr", group = "Mabona3" }),
  -- awful.key({ modkey,"Shift"}, "w", function () awful.util.spawn("disper -C 'e:c'") end,
  -- {description = "xrandr", group = "Mabona3"}),

  -- Layout manipulation
  awful.key({ modkey, "Shift" }, "j", function() awful.client.swap.byidx(1) end,
    { description = "swap with next client by index", group = "client" }),
  awful.key({ modkey, "Shift" }, "k", function() awful.client.swap.byidx(-1) end,
    { description = "swap with previous client by index", group = "client" }),
  awful.key({ modkey, "Control" }, "j", function() awful.screen.focus_relative(1) end,
    { description = "focus the next screen", group = "screen" }),
  awful.key({ modkey, "Control" }, "k", function() awful.screen.focus_relative(-1) end,
    { description = "focus the previous screen", group = "screen" }),
  awful.key({ modkey }, "u", awful.client.urgent.jumpto,
    { description = "jump to urgent client", group = "client" }),
  awful.key({ modkey }, "Tab",
    function()
      awful.client.focus.history.previous()
      if client.focus then
        client.focus:raise()
      end
    end, { description = "go back", group = "client" }),

  -- Standard program
  awful.key({ modkey, }, "Return", function() awful.spawn(APPS.terminal) end,
    { description = "open a terminal", group = "launcher" }),
  awful.key({ modkey, }, "r", awesome.restart,
    { description = "reload awesome", group = "awesome" }),
  awful.key({ modkey, "Shift" }, "q", awesome.quit,
    { description = "quit awesome", group = "awesome" }),
  awful.key({ modkey, }, "l", function() awful.tag.incmwfact(0.05) end,
    { description = "increase master width factor", group = "layout" }),
  awful.key({ modkey, }, "h", function() awful.tag.incmwfact(-0.05) end,
    { description = "decrease master width factor", group = "layout" }),
  awful.key({ modkey, "Shift" }, "h", function() awful.tag.incnmaster(1, nil, true) end,
    { description = "increase the number of master clients", group = "layout" }),
  awful.key({ modkey, "Shift" }, "l", function() awful.tag.incnmaster(-1, nil, true) end,
    { description = "decrease the number of master clients", group = "layout" }),
  awful.key({ modkey, "Control" }, "h", function() awful.tag.incncol(1, nil, true) end,
    { description = "increase the number of columns", group = "layout" }),
  awful.key({ modkey, "Control" }, "l", function() awful.tag.incncol(-1, nil, true) end,
    { description = "decrease the number of columns", group = "layout" }),
  awful.key({ modkey, }, "space", function()
      current_layout = current_layout % #layouts + 1
      awful.spawn("setxkbmap " .. layouts[current_layout])
    end,
    { description = "toggle Keyboard Layout", group = "Layout" }),
  awful.key({ modkey, "Shift" }, "space", function() awful.layout.inc(-1) end,
    { description = "select previous", group = "layout" }),

  -- awful.key({ modkey, "Control" }, "n",
  -- function ()
  --   local c = awful.client.restore()
  --   -- Focus restored client
  --   if c then
  --     c:emit_signal(
  --     "request::activate", "key.unminimize", {raise = true}
  --     )
  --   end
  -- end,
  -- {description = "restore minimized", group = "client"}),

  -- My Launchers

  awful.key({ modkey }, "d", function() awful.util.spawn(APPS.launcher) end,
    { description = "launch app launcher", group = "launcher" }),
  -- awful.key({ modkey,"Shift" }, "s", function () awful.util.spawn("shutdown now") end, {description = "Shutdown System", group = "launcher"}),
  awful.key({ modkey }, "b", function() awful.util.spawn(APPS.browser) end,
    { description = "launch browser", group = "launcher" }),
  awful.key({ modkey }, "e", function() awful.util.spawn(APPS.file_manager) end,
    { description = "launch File Manager", group = "launcher" }),
  awful.key({ modkey, "Shift" }, "z",
    function() awful.spawn.with_shell('/home/mabona/.config/awesome/scripts/screenshot') end,
    { description = "Take Screenshot", group = "launcher" }))

for i = 1, 9 do
  globalkeys = gears.table.join(globalkeys,
    -- View tag only.
    awful.key({ modkey }, "#" .. i + 9,
      function()
        for s in screen do
          local tag = s.tags[i]
          if tag then
            awful.tag.viewonly(tag)
            awful.screen.focus(s)
            break
          end
        end
      end,
      { description = "view tag #" .. i, group = "tag" }),
    -- Toggle tag display.
    awful.key({ modkey, "Control" }, "#" .. i + 9,
      function()
        for s in screen do
          local tag = s.tags[i]
          if tag then
            awful.screen.focus(s)
            awful.tag.viewtoggle(tag)
            break
          end
        end
      end,
      { description = "toggle tag #" .. i, group = "tag" }),
    -- Move client to tag.
    awful.key({ modkey, "Shift" }, "#" .. i + 9,
      function()
        if client.focus then
          for s in screen do
            local tag = s.tags[i]
            if tag then
              client.focus:move_to_tag(tag)
              awful.tag.viewonly(tag)
              awful.screen.focus(s)
              break
            end
          end
        end
      end,
      { description = "move focused client to tag #" .. i, group = "tag" }),
    -- Toggle tag on focused client.
    -- oooh this is a good one
    awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9,
      function()
        if client.focus then
          for s in screen do
            local tag = s.tags[i]
            if tag then
              client.focus:toggle_tag(tag)
              awful.tag.viewonly(tag)
              awful.screen.focus(s)
              break
            end
          end
        end
      end,
      { description = "toggle focused client on tag #" .. i, group = "tag" })
  )
end

root.keys(globalkeys)
