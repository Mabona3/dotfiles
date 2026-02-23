local keymap = vim.keymap

-- similar to vscode ctrl-alt-up and down in the visual mode.
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

keymap.set("n", "J", "mxJ`x")

keymap.set("x", "<leader>p", "\"_dP")

keymap.set("n", "<leader>y", "\"+y")
keymap.set("n", "<leader>p", "\"+p")
keymap.set("v", "<leader>y", "\"+y")
keymap.set("v", "<leader>y", "\"+y")

-- return to normal mode using <C-j> and <C-c>
keymap.set({ "i", "v", "s" }, "<C-c>", "<Esc>")

-- Terminal Like navigation in the insert mode
keymap.set("i", '<a-b>', '<C-left>')
keymap.set("i", '<a-f>', '<C-right>')
keymap.set("i", '<c-b>', '<left>')
keymap.set("i", '<c-f>', '<right>')

-- Terminal Mode pane naviation and tabs navigation
keymap.set("t", "<a-h>", "<c-\\><c-n><c-w>h");
keymap.set("t", "<a-j>", "<c-\\><c-n><c-w>j");
keymap.set("t", "<a-k>", "<c-\\><c-n><c-w>k");
keymap.set("t", "<a-l>", "<c-\\><c-n><c-w>l");
keymap.set("t", "<a-n>", "<c-\\><c-n>gt");
keymap.set("t", "<a-N>", "<c-\\><c-n>gT");
keymap.set("t", "<a-t>", "<c-\\><c-n><c-w>T");

keymap.set({ "n", "v" }, "<a-h>", "<c-w>h");
keymap.set({ "n", "v" }, "<a-j>", "<c-w>j");
keymap.set({ "n", "v" }, "<a-k>", "<c-w>k");
keymap.set({ "n", "v" }, "<a-l>", "<c-w>l");
keymap.set({ "n", "v" }, "<a-n>", "gt");
keymap.set({ "n", "v" }, "<a-N>", "gT");
keymap.set({ "n", "v" }, "<a-t>", "<c-w>T");

keymap.set("n", "<leader>pv", "<cmd>Ex<cr>");
keymap.set("n", "<leader>pE", "<cmd>Se<cr>");
keymap.set("n", "<leader>pe", "<cmd>Se!<cr>");

-- buffer navigation
vim.keymap.set("n", "<Tab>", "<cmd>bnext<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<S-Tab>", "<cmd>bprevious<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "<leader>qc", "<cmd>bdelete<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>dc", "<cmd>bun<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>xc", "<cmd>bun!<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "<leader>qp", "<cmd>bnext<CR><cmd>bdelete #<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>dp", "<cmd>bnext<CR><cmd>bun #<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>xp", "<cmd>bnext<CR><cmd>bun! #<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "gs", "<cmd>vsp<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "gS", "<cmd>sp<cr>", { noremap = true, silent = true })
-- Terminal creation
vim.keymap.set('n', '<leader>ts', '<cmd>vsp | terminal<cr><cmd>setlocal nobuflisted<CR>i',
  { noremap = true, silent = true })
vim.keymap.set('n', '<leader>tS', '<cmd>sp | terminal<cr><cmd>setlocal nobuflisted<CR>i',
  { noremap = true, silent = true })
vim.keymap.set('n', '<leader>tc', '<cmd>tabnew | terminal<cr><cmd>setlocal nobuflisted<CR>i',
  { noremap = true, silent = true })
