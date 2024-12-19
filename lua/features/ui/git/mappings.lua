local map = vim.keymap.set

map("n", "<leader>gl", "<cmd>lua Snacks.lazygit.open()<CR>", { desc = "open lazy git" })
map("n", "<leader>gb", "<cmd>lua Snacks.git.blame_line()<CR>", { desc = "show git blame" })
