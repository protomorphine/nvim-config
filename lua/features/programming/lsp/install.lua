return {
    { "seblj/roslyn.nvim",           ft = "cs",        lazy = false, },
    { "aznhe21/actions-preview.nvim" },
    { "MoaidHathot/dotnet.nvim",     cmd = "DotnetUI", opts = {} },
    {
        'oribarilan/lensline.nvim',
        tag = '1.0.0',
        event = 'LspAttach',
        config = function()
            require("lensline").setup()
        end,
    },
    {
        "nvimdev/lspsaga.nvim",
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "nvim-tree/nvim-web-devicons",
        },
    },
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        cmd = { "LspInfo", "LspInstall", "LspStart" },
        dependencies = { "hrsh7th/cmp-nvim-lsp", "williamboman/mason-lspconfig.nvim" },
    },
    {
        "Fildo7525/pretty_hover",
        event = "LspAttach",
        config = {}
    },
    { "krady21/compiler-explorer.nvim" },
    {
        "ray-x/go.nvim",
        dependencies = { -- optional packages
            "ray-x/guihua.lua",
            "neovim/nvim-lspconfig",
            "nvim-treesitter/nvim-treesitter",
        },
        opts = function()
            require("go").setup(opts)
            return {
                -- lsp_keymaps = false,
                -- other options
            }
        end,
        event = { "CmdlineEnter" },
        ft = { "go", 'gomod' },
        build = ':lua require("go.install").update_all_sync()' -- if you need to install/update all binaries
    },
    {
        "chrisgrieser/nvim-lsp-endhints",
        event = "LspAttach",
        opts = {}, -- required, even if empty
    },
    {
        "khoido2003/roslyn-filewatch.nvim",
        config = function()
            require("roslyn_filewatch").setup({})
        end,
    },
}
