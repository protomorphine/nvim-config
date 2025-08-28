return {
    { "seblj/roslyn.nvim",           ft = "cs", },
    { "aznhe21/actions-preview.nvim" },
    { "MoaidHathot/dotnet.nvim",     cmd = "DotnetUI", opts = {} },
    {
        'oribarilan/lensline.nvim',
        tag = '1.0.0', -- or: branch = 'release/1.x' for latest non-breaking updates
        event = 'LspAttach',
        config = function()
            require("lensline").setup()
        end,
    },
    -- { "Wansmer/symbol-usage.nvim",   event = "LspAttach", opts = {} },
    { "VonHeikemen/lsp-zero.nvim", branch = "v3.x", lazy = true, config = false, },
    {
        "nvimdev/lspsaga.nvim",
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "nvim-tree/nvim-web-devicons",
        },
    },
    { "lewis6991/hover.nvim", },
    { "jubnzv/virtual-types.nvim", },
    { "kkoomen/vim-doge", },
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        cmd = { "LspInfo", "LspInstall", "LspStart" },
        dependencies = { "hrsh7th/cmp-nvim-lsp", "williamboman/mason-lspconfig.nvim" },
    },
    {
        "Fildo7525/pretty_hover",
        event = "LspAttach",
        opts = {}
    },
    { "krady21/compiler-explorer.nvim" }
}
