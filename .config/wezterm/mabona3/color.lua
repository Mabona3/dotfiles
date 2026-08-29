return function(config)
    config.colors = {
        -- The default text color
        foreground = '#FF94C7',
        -- The default background color
        background = '#030308',

        -- Overrides the cell background color when the current cell is occupied by the
        -- cursor and the cursor style is set to Block
        cursor_bg = '#D090CB',
        -- Overrides the text color when the current cell is occupied by the cursor
        cursor_fg = '#030308',
        -- Specifies the border color of the cursor when the cursor style is set to Block,
        -- or the color of the vertical or horizontal bar when the cursor style is set to
        -- Bar or Underline.
        cursor_border = '#D090CB',

        -- the foreground color of selected text
        selection_fg = '#D090CB',
        -- the background color of selected text
        selection_bg = '#583F46',

        -- The color of the scrollbar "thumb"; the portion that represents the current viewport
        scrollbar_thumb = '#FF94C7',

        -- The color of the split lines between panes
        split = '#D090CB',

        ansi = {
            "#06050C", "#583F46", "#8B717A", "#8B62B0", "#9D4863", "#A08BD0", "#E95C8D",
            "#FF86B8",
        },

        brights = {
            "#CF4878", "#583F46", "#8B717A", "#8B62B0", "#9D4863", "#A08BD0", "#E95C8D",
            "#F7BAD3" },
        tab_bar = {
            background = "#D090CB",
            active_tab = {
                bg_color = "#030308",
                fg_color = "#FF94C7",
                intensity = "Normal",
                underline = "None",
                italic = false,
                strikethrough = false,
            },

            inactive_tab = {
                bg_color = "#D090CB",
                fg_color = "#030308",
            },

            inactive_tab_hover = {
                bg_color = "#D090CB",
                fg_color = "#FF94C7",
                italic = true,
            },
        }
    }
end
