return function(config)
    config.colors = {
        -- The default text color
        foreground = '#CACAFF',
        -- The default background color
        background = '#030308',

        -- Overrides the cell background color when the current cell is occupied by the
        -- cursor and the cursor style is set to Block
        cursor_bg = '#A1A3CA',
        -- Overrides the text color when the current cell is occupied by the cursor
        cursor_fg = '#030308',
        -- Specifies the border color of the cursor when the cursor style is set to Block,
        -- or the color of the vertical or horizontal bar when the cursor style is set to
        -- Bar or Underline.
        cursor_border = '#A1A3CA',

        -- the foreground color of selected text
        selection_fg = '#A1A3CA',
        -- the background color of selected text
        selection_bg = '#525267',

        -- The color of the scrollbar "thumb"; the portion that represents the current viewport
        scrollbar_thumb = '#CACAFF',

        -- The color of the split lines between panes
        split = '#A1A3CA',

        ansi = {
            "#05050C", "#525267", "#76747B", "#6A6D94", "#787876", "#777C94", "#9292D0",
            "#BCBCFD",
        },

        brights = {
            "#7A7AB6", "#525267", "#76747B", "#6A6D94", "#787876", "#777C94", "#9292D0",
            "#D5D5F6" },
        tab_bar = {
            background = "#A1A3CA",
            active_tab = {
                bg_color = "#030308",
                fg_color = "#CACAFF",
                intensity = "Normal",
                underline = "None",
                italic = false,
                strikethrough = false,
            },

            inactive_tab = {
                bg_color = "#A1A3CA",
                fg_color = "#030308",
            },

            inactive_tab_hover = {
                bg_color = "#A1A3CA",
                fg_color = "#CACAFF",
                italic = true,
            },
        }
    }
end
