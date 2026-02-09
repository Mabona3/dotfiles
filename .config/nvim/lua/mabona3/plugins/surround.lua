return {
  "echasnovski/mini.surround",
  config = function()
    require('mini.surround').setup({
      custom_surroundings = nil,
      highlight_duration = 500,
      mappings = {
        add = 'ms',
        delete = 'ds',
        find = '',
        find_left = '',
        highlight = '',
        replace = 'cs',
        update_n_lines = 'yn',
        suffix_last = 'l',
        suffix_next = 'n',
      },
      n_lines = 20,
      respect_selection_type = true,
      search_method = 'cover_or_nearest',
      silent = false,
    })
  end
}
