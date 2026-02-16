local M = {}
--- @class vim.lsp.Client client vim.lsp.Client the LSP client

---Configures format on save when it's possible
---@param client vim.lsp.Client LSP client
---@param bufnr integer buffer
M.configure_format_on_save = function(client, bufnr)
    local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

    if client.name == "gopls" then
        vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
        vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
                require("go.format").goimports()
            end,
        })
        return
    end

    if client.supports_method("textDocument/formatting", bufnr) then
        vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
        vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
                vim.lsp.buf.format()
            end,
        })
    end
end

return M
