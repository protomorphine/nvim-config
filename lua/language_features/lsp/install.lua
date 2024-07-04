return {
    { "neovim/nvim-lspconfig" },
    { "linrongbin16/lsp-progress.nvim" },
    { "williamboman/mason.nvim" },
    {
        "nvimdev/lspsaga.nvim",
        dependencies = {
            "nvim-treesitter/nvim-treesitter", -- optional
            "nvim-tree/nvim-web-devicons",     -- optional
        }
    }
}
