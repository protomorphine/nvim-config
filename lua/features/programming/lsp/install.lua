return {
    { "seblj/roslyn.nvim", ft = "cs", },
    { "aznhe21/actions-preview.nvim" },
    { "MoaidHathot/dotnet.nvim", cmd = "DotnetUI", opts = {} },
    { "Wansmer/symbol-usage.nvim", event = "LspAttach", opts = {} },
    { "VonHeikemen/lsp-zero.nvim", branch = "v3.x", lazy = true, config = false, },
    { "nvimdev/lspsaga.nvim",
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "nvim-tree/nvim-web-devicons",
        },
    },
    {
        "neovim/nvim-lspconfig",
        event =         { "BufReadPre",             "BufNewFile"                        },
        cmd =           { "LspInfo",                "LspInstall", "LspStart"            },
        dependencies =  { "hrsh7th/cmp-nvim-lsp" ,  "williamboman/mason-lspconfig.nvim" },
    },
{
  'felpafel/inlay-hint.nvim',
  event = 'LspAttach',
  config = true,
}}
