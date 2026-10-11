return function(config)
    config.colors = {
        -- The default text color
        -- foreground = '#FF80C9',
        -- The default background color
        background = '#030308',

        -- Overrides the cell background color when the current cell is occupied by the
        -- cursor and the cursor style is set to Block
        cursor_bg = '#827DAE',
        -- Overrides the text color when the current cell is occupied by the cursor
        cursor_fg = '#030308',
        -- Specifies the border color of the cursor when the cursor style is set to Block,
        -- or the color of the vertical or horizontal bar when the cursor style is set to
        -- Bar or Underline.
        cursor_border = '#827DAE',

        -- the foreground color of selected text
        selection_fg = '#827DAE',
        -- the background color of selected text
        selection_bg = '#455955',

        -- The color of the scrollbar "thumb"; the portion that represents the current viewport
        scrollbar_thumb = '#FF80C9',

        -- The color of the split lines between panes
        split = '#827DAE',

        ansi = {
            "#04050C", "#455955", "#634156", "#5F72BA", "#894FA7", "#128298", "#A47FD2",
            "#F76CB4",
        },

        brights = {
            "#B5367C", "#455955", "#634156", "#5F72BA", "#894FA7", "#128298", "#A47FD2",
            "#F3ADD1" },
        tab_bar = {
            background = "#827DAE",
            active_tab = {
                bg_color = "#030308",
                fg_color = "#FF80C9",
                intensity = "Normal",
                underline = "None",
                italic = false,
                strikethrough = false,
            },

            inactive_tab = {
                bg_color = "#827DAE",
                fg_color = "#030308",
            },

            inactive_tab_hover = {
                bg_color = "#827DAE",
                fg_color = "#FF80C9",
                italic = true,
            },
        }
    }
end
