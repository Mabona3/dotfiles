return function(config)
    config.colors = {
        -- The default text color
        foreground = '#FF6B61',
        -- The default background color
        background = '#010101',

        -- Overrides the cell background color when the current cell is occupied by the
        -- cursor and the cursor style is set to Block
        cursor_bg = '#F5767D',
        -- Overrides the text color when the current cell is occupied by the cursor
        cursor_fg = '#010101',
        -- Specifies the border color of the cursor when the cursor style is set to Block,
        -- or the color of the vertical or horizontal bar when the cursor style is set to
        -- Bar or Underline.
        cursor_border = '#F5767D',

        -- the foreground color of selected text
        selection_fg = '#F5767D',
        -- the background color of selected text
        selection_bg = '#474747',

        -- The color of the scrollbar "thumb"; the portion that represents the current viewport
        scrollbar_thumb = '#FF6B61',

        -- The color of the split lines between panes
        split = '#F5767D',

        ansi = {
            "#010101", "#474747", "#5E3A3A", "#996A70", "#838081", "#EA8098", "#DC3C42",
            "#FF5951",
        },

        brights = {
            "#D51B22", "#474747", "#5E3A3A", "#996A70", "#838081", "#EA8098", "#DC3C42",
            "#F7A3A0" },
        tab_bar = {
            background = "#F5767D",
            active_tab = {
                bg_color = "#010101",
                fg_color = "#FF6B61",
                intensity = "Normal",
                underline = "None",
                italic = false,
                strikethrough = false,
            },

            inactive_tab = {
                bg_color = "#F5767D",
                fg_color = "#010101",
            },

            inactive_tab_hover = {
                bg_color = "#F5767D",
                fg_color = "#FF6B61",
                italic = true,
            },
        }
    }
end
