require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = { "lua_ls", "omnisharp", "fsautocomplete" },
    automatic_installation = true,
})

require("features.language_features.lsp.langs.lua_config")
require("features.language_features.lsp.langs.csharp")
require("features.language_features.lsp.langs.fsharp")

require("lsp-progress").setup()

require("lspsaga").setup({
    ui = {
        code_action = "󰌵",
    },
    lightbulb = {
        sign = true,
        virtual_text = false,
        sign_priority = 0,
    },
})

-- listen lsp-progress event and refresh lualine
vim.api.nvim_create_augroup("lualine_augroup", { clear = true })
vim.api.nvim_create_autocmd("User", {
    group = "lualine_augroup",
    pattern = "LspProgressStatusUpdated",
    callback = require("lualine").refresh,
})

-- enable inlay_hint's when LSP activated
vim.api.nvim_create_autocmd("LspAttach", {
    callback = function()
        vim.lsp.inlay_hint.enable(true)
    end,
})
