return {
    {
        'tpope/vim-fugitive',
        config = function()
            vim.keymap.set('n', "<leader>gc", "<cmd>Git<cr>", { noremap = true, silent = true })
            vim.keymap.set('n', "<leader>gDm", "<cmd>Gvdiffsplit! MERGE_HEAD<cr>", { noremap = true, silent = true })
            vim.keymap.set('n', "<leader>gdm", "<cmd>Gvdiffsplit! HEAD<cr>", { noremap = true, silent = true })
            vim.keymap.set('n', "<leader>glm", "<cmd>vsp | Gclog<cr>", { noremap = true, silent = true })
            vim.keymap.set('n', "<leader>gLm", "<cmd>Git pull<cr>", { noremap = true, silent = true })
            vim.keymap.set('n', "<leader>gp", "<cmd>Git push<cr>", { noremap = true, silent = true })
        end
    },
    {
        "lewis6991/gitsigns.nvim",

        config = function()
            vim.keymap.set('n', "<leader>]g", "<cmd>Gitsigns next_hunk<cr>");
            vim.keymap.set('n', "<leader>[g", "<cmd>Gitsigns prev_hunk<cr>");
            vim.keymap.set('n', "<leader>glb", "<cmd>Gitsigns toggle_current_line_blame<cr>");

            require('gitsigns').setup({ current_line_blame_opts = { delay = 0, }, })
        end
    }
}
