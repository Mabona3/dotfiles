return function(config)
  config.colors = {
    split = "#2a2a2a",
    tab_bar = {
      background = "#000000",

      active_tab = {
        bg_color = "#262626",
        fg_color = "#e0e0e0",
        intensity = "Normal",
        underline = "None",
        italic = false,
        strikethrough = false,
      },

      inactive_tab = {
        bg_color = "#0b0b0b",
        fg_color = "#9a9a9a",
      },

      inactive_tab_hover = {
        bg_color = "#2a2a2a",
        fg_color = "#b0b0b0",
        italic = true,
      },

      new_tab = {
        bg_color = "#161616",
        fg_color = "#9a9a9a",
      },

      new_tab_hover = {
        bg_color = "#2a2a2a",
        fg_color = "#b0b0b0",
        italic = true,
      },
    },
  }
end
