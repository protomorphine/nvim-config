local capabilities = require("cmp_nvim_lsp").default_capabilities()

require("lspconfig").omnisharp.setup({
    capabilities = capabilities,
    cmd = { vim.fn.stdpath("data") .. "/mason/bin/omnisharp" },
})
