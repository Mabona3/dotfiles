return {
  'tpope/vim-fugitive',
  config = function()
    vim.keymap.set('n', "<leader>gc", "<cmd>Git<cr>", { noremap = true, silent = true })
    vim.keymap.set('n', "<leader>gd", "<cmd>Gdiffsplit! MERGE_HEAD<cr>", { noremap = true, silent = true })
    vim.keymap.set('n', "<leader>gD", "<cmd>Gdiffsplit! HEAD<cr>", { noremap = true, silent = true })
    vim.keymap.set('n', "<leader>gl", "<cmd>vsp | Gclog<cr>", { noremap = true, silent = true })
    vim.keymap.set('n', "<leader>gL", "<cmd>Git pull<cr>", { noremap = true, silent = true })
    vim.keymap.set('n', "<leader>gp", "<cmd>Git push<cr>", { noremap = true, silent = true })
  end
}
