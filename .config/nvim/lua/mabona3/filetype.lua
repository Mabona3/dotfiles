vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(ev)
        local opts = { buffer = ev.buf }
        vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition() end, opts)
        vim.keymap.set('n', 'K', function() vim.lsp.buf.hover() end, opts)
        vim.keymap.set('n', 'gD', function() vim.lsp.buf.declaration() end, opts)
        vim.keymap.set('n', 'gi', function() vim.lsp.buf.implementation() end, opts)
        vim.keymap.set('n', 'go', function() vim.lsp.buf.type_definition() end, opts)
        vim.keymap.set('n', '<leader>vrn', function() vim.lsp.buf.references() end, opts)
        vim.keymap.set('n', '<C-h>', function() vim.lsp.buf.signature_help() end, opts)
        vim.keymap.set('n', '<leader>rn', function() vim.lsp.buf.rename() end, opts)
        vim.keymap.set({ 'n', 'x' }, '<leader>vf', function() vim.lsp.buf.format({ async = true }) end, opts)
        vim.keymap.set('n', '<leader>vca', function() vim.lsp.buf.code_action() end, opts)
    end
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "cpp", "c" },
    callback = function(args)
        local opts = { noremap = true, silent = true }
        local bufnr = args.buf
        vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>cg',
            '<cmd>vs | terminal mkdir -p Debug && cd Debug && cmake .. && make<cr>i', opts)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>cr',
            '<cmd>vs | terminal make -C Debug && ./Debug/' ..
            vim.fn.fnamemodify(vim.fn.getcwd(), ":t") .. '<cr>i',
            opts)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>cd',
            '<cmd>vs | terminal make -C Debug && gdb ./Debug/' ..
            vim.fn.fnamemodify(vim.fn.getcwd(), ":t") .. '<cr>i',
            opts)
    end
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = { 'javascript', 'typescript', 'javascriptreact', 'typescriptreact' },
    callback = function(args)
        local opts = { noremap = true, silent = true }
        local bufnr = args.buf

        vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>cr', '<cmd>vs | terminal npm run dev<cr>i', opts)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>cg', '<cmd>vs | terminal node %<cr>i', opts)
    end
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "lua",
    callback = function(args)
        local opts = { noremap = true, silent = true }
        local bufnr = args.buf

        vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>cG', '<cmd>vs | terminal love .<cr>i', opts)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>cg', '<cmd>vs | terminal lua .<cr>i', opts)
    end
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "go",
    callback = function(args)
        local opts = { noremap = true, silent = true }
        local bufnr = args.buf

        vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>cg', '<cmd>vs | terminal go build ./...<cr>i', opts)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>cr', '<cmd>vs | terminal go run ./...<cr>i', opts)
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "rust",
    callback = function(args)
        local opts = { noremap = true, silent = true }
        local bufnr = args.buf
        vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>cb', '<cmd>vs | terminal cargo build<cr>i', opts)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>cr', '<cmd>vs | terminal cargo run<cr>i', opts)
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "python",
    callback = function()
        vim.keymap.set('n', '<leader>cr', '<cmd>vs | terminal python %<cr>i', { noremap = true, silent = true })
    end
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "tex",
    callback = function()
        vim.keymap.set('n', '<leader>cr', '<cmd>vs | terminal pdflatex %<cr>i',
            { noremap = true, silent = true })
    end
})
