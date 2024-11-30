local map = vim.keymap.set

map("n", "gt", "<CMD>bn<CR>", { silent = true, desc = "go to the next buffer" })
map("n", "gT", "<CMD>bp<CR>", { silent = true, desc = "go to the prev buffer" })
map("n", "bq", "<CMD>bd<CR>", { silent = true, desc = "close current buffer" })
