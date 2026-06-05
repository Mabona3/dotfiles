return {
  -- {
  --   'iamcco/markdown-preview.nvim',
  --   config = function()
  --     vim.keymap.set('n', '<leader>mt', '<cmd>MarkdownPreviewToggle<cr>')
  --   end
  -- },
  {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    config = function()
      vim.keymap.set('n', '<leader>mt', '<cmd>RenderMarkdown toggle<cr>')
    end
  }
  -- {
  --   "OXY2DEV/markview.nvim",
  --   dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' },
  --   config = function()
  --     local markview = require('markview')
  --     markview.setup {
  --       experimental = {
  --         check_rtp_message = false
  --       },
  --       preview = {
  --         filetypes     = { "markdown", "quarto", "rmd" },
  --         debounce      = 50,
  --         modes         = { "n", "no", "c" },
  --         buf_ignore    = { "nofile" },
  --         draw_range    = 100,
  --         enable        = true,
  --         max_buf_lines = 1000,
  --       },
  --       highlight_groups = "dynamic",
  --       inline_codes = {
  --         enable = true,
  --         hl = "MarkviewHeading3",
  --       },
  --       typst = {
  --         enable = true,
  --       },
  --       latex = {
  --         enable = true,
  --         parenthesis = {
  --           enable = true,
  --           hl = "@punctuation.brackets"
  --         },
  --         blocks = {
  --           enable = true,
  --           hl = "Code",
  --           text = { " LaTeX ", "Special" }
  --         },
  --         inlines = {
  --           enable = true
  --         },
  --         commands = {
  --           enable = true,
  --           configs = {
  --             sin = {
  --               operator = {
  --                 conceal = "",
  --                 virt_text = { { "𝚜𝚒𝚗", "Special" } }
  --               },
  --             }
  --           }
  --         },
  --         symbols = {
  --           enable = true,
  --           superscript = {
  --             enable = true,
  --             hl = "MarkviewLatexSuperscript"
  --           },
  --           hl = "@operator.latex",
  --         },
  --         subscripts = {
  --           enable = true,
  --           hl = "MarkviewLatexSubscript"
  --         },
  --       },
  --     }
  --     vim.keymap.set('n', '<leader>mt', '<cmd>Markview toggle<cr>')
  --   end
  -- },
}
