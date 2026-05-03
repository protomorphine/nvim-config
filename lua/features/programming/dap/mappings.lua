local map = vim.keymap.set

map("n", "<leader>du", function() require("dapui").toggle() end, { desc = "Toogle DAP UI", silent = true })
map("n", "<leader>db", function() require("dap").toggle_breakpoint() end, { desc = "Toogle breakpoint", silent = true })

map("n", "<leader>dn", "<cmd>:DapNew<CR>", { desc = "Start new debugging session", silent = true })
map("n", "<leader>dc", "<cmd>:DapContinue<CR>", { desc = "Continue", silent = true })
map("n", "<leader>ds", "<cmd>:DapStop<CR>", { desc = "Stop", silent = true })

map("n", "<Down>", "<cmd>:DapStepOver<CR>", { desc = "Continue", silent = true })
map("n", "<Right>", "<cmd>:DapStepInto<CR>", { desc = "Continue", silent = true })
map("n", "<Left>", "<cmd>:DapStepOut<CR>", { desc = "Continue", silent = true })
map("n", "<Up>", "<cmd>:DapRestartFrame<CR>", { desc = "Continue", silent = true })
