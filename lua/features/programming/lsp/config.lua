vim.lsp.enable("gopls")
vim.lsp.enable("clangd")
vim.lsp.enable("cmake")
vim.lsp.enable("fsautocomplete")
vim.lsp.enable("lua_ls")
vim.lsp.enable("roslyn")

local lspsaga = require("lspsaga")
lspsaga.setup({
    ui = {
        code_action = "󰌵",
    },
    lightbulb = {
        sign = true,
        virtual_text = false,
        sign_priority = 0,
    },
})

require("features.programming.lsp.autocmd")
