local wezterm = require('wezterm');
local act = wezterm.action;

return function(config)
    config.leader = { key = "k", mods = "CTRL", timeout_millisecond = 1000 }
    config.keys = {
        { mods = "LEADER", key = "a", action = act.SplitVertical { domain = "CurrentPaneDomain" } },
        { mods = "LEADER", key = "s", action = act.SplitHorizontal { domain = "CurrentPaneDomain" } },
        { mods = "LEADER", key = "d", action = act.ShowDebugOverlay },
        { mods = "LEADER", key = "h", action = act.ActivatePaneDirection("Left") },
        { mods = "LEADER", key = "j", action = act.ActivatePaneDirection("Down") },
        { mods = "LEADER", key = "k", action = act.ActivatePaneDirection("Up") },
        { mods = "LEADER", key = "l", action = act.ActivatePaneDirection("Right") },
        { mods = "LEADER", key = "c", action = act.SpawnTab("CurrentPaneDomain") },
    }
end
