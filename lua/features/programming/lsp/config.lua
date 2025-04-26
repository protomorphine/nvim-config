require("features.programming.lsp.servers.lsp-zero")
require("features.programming.lsp.servers.csharp")
require("features.programming.lsp.servers.fsharp")
require("features.programming.lsp.servers.lua_config")
require("features.programming.lsp.servers.clangd")
require("features.programming.lsp.servers.cmake")

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

require("hover").setup {
    init = function()
        -- Require providers
        require("hover.providers.lsp")
        -- require('hover.providers.gh')
        -- require('hover.providers.gh_user')
        -- require('hover.providers.jira')
        -- require('hover.providers.dap')
        -- require('hover.providers.fold_preview')
        -- require('hover.providers.diagnostic')
        -- require('hover.providers.man')
        -- require('hover.providers.dictionary')
        -- require('hover.providers.highlight')
    end,
    preview_opts = {
        border = 'single'
    },
    -- Whether the contents of a currently open hover window should be moved
    -- to a :h preview-window when pressing the hover keymap.
    preview_window = false,
    title = true,
    mouse_providers = {
        'LSP'
    },
    mouse_delay = 1000
}
-- require('inlay-hint').setup()
vim.diagnostic.config({
    signs = false
})
