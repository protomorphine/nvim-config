local map = vim.keymap.set

map("n", "<A-l>", "<CMD>bn<CR>", { silent = true, desc = "go to the next buffer" })
map("n", "<A-h>", "<CMD>bp<CR>", { silent = true, desc = "go to the prev buffer" })
map("n", "<leader>bq", "<CMD>bd<CR>", { silent = true, desc = "close current buffer" })
