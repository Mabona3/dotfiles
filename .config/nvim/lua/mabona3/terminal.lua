local keymap = vim.keymap;

keymap.set("t", "<C-[>", "<c-\\><c-n>")
keymap.set("t", "<a-h>", "<c-\\><c-n><c-w>h");
keymap.set("t", "<a-k>", "<c-\\><c-n><c-w>k");
keymap.set("t", "<a-H>", "<c-\\><c-n><c-w>Hi");
keymap.set("t", "<a-K>", "<c-\\><c-n><c-w>Ki");
keymap.set("t", "<a-n>", "<cmd>tabn<cr>");
keymap.set("t", "<a-m>", "<cmd>+tabm<cr>");
keymap.set("t", "<a-t>", "<c-\\><c-n><c-w>T");
keymap.set("t", "<a-j>", "<c-\\><c-n><c-w>j");
keymap.set("t", "<a-J>", "<c-\\><c-n><c-w>Ji");
keymap.set("t", "<a-N>", "<cmd>tabp<cr>");
keymap.set("t", "<a-M>", "<cmd>-tabm<cr>");
keymap.set("t", "<a-l>", "<c-\\><c-n><c-w>l");
keymap.set("t", "<a-L>", "<c-\\><c-n><c-w>Li");

-- Terminal creation
keymap.set('n', '<leader>ts', '<cmd>vsp | terminal<cr><cmd>setlocal nobuflisted<CR>i',
  { noremap = true, silent = true })
keymap.set('n', '<leader>tS', '<cmd>sp | terminal<cr><cmd>setlocal nobuflisted<CR>i',
  { noremap = true, silent = true })
keymap.set('n', '<leader>tc', '<cmd>tabnew | terminal<cr><cmd>setlocal nobuflisted<CR>i',
  { noremap = true, silent = true })
