local wezterm = require('wezterm');

return function(config)
  local font = {}
  font[0] = 'Terminus'
  font[1] = 'Iosevka'
  font[2] = 'JetBrains Mono'
  local weight = {}
  weight[0] = 'Regular'
  weight[1] = 'Light'
  weight[2] = 'ExtraLight'
  weight[3] = 'Bold'

  config.font = wezterm.font_with_fallback({
    {
      family = font[1],
      weight = weight[1],
    },
    "SymbolsNerd",
    'Noto Color Emoji',
    'Noto Naskh Arabic',
  });

  config.use_cap_height_to_scale_fallback_fonts = true
  config.font_size = 9;
end
