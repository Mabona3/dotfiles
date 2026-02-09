local wezterm = require('wezterm')

return function(config)
  config.use_fancy_tab_bar = false

  wezterm.on('format-tab-title', function(tab)
    local pane = tab.active_pane;
    local process = pane.foreground_process_name
    local cwd = pane.current_working_dir

    if process then
      process = process:gsub("(.*[/\\])", "");
    end

    if cwd then
      cwd = cwd.file_path or tostring(cwd);
      cwd = cwd:gsub(os.getenv("HOME") or '/home/mabona3/', "~");
    else
      cwd = '/';
    end

    return ' ' .. process .. ' ' .. cwd .. ' '
  end)

  config.tab_bar_at_bottom = true;
  config.hide_tab_bar_if_only_one_tab = true;
  config.show_new_tab_button_in_tab_bar = false;
end
