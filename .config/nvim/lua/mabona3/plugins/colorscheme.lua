function SetColorScheme(color)
  vim.cmd.colorscheme(color)
  vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
  vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
  vim.api.nvim_set_hl(0, 'NormalNC', { bg = 'none' })
  vim.api.nvim_set_hl(0, 'TelescopeNormal', { bg = 'none' })
  vim.api.nvim_set_hl(0, 'TelescopeBorder', { bg = 'none' })
  vim.api.nvim_set_hl(0, 'TelescopePromptNormal', { bg = 'none' })
  vim.api.nvim_set_hl(0, 'TelescopePromptBorder', { bg = 'none' })
  vim.api.nvim_set_hl(0, 'TelescopePreviewNormal', { bg = 'none' })
  vim.api.nvim_set_hl(0, 'TelescopePreviewBorder', { bg = 'none' })
  vim.api.nvim_set_hl(0, 'TelescopeResultsNormal', { bg = 'none' })
  vim.api.nvim_set_hl(0, 'TelescopeResultsBorder', { bg = 'none' })
end

return {
  'rebelot/kanagawa.nvim',
  -- 'roerohan/orng.nvim',
  -- 'folke/tokyonight.nvim',
  -- 'shaunsingh/nord.nvim',
  -- {
  --     'metalelf0/black-metal-theme-neovim',
  --     config = function()
  --         require('kanagawa').setup({
  --             undercurl = true,
  --             commentStyle = { italic = true },
  --             keywordStyle = { italic = true, bold = true },
  --             statementStyle = { bold = true },
  --             variablebuiltinStyle = { italic = true, bold = true },
  --             specialReturn = true,
  --             specialException = true,
  --             transparent = true,
  --             dimInactive = true,
  --             globalStatus = true,
  --         })
  --         require("black-metal").setup({
  --             variant = "dark",
  --             alt_bg = false,
  --             colored_docstrings = true,
  --             cursorline_gutter = true,
  --             dark_gutter = false,
  --             favor_treesitter_hl = false,
  --             plain_float = false,
  --             show_eob = true,
  --             term_colors = true,
  --             toggle_variant_key = nil,
  --             transparent = true,
  --             diagnostics = {
  --                 darker = true,
  --                 undercurl = true,
  --                 background = true,
  --             },
  --             code_style = {
  --                 comments = "italic",
  --                 conditionals = "none",
  --                 functions = "bold",
  --                 keywords = "bold",
  --                 headings = "bold",
  --                 operators = "none",
  --                 keyword_return = "italic",
  --                 strings = "italic",
  --                 variables = "none",
  --             },
  --         })
  -- end
  -- }
  config = function()
    SetColorScheme('kanagawa-dragon')
  end
}
