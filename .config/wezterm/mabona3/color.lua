return function(config)
    config.colors = {
        -- The default text color
        foreground = '#5FF3D6',
        -- The default background color
        background = '#010504',

        -- Overrides the cell background color when the current cell is occupied by the
        -- cursor and the cursor style is set to Block
        cursor_bg = '#77AC81',
        -- Overrides the text color when the current cell is occupied by the cursor
        cursor_fg = '#010504',
        -- Specifies the border color of the cursor when the cursor style is set to Block,
        -- or the color of the vertical or horizontal bar when the cursor style is set to
        -- Bar or Underline.
        cursor_border = '#77AC81',

        -- the foreground color of selected text
        selection_fg = '#5FF3D6',
        -- the background color of selected text
        selection_bg = '#77AC81',

        -- The color of the scrollbar "thumb"; the portion that represents the current viewport
        scrollbar_thumb = '#77AC81',

        -- The color of the split lines between panes
        split = '#77AC81',

        ansi = {
            "#010706", "#3A6860", "#6A5B53", "#647E69", "#1983A1", "#9B7441", "#00BEA3",
            "#4FE6C9",
        },

        brights = {
            "#009E84", "#3A6860", "#6A5B53", "#647E69", "#1983A1", "#9B7441", "#00BEA3",
            "#9FEADC" },
        tab_bar = {
            background = "#77AC81",
            active_tab = {
                bg_color = "#010504",
                fg_color = "#5FF3D6",
                intensity = "Normal",
                underline = "None",
                italic = false,
                strikethrough = false,
            },

            inactive_tab = {
                bg_color = "#77AC81",
                fg_color = "#010504",
            },

            inactive_tab_hover = {
                bg_color = "#77AC81",
                fg_color = "#5FF3D6",
                italic = true,
            },
        }
    }
end
