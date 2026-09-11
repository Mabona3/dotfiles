local color = require("mabona3.color");

local function setColorScheme()
    local pickers = require('telescope.pickers')
    local finders = require('telescope.finders')
    local conf = require('telescope.config').values
    local actions = require('telescope.actions');
    local actions_state = require('telescope.actions.state')

    local colors = function(opts)
        opts = opts or {}
        pickers.new(opts, {
            prompt_title = "colors",
            finder = finders.new_table {
                results = { "kanagawa-dragon", "neon", "orng" }
            },
            sorter = conf.generic_sorter(opts),
        }):find()
    end

    -- to execute the function
    ChangeColorScheme(colors(require('telescope.themes').get_dropdown {}))
end

function InitColorScheme(name)
    vim.cmd.colorscheme(name)
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
    vim.api.nvim_set_hl(0, "DashboardHeader", { fg = "none", bg = "none" })
end

function ChangeColorScheme(name)
    InitColorScheme(name);
    vim.fn.writefile("return '" .. name .. "';", vim.fn.stdpath("config") .. "/lua/mabona3/color.lua");
end

return {
    {
        'rebelot/kanagawa.nvim',
        config = function()
            require('kanagawa').setup({
                undercurl = true,
                commentStyle = { italic = true },
                keywordStyle = { italic = true, bold = true },
                statementStyle = { bold = true },
                variablebuiltinStyle = { italic = true, bold = true },
                specialReturn = true,
                specialException = true,
                transparent = true,
                dimInactive = true,
                globalStatus = true,
            })
            vim.keymap.set("n", "<leader>pn", setColorScheme);
            InitColorScheme(color);
        end


    },
    'rafamadriz/neon',
    'roerohan/orng.nvim',
    'rose-pine/neovim',
    'folke/tokyonight.nvim',
    'shaunsingh/nord.nvim',
    {
        'metalelf0/black-metal-theme-neovim',
        config = function()
            require("black-metal").setup({
                variant = "dark",
                alt_bg = false,
                colored_docstrings = true,
                cursorline_gutter = true,
                dark_gutter = false,
                favor_treesitter_hl = false,
                plain_float = false,
                show_eob = true,
                term_colors = true,
                toggle_variant_key = nil,
                transparent = true,
                diagnostics = {
                    darker = true,
                    undercurl = true,
                    background = true,
                },
                code_style = {
                    comments = "italic",
                    conditionals = "none",
                    functions = "bold",
                    keywords = "bold",
                    headings = "bold",
                    operators = "none",
                    keyword_return = "italic",
                    strings = "italic",
                    variables = "none",
                },
            })
        end
    },
    {
        'daschw/leaf.nvim'
    }
}
