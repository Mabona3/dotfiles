local wezterm = require('wezterm');
local act = wezterm.action;

return function(config)
  config.keys = {
    { mods = "CTRL|SHIFT", key = "a", action = act.SplitVertical { domain = "CurrentPaneDomain" } },
    { mods = "CTRL|SHIFT", key = "s", action = act.SplitHorizontal { domain = "CurrentPaneDomain" } },
    { mods = "CTRL|SHIFT", key = "d", action = act.ShowDebugOverlay },
    { mods = "CTRL|SHIFT", key = "h", action = act.ActivatePaneDirection("Left") },
    { mods = "CTRL|SHIFT", key = "j", action = act.ActivatePaneDirection("Down") },
    { mods = "CTRL|SHIFT", key = "k", action = act.ActivatePaneDirection("Up") },
    { mods = "CTRL|SHIFT", key = "l", action = act.ActivatePaneDirection("Right") },
  }
end
