return {
    { "Hoffs/omnisharp-extended-lsp.nvim" },
    { "neovim/nvim-lspconfig" },
    { "linrongbin16/lsp-progress.nvim" },
    { "williamboman/mason-lspconfig.nvim" },
    { "williamboman/mason.nvim" },
    {
        "nvimdev/lspsaga.nvim",
        dependencies = {
            "nvim-treesitter/nvim-treesitter", -- optional
            "nvim-tree/nvim-web-devicons", -- optional
        },
    },
}
