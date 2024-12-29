local dotnet_ui_mappings = function()
    local map = vim.keymap.set

    ---@format disable

    map("n", "<leader>na",  "<cmd>:DotnetUI new_item<CR>",                  { desc = ".NET new item", silent = true                 })
    map("n", "<leader>nb",  "<cmd>:DotnetUI file bootstrap<CR>",            { desc = ".NET bootstrap class", silent = true          })
    map("n", "<leader>nra", "<cmd>:DotnetUI project reference add<CR>",     { desc = ".NET add project reference", silent = true    })
    map("n", "<leader>nrr", "<cmd>:DotnetUI project reference remove<CR>",  { desc = ".NET remove project reference", silent = true })
    map("n", "<leader>npa", "<cmd>:DotnetUI project package add<CR>",       { desc = ".NET ada project package", silent = true      })
    map("n", "<leader>npr", "<cmd>:DotnetUI project package remove<CR>",    { desc = ".NET remove project package", silent = true   })

    ---@format enable
end

local lsp_mappings = function(bufnr)
    local map = vim.keymap.set
    local telescope = require("telescope.builtin")

    map("n", "<leader>ld", function()
        telescope.lsp_type_definitions()
    end, { desc = "lsp: type definitions", buffer = bufnr, remap = false })

    map("n", "<leader>lr", function()
        telescope.lsp_references()
    end, { desc = "lsp: references", buffer = bufnr, remap = false })

    map("n", "<leader>li", function()
        telescope.lsp_implementations()
    end, { desc = "lsp: implemetations", buffer = bufnr, remap = false })

    map("n", "gd", function()
        vim.lsp.buf.definition()
    end, { desc = "lsp: go to definition", buffer = bufnr, remap = false })

    map("n", "<leader>le", function()
        telescope.diagnostics()
    end, { desc = "lsp: diagnostics", buffer = bufnr, remap = false })

    map("n", "<leader>lws", function()
        vim.lsp.buf.workspace_symbol()
    end, { desc = "lsp: workspace_symbol", buffer = bufnr, remap = false })

    map("n", "[d", function()
        vim.diagnostic.goto_next()
    end, { desc = "lsp: go to next diagnostic", buffer = bufnr, remap = false })

    map("n", "]d", function()
        vim.diagnostic.goto_prev()
    end, { desc = "lsp: go to prev diagnostic", buffer = bufnr, remap = false })

    map("n", "<leader>la", function()
        require("actions-preview").code_actions()
    end, { desc = "lsp: code actions", buffer = bufnr, remap = false })

    map("n", "<leader>lm", function()
        vim.lsp.buf.rename()
    end, { desc = "lsp: rename", buffer = bufnr, remap = false })
end

--- @param client vim.lsp.Client the LSP client
local function monkey_patch_semantic_tokens(client)
    -- NOTE: Super hacky... Don't know if I like that we set a random variable on
    -- the client Seems to work though ~seblj
    if client.is_hacked then
        return
    end
    ---@diagnostic disable-next-line: inject-field
    client.is_hacked = true

    -- let the runtime know the server can do semanticTokens/full now
    if client.server_capabilities.semanticTokensProvider then
        client.server_capabilities = vim.tbl_deep_extend("force", client.server_capabilities, {
            semanticTokensProvider = {
                full = true,
            },
        })
    end

    -- monkey patch the request proxy
    local request_inner = client.request
    client.request = function(method, params, handler)
        if method ~= vim.lsp.protocol.Methods.textDocument_semanticTokens_full then
            return request_inner(method, params, handler)
        end

        local function find_buf_by_uri(search_uri)
            local bufs = vim.api.nvim_list_bufs()
            for _, buf in ipairs(bufs) do
                local name = vim.api.nvim_buf_get_name(buf)
                local uri = "file://" .. name
                if uri == search_uri then
                    return buf
                end
            end
        end

        local doc_uri = params.textDocument.uri

        local target_bufnr = find_buf_by_uri(doc_uri)
        local line_count = vim.api.nvim_buf_line_count(target_bufnr)
        local last_line = vim.api.nvim_buf_get_lines(target_bufnr, line_count - 1, line_count, true)[1]

        return request_inner("textDocument/semanticTokens/range", {
            textDocument = params.textDocument,
            range = {
                ["start"] = {
                    line = 0,
                    character = 0,
                },
                ["end"] = {
                    line = line_count - 1,
                    character = string.len(last_line) - 1,
                },
            },
        }, handler)
    end
end

local on_lsp_attach = function(client, bufnr)
    lsp_mappings(bufnr)
    dotnet_ui_mappings()

    -- configure format on save when possible
    local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
    if client.supports_method("textDocument/formatting") then
        vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
        vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
                vim.lsp.buf.format({ async = false })
            end,
        })
    end

    vim.lsp.inlay_hint.enable(true)
    monkey_patch_semantic_tokens(client)
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
    { "MoaidHathot/dotnet.nvim",          branch = "dev",       cmd = "DotnetUI", opts = {}, },
}
