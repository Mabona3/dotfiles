return function(config)
    config.colors = {
        -- The default text color
        foreground = '#F0ABA4',
        -- The default background color
        background = '#030308',

        -- Overrides the cell background color when the current cell is occupied by the
        -- cursor and the cursor style is set to Block
        cursor_bg = '#B798AA',
        -- Overrides the text color when the current cell is occupied by the cursor
        cursor_fg = '#030308',
        -- Specifies the border color of the cursor when the cursor style is set to Block,
        -- or the color of the vertical or horizontal bar when the cursor style is set to
        -- Bar or Underline.
        cursor_border = '#B798AA',

        -- the foreground color of selected text
        selection_fg = '#B798AA',
        -- the background color of selected text
        selection_bg = '#4B5B50',

        -- The color of the scrollbar "thumb"; the portion that represents the current viewport
        scrollbar_thumb = '#F0ABA4',

        -- The color of the split lines between panes
        split = '#B798AA',

        ansi = {
            "#04060C", "#4B5B50", "#826973", "#717881", "#5976A8", "#7E85B1", "#A16A64",
            "#DB9991",
        },

        brights = {
            "#9B625C", "#4B5B50", "#826973", "#717881", "#5976A8", "#7E85B1", "#A16A64",
            "#E5C3C0" },
        tab_bar = {
            background = "#B798AA",
            active_tab = {
                bg_color = "#030308",
                fg_color = "#F0ABA4",
                intensity = "Normal",
                underline = "None",
                italic = false,
                strikethrough = false,
            },

            inactive_tab = {
                bg_color = "#B798AA",
                fg_color = "#030308",
            },

            inactive_tab_hover = {
                bg_color = "#B798AA",
                fg_color = "#F0ABA4",
                italic = true,
            },
        }
    }
end
