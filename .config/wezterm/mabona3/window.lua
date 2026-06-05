return function(config)
    config.window_decorations = "NONE";

    config.window_background_opacity = 0.9;
    config.window_padding = {
        left = '0cell',
        right = '0cell',
        top = '0cell',
        bottom = '0cell',
    };

    config.window_frame = {
        border_left_width = '0cell',
        border_right_width = '0cell',
        border_bottom_height = '0cell',
        border_top_height = '0cell',
    }
    config.warn_about_missing_glyphs = false
end
