local wezterm = require('wezterm');

return function(config)
    local font = {}
    font[0] = 'Terminus'
    font[1] = 'JetBrains Mono'
    font[2] = 'FiraCode Nerd Font Mono'
    font[3] = 'iosevka Nerd Font'
    font[4] = 'NotoSans Mono'
    local weight = {}
    weight[0] = 'Regular'
    weight[1] = 'Light'
    weight[2] = 'ExtraLight'
    weight[3] = 'Bold'
    weight[4] = 'SemiBold'

    config.font = wezterm.font_with_fallback({
        {
            family = font[3],
            weight = weight[3],
        },
        'Noto Color Emoji',
        "SymbolsNerd",
        'Noto Naskh Arabic',
    });

    config.use_cap_height_to_scale_fallback_fonts = true
    config.font_size = 9;
end
