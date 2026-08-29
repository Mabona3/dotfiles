local keymap = vim.keymap

keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

keymap.set("n", "J", "mxJ`x")

keymap.set("x", "<leader>p", "\"_dP")

keymap.set("n", "<leader>y", "\"+y")
keymap.set("n", "<leader>p", "\"+p")
keymap.set("v", "<leader>y", "\"+y")
keymap.set("v", "<leader>y", "\"+y")

keymap.set("i", '<a-b>', '<C-left>')
keymap.set("i", '<a-f>', '<C-right>')
keymap.set("i", '<c-b>', '<left>')
keymap.set("i", '<c-f>', '<right>')

keymap.set("n", '<c-u>', '<c-u>zz');
keymap.set("n", '<c-d>', '<c-d>zz');

keymap.set({ "n", "v" }, "<a-h>", "<c-w>h");
keymap.set({ "n", "v" }, "<a-j>", "<c-w>j");
keymap.set({ "n", "v" }, "<a-k>", "<c-w>k");
keymap.set({ "n", "v" }, "<a-l>", "<c-w>l");

keymap.set({ "n", "v" }, "<a-H>", "<c-w>H");
keymap.set({ "n", "v" }, "<a-J>", "<c-w>J");
keymap.set({ "n", "v" }, "<a-K>", "<c-w>K");
keymap.set({ "n", "v" }, "<a-L>", "<c-w>L");

keymap.set({ "n", "v" }, "<a-n>", "<cmd>tabn<cr>");
keymap.set({ "n", "v" }, "<a-N>", "<cmd>tabp<cr>");
keymap.set({ "n", "v" }, "<a-t>", "<c-w>T");

keymap.set({ "n", "v" }, "<a-m>", "<cmd>+tabm<cr>");
keymap.set({ "n", "v" }, "<a-M>", "<cmd>-tabm<cr>");

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
vim.keymap.set("n", "<leader>gs", "<cmd>tabnew %<cr>", { noremap = true, silent = true })
