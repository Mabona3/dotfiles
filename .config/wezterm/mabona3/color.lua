return function(config)
    config.colors = {
        -- The default text color
        -- foreground = '#FFABC5',
        -- The default background color
        background = '#030308',

        -- Overrides the cell background color when the current cell is occupied by the
        -- cursor and the cursor style is set to Block
        cursor_bg = '#BFA7DF',
        -- Overrides the text color when the current cell is occupied by the cursor
        cursor_fg = '#030308',
        -- Specifies the border color of the cursor when the cursor style is set to Block,
        -- or the color of the vertical or horizontal bar when the cursor style is set to
        -- Bar or Underline.
        cursor_border = '#BFA7DF',

        -- the foreground color of selected text
        selection_fg = '#BFA7DF',
        -- the background color of selected text
        selection_bg = '#717894',

        -- The color of the scrollbar "thumb"; the portion that represents the current viewport
        scrollbar_thumb = '#FFABC5',

        -- The color of the split lines between panes
        split = '#BFA7DF',

        ansi = {
            "#04050C", "#717894", "#A26A7D", "#92744D", "#289EB5", "#7FA2FA", "#FF8099",
            "#FFA1BA",
        },

        brights = {
            "#D25D75", "#717894", "#A26A7D", "#92744D", "#289EB5", "#7FA2FA", "#FF8099",
            "#F7C7D4" },
        tab_bar = {
            background = "#BFA7DF",
            active_tab = {
                bg_color = "#030308",
                fg_color = "#FFABC5",
                intensity = "Normal",
                underline = "None",
                italic = false,
                strikethrough = false,
            },

            inactive_tab = {
                bg_color = "#BFA7DF",
                fg_color = "#030308",
            },

            inactive_tab_hover = {
                bg_color = "#BFA7DF",
                fg_color = "#FFABC5",
                italic = true,
            },
        }
    }
end
