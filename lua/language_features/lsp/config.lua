require("mason").setup()

require("language_features.lsp.langs.lua_config")
require("language_features.lsp.langs.csharp")

require('lsp-progress').setup()
require('lspsaga').setup({
    lightbulb = {
        sign = true,
        virtual_text = false,
        sign_priority = 0
    }
})

vim.api.nvim_create_augroup("lualine_augroup", { clear = true })
vim.api.nvim_create_autocmd("User", {
  group = "lualine_augroup",
  pattern = "LspProgressStatusUpdated",
  callback = require("lualine").refresh,
})
