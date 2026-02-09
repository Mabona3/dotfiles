return {
  'folke/zen-mode.nvim',
  config = function()
    require("zen-mode").setup {
      window = {
        backdrop = 1,
        width = 1,
        height = 1,
      },
      plugins = {
        options = {
          enabled = true,
          ruler = true,
          showcmd = true,
        },
        twilight = { enabled = true },
        gitsigns = { enabled = false },
        tmux = { enabled = true },
        todo = { enabled = false },
      },
    }
    vim.keymap.set("n", "<leader>zz", "<cmd>ZenMode<cr>", { desc = "Toggle Zen Mode" })
  end
}
