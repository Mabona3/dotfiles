return {
    'hrsh7th/nvim-cmp',
    dependencies = {
        'hrsh7th/cmp-nvim-lsp',
        'rafamadriz/friendly-snippets',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-cmdline',
        'L3MON4D3/LuaSnip',
        'saadparwaiz1/cmp_luasnip',
        'j-hui/fidget.nvim',
    },
    config = function()
        require("fidget").setup({
            progress = {
                lsp = {
                    log_handler = true,
                },
            },
            notification = {
                window = {
                    winblend = 0,
                    align = "top",
                    relative = "editor",
                },
            },
        })

        local cmp = require('cmp')
        local ls = require("luasnip")
        vim.lsp.log.set_level("warn")

        require("luasnip.loaders.from_vscode").lazy_load()

        cmp.setup({
            sources = cmp.config.sources({
                    { name = 'nvim_lsp' },
                    { name = 'luasnip' },
                },
                {
                    name = "buffer"
                }),
            mapping = cmp.mapping.preset.insert({
                ['<C-p>'] = cmp.mapping.select_prev_item({ behavior = 'select' }),
                ['<C-n>'] = cmp.mapping.select_next_item({ behavior = 'select' }),
                -- ['<C-Space>'] = cmp.mapping.confirm({ select = false }),
                ['<C-y>'] = cmp.mapping.confirm({ select = false }),
                ['<TAB>'] = cmp.mapping.confirm({ select = false }),
                ['<C-u>'] = cmp.mapping.scroll_docs(-4),
                ['<C-d>'] = cmp.mapping.scroll_docs(4),
            }),
            snippet = {
                expand = function(args)
                    ls.lsp_expand(args.body)
                end,
            },
        })

        vim.diagnostic.config({
            virtual_text = true
        })
    end
}
