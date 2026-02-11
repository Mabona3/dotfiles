local keymap = vim.keymap

vim.g.mapleader = " "

-- similar to vscode ctrl-alt-up and down in the visual mode.
keymap.set("v", "K", ":m '<-2<CR>gv=gv")
keymap.set("v", "J", ":m '>+1<CR>gv=gv")

keymap.set("n", "J", "mxJ`x")

keymap.set("x", "<leader>p", "\"_dP")

keymap.set("n", "<leader>y", "\"+y")
keymap.set("n", "<leader>p", "\"+p")
keymap.set("v", "<leader>y", "\"+y")
keymap.set("v", "<leader>y", "\"+y")

-- return to normal mode using <C-j> and <C-c>
keymap.set({ "i", "v", "s" }, "<C-c>", "<Esc>")

-- center when moving half screen
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")
keymap.set("n", "<C-f>", "<C-f>zz")
keymap.set("n", "<C-b>", "<C-b>zz")

-- buffer navigation
vim.keymap.set("n", "<Tab>", ":bnext<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<S-Tab>", ":bprevious<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>q", ":bdelete<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>d", ":bun<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>x", ":bun!<CR>", { noremap = true, silent = true })

-- Terminal creation
vim.keymap.set('n', '<leader>ts', '<cmd>vsp | terminal<cr><cmd>setlocal nobuflisted<CR>i',
  { noremap = true, silent = true })
vim.keymap.set('n', '<leader>tc', '<cmd>tabnew | terminal<cr><cmd>setlocal nobuflisted<CR>i',
  { noremap = true, silent = true })
