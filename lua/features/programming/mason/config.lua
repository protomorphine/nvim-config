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
})
