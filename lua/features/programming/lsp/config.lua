require("features.programming.lsp.servers.lsp-zero")
require("features.programming.lsp.servers.csharp")
require("features.programming.lsp.servers.fsharp")
require("features.programming.lsp.servers.lua_config")

require("features.programming.lsp.autocmd")

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

require('inlay-hint').setup()
