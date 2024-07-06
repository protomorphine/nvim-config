local map = vim.keymap.set

map("n", "<leader><CR>", "<cmd>Lspsaga code_action<CR>")
map("n", "<C-F>", "<cmd>Lspsaga finder<CR>")
map("n", "K", "<cmd>Lspsaga hover_doc<CR>")
map("n", "<F2>", "<cmd>Lspsaga rename<CR>")
map("n", "<leader>pd", "<cmd>Lspsaga peek_definition<CR>")
map("n", "<leader>o", "<cmd>Lspsaga outline<CR>")
