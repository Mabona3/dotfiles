return {
    'williamboman/mason-lspconfig.nvim',
    dependencies = {
        'williamboman/mason.nvim',
        "neovim/nvim-lspconfig",
    },
    config = function()
        require('mason').setup()
        require('mason-lspconfig').setup({
            handlers = {
                function(server_name)
                    local cmp_lsp = require("cmp_nvim_lsp")
                    local capabilities = vim.tbl_deep_extend(
                        "force",
                        {},
                        vim.lsp.protocol.make_client_capabilities(),
                        cmp_lsp.default_capabilities())
                    vim.lsp.config[server_name].setup {
                        capabilities
                    }
                end
            }
        })

        vim.lsp.config.lua_ls = {
            on_init = function(client)
                local path = client.workspace_folders[1].name
                if vim.loop.fs_stat(path .. '/.luarc.json') or vim.loop.fs_stat(path .. '/.luarc.jsonc') then
                    return
                end

                client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
                })
            end,
            settings = {
                runtime = {
                    version = 'LuaJIT'
                },
                diagnostics = {
                    globals = { "vim" }
                },
                workspace = {
                    checkThirdParty = true,
                    library = {
                        vim.env.VIMRUNTIME
                    }
                }
            }
        }

        vim.lsp.config.asm_lsp = {
        }

        vim.lsp.config.qmlls = {
            cmd = { "qmlls6" },
        }
    end
}
