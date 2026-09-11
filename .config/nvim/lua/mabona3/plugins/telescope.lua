return {
    {
        'nvim-telescope/telescope.nvim',
        dependencies = {
            'nvim-lua/plenary.nvim',
            { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
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
                    },
                },
                extensions = {
                    fzf = {}
                }
            }

            require('telescope').load_extension('fzf')
            local builtin = require('telescope.builtin')

            -- this is not this useful for me but it is ok
            vim.keymap.set('n', '<leader>en', function()
                builtin.find_files {
                    cwd = vim.fn.stdpath("config")
                }
            end)

            vim.keymap.set('n', '<leader>pd', builtin.diagnostics)
            vim.keymap.set('n', '<leader>pb', builtin.buffers)
            vim.keymap.set('n', '<leader>pf', builtin.find_files)
            vim.keymap.set('n', '<leader>pF', function()
                builtin.find_files {
                    path_display = { shorten = 1 },
                }
            end)
            vim.keymap.set('n', '<leader>ph', builtin.help_tags)
            vim.keymap.set('n', '<C-p>', builtin.git_files)
            vim.keymap.set('n', '<leader>ps', builtin.live_grep)
            vim.keymap.set('n', '<leader>pWs', function()
                local word = vim.fn.expand("<cWORD>")
                builtin.grep_string({ search = word });
            end)
            vim.keymap.set('v', '<leader>fws', function()
                print(vim.fn.expand("'<,'>"));
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
