return {
    {
        'nvim-telescope/telescope.nvim',
        dependencies = {
            'nvim-lua/plenary.nvim',
        },
        config = function()
            require('telescope').setup {
                defaults = {
                    mappings = {
                        i = {
                            -- ["<C-j>"] = { "<Esc>", type = "command" },
                            ["<C-c>"] = { "<Esc>", type = "command" },
                            ["<C-h>"] = "which_key"
                        },
                        n = {
                            ["<C-c>"] = { "<Esc>", type = "command" },
                            -- ["<C-j>"] = { "<Esc>", type = "command" },
                            ["<C-h>"] = "which_key"
                        }
                    }
                },
            }

            local builtin = require('telescope.builtin')

            vim.keymap.set('n', '<leader>pd', builtin.diagnostics)
            vim.keymap.set('n', '<leader>pb', builtin.buffers)
            vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
            vim.keymap.set('n', '<C-p>', builtin.git_files, {})
            vim.keymap.set('n', '<leader>ps', builtin.live_grep, {});
            vim.keymap.set('n', '<leader>pWs', function()
                local word = vim.fn.expand("<cWORD>")
                builtin.grep_string({ search = word });
            end)
            vim.keymap.set('n', '<leader>pws', function()
                local word = vim.fn.expand("<cword>")
                builtin.grep_string({ search = word });
            end)
            vim.keymap.set('n', '<leader>pS', function()
                builtin.grep_string({ search = vim.fn.input('grep > ') });
            end)
        end
    }
}
