local lsp_zero = require("lsp-zero")

require("mason").setup({
    registries = {
        "github:mason-org/mason-registry",
        "github:Crashdummyy/mason-registry",
    }
})

require("mason-lspconfig").setup({
    ensure_installed = {
        "roslyn",
        "fsautocomplete",
        "lua_ls"
    },
    handlers = { lsp_zero.default_setup, },
})
