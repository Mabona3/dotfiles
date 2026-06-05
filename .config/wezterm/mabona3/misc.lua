return function(config)
    config.webgpu_power_preference = "HighPerformance";
    config.animation_fps = 1;
    config.max_fps = 60;
    config.enable_wayland = true;
end
