local map = vim.keymap.set

map("n", "<leader>la", "<cmd>Lspsaga code_action<CR>", { desc = "show code actions" })
map("n", "<leader>lf", "<cmd>Lspsaga finder<CR>", { desc = "find refs" })
map("n", "<leader>lh", "<cmd>Lspsaga hover_doc<CR>", { desc = "hover" })
map("n", "<leader>lr", "<cmd>Lspsaga rename<CR>", { desc = "rename" })
map("n", "<leader>ld", "<cmd>Lspsaga peek_definition<CR>", { desc = "peek definition" })
map("n", "<leader>lo", "<cmd>Lspsaga outline<CR>", { desc = "outline" })

-- replaces vim.lsp.buf.definition()
map("n", "gd", "<cmd>lua require('omnisharp_extended').lsp_definition()<cr>")

-- replaces vim.lsp.buf.type_definition()
map("n", "<leader>D", "<cmd>lua require('omnisharp_extended').lsp_type_definition()<cr>")

-- replaces vim.lsp.buf.references()
map("n", "gr", "<cmd>lua require('omnisharp_extended').lsp_references()<cr>")

-- replaces vim.lsp.buf.implementation()
map("n", "gi", "<cmd>lua require('omnisharp_extended').lsp_implementation()<cr>")
