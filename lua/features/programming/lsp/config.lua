require("features.programming.lsp.langs.csharp")
require("features.programming.lsp.langs.fsharp")
require("features.programming.lsp.langs.lua_config")

vim.api.nvim_set_hl(0, "EasyDotnetTestRunnerFailed", { fg = "#cf6a4c", bg = "#151515" })
vim.api.nvim_set_hl(0, "EasyDotnetTestRunnerPassed", { fg = "#799d6a", bg = "#151515" })
vim.api.nvim_set_hl(0, "EasyDotnetTestRunnerRunning", { fg = "#fad07a", bg = "#151515" })
vim.api.nvim_set_hl(0, "FloatBorder", { bg = "#151515", fg = "#e8e8e8" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#151515" })

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
