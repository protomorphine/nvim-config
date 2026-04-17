return {
    { "aznhe21/actions-preview.nvim" },
    { "krady21/compiler-explorer.nvim" },
    { "seblj/roslyn.nvim",              ft = "cs",                                                                            lazy = false, },
    { "MoaidHathot/dotnet.nvim",        cmd = "DotnetUI",                                                                     opts = {} },
    { "oribarilan/lensline.nvim",       tag = "1.0.0",                                                                        event = "LspAttach",                           config = {} },
    { "neovim/nvim-lspconfig",          event = { "BufReadPre", "BufNewFile" },                                               cmd = { "LspInfo", "LspInstall", "LspStart" }, dependencies = { "hrsh7th/cmp-nvim-lsp", "williamboman/mason-lspconfig.nvim" }, },
    { "Fildo7525/pretty_hover",         event = "LspAttach",                                                                  config = {} },
    { "chrisgrieser/nvim-lsp-endhints", event = "LspAttach",                                                                  opts = {}, },
    { "nvimdev/lspsaga.nvim",           dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons", }, },
    {
        "ray-x/go.nvim",
        dependencies = { -- optional packages
            "ray-x/guihua.lua",
            "neovim/nvim-lspconfig",
            "nvim-treesitter/nvim-treesitter",
        },
        opts = function()
            require("go").setup()
        end,
        event = { "CmdlineEnter" },
        ft = { "go", "gomod" },
        build = ":lua require('go.install').update_all_sync()"
    },
}
