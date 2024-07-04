require("lspconfig").omnisharp.setup({
    cmd = { vim.fn.stdpath("data") .. "/mason/bin/omnisharp" }
})
