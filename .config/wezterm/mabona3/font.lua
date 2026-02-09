local wezterm = require('wezterm');

return function(config)
  config.font = wezterm.font_with_fallback({
    -- 'Terminus',
    'Iosevka light',
    'JetBrains Mono ExtraLight',
    'Noto Color Emoji',
    'Noto Naskh Arabic',
  });

  config.use_cap_height_to_scale_fallback_fonts = true
  config.font_size = 9;
end
