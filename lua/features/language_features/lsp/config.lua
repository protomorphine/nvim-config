require("features.language_features.lsp.langs.csharp")
require("features.language_features.lsp.langs.fsharp")
require("features.language_features.lsp.langs.lua_config")

-- refresh diagnostic
vim.api.nvim_create_autocmd({ "InsertLeave" }, {
    pattern = "*",
    callback = function()
        local clients = vim.lsp.get_clients({ name = "roslyn" })
        if not clients or #clients == 0 then
            return
        end

        local buffers = vim.lsp.get_buffers_by_client_id(clients[1].id)
        for _, buf in ipairs(buffers) do
            vim.lsp.util._refresh("textDocument/diagnostic", { bufnr = buf })
        end
    end,
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
