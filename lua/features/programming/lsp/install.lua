local add_dotnet_specific_mappings = function()
    local map = vim.keymap.set

    ---@format disable
    map("n", "<leader>da",  "<cmd>:DotnetUI new_item<CR>",                  { desc = ".NET new item", silent = true                 })
    map("n", "<leader>dra", "<cmd>:DotnetUI project reference add<CR>",     { desc = ".NET add project reference", silent = true    })
    map("n", "<leader>drr", "<cmd>:DotnetUI project reference remove<CR>",  { desc = ".NET remove project reference", silent = true })
    map("n", "<leader>dpa", "<cmd>:DotnetUI project package add<CR>",       { desc = ".NET ada project package", silent = true      })
    map("n", "<leader>dpr", "<cmd>:DotnetUI project package remove<CR>",    { desc = ".NET remove project package", silent = true   })

    local dotnet = require("easy-dotnet")
    map("n", "<leader>dr",  function () dotnet.run() end,             { desc = ".NET run current", silent = true    })
    map("n", "<leader>db",  function () dotnet.build() end,           { desc = ".NET build", silent = true          })
    map("n", "<leader>dtr", function () dotnet.testrunner() end,      { desc = ".NET test runner", silent = true    })

    ---@format enable
end

local add_lsp_mappings = function(bufnr)
    local map = vim.keymap.set
    local telescope = require("telescope.builtin")

    ---@format disable

    map("n", "<leader>la", function() require("actions-preview").code_actions() end ,   { desc = "lsp: code actions",       buffer = bufnr, remap = false })
    map("n", "<leader>ld", function() telescope.lsp_type_definitions()          end,    { desc = "lsp: type definitions",   buffer = bufnr, remap = false })
    map("n", "<leader>le", function() telescope.diagnostics()                   end,    { desc = "lsp: diagnostics",        buffer = bufnr, remap = false })
    map("n", "<leader>li", function() telescope.lsp_implementations()           end,    { desc = "lsp: implemetations",     buffer = bufnr, remap = false })
    map("n", "<leader>lm", function() vim.lsp.buf.rename()                      end,    { desc = "lsp: rename",             buffer = bufnr, remap = false })
    map("n", "<leader>lr", function() telescope.lsp_references()                end,    { desc = "lsp: references",         buffer = bufnr, remap = false })

    map("n", "gd", function() vim.lsp.buf.definition() end, { desc = "lsp: go to definition", buffer = bufnr, remap = false })

    map("n", "[d", function() vim.diagnostic.goto_next() end, { desc = "lsp: go to next diagnostic", buffer = bufnr, remap = false })
    map("n", "]d", function() vim.diagnostic.goto_prev() end, { desc = "lsp: go to prev diagnostic", buffer = bufnr, remap = false })

    ---@format enable
end

---@param client vim.lsp.Client
local on_lsp_attach = function(client, bufnr)
    local utils = require("features.programming.lsp.utils")

    if client.name == "roslyn" then
        add_dotnet_specific_mappings()
    end

    add_lsp_mappings(bufnr)

    vim.lsp.inlay_hint.enable(true)

    utils.configure_format_on_save(client, bufnr)
    utils.monkey_patch_semantic_tokens(client)
end

return {
    {
        "neovim/nvim-lspconfig",
        cmd = { "LspInfo", "LspInstall", "LspStart" },
        event = { "BufReadPre", "BufNewFile" },
        dependencies = { { "hrsh7th/cmp-nvim-lsp" }, { "williamboman/mason-lspconfig.nvim" } },
        config = function()
            -- This is where all the LSP shenanigans will live
            local lsp_zero = require("lsp-zero")
            lsp_zero.extend_lspconfig()

            lsp_zero.on_attach(function(client, bufnr)
                on_lsp_attach(client, bufnr)
            end)

            lsp_zero.set_server_config({
                capabilities = {
                    textDocument = {
                        foldingRange = {
                            dynamicRegistration = false,
                            lineFoldingOnly = true,
                        },
                    },
                },
            })

            require("mason-lspconfig").setup({
                ensure_installed = {},
                handlers = { lsp_zero.default_setup, },
            })
        end,
    },
    {
        "VonHeikemen/lsp-zero.nvim",
        branch = "v3.x",
        lazy = true,
        config = false,
        init = function()
            -- Disable automatic setup, we are doing it manually
            vim.g.lsp_zero_extend_cmp = 0
            vim.g.lsp_zero_extend_lspconfig = 0
        end,
    },
    {
        "nvimdev/lspsaga.nvim",
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "nvim-tree/nvim-web-devicons",
        },
        opts = {
            ui = {
                code_action = "󰌵",
            },
            lightbulb = {
                sign = true,
                virtual_text = false,
                sign_priority = 0,
            },
        }
    },
    {
        "williamboman/mason.nvim",
        opts = {
            registries = {
                "github:mason-org/mason-registry",
                "github:Crashdummyy/mason-registry",
            }
        }
    },
    { "aznhe21/actions-preview.nvim" },
    { "williamboman/mason-lspconfig.nvim" },
    { "linrongbin16/lsp-progress.nvim",   opts = {} },
    { "seblj/roslyn.nvim",                ft = "cs", },
    { "Wansmer/symbol-usage.nvim",        event = "BufReadPre", opts = {} },
    { "MoaidHathot/dotnet.nvim",          cmd = "DotnetUI",     opts = {} },
    { "GustavEikaas/easy-dotnet.nvim",    dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" }, opts = {} },
}
