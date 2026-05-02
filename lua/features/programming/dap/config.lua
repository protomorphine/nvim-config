require("nvim-dap-virtual-text").setup()
require("dap-go").setup()
require("dapui").setup()

vim.cmd("hi DapBreakpointColor guifg=#fa4848")
vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "DapBreakpointColor", linehl = "", numhl = "" })
