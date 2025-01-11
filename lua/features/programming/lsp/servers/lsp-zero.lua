-- Disable automatic setup, we are doing it manually
vim.g.lsp_zero_extend_cmp = 0
vim.g.lsp_zero_extend_lspconfig = 0

-- This is where all the LSP shenanigans will live
local lsp_zero = require("lsp-zero")
lsp_zero.extend_lspconfig()

lsp_zero.set_server_config({
    capabilities = {
        textDocument = {
            foldingRange = {
                dynamicRegistration = false,
                lineFoldingOnly = true,
            },
        },
    },
})
