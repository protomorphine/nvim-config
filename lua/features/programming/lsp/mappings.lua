local M = {}

M.add_dotnet_specific_mappings = function()
    local map = vim.keymap.set

    ---@format disable

    map("n", "<leader>da",  "<cmd>:DotnetUI new_item<CR>",                  { desc = ".NET new item", silent = true                 })
    map("n", "<leader>dpa", "<cmd>:DotnetUI project package add<CR>",       { desc = ".NET add project package", silent = true      })
    map("n", "<leader>dra", "<cmd>:DotnetUI project reference add<CR>",     { desc = ".NET add project reference", silent = true    })
    map("n", "<leader>dpr", "<cmd>:DotnetUI project package remove<CR>",    { desc = ".NET remove project package", silent = true   })
    map("n", "<leader>drr", "<cmd>:DotnetUI project reference remove<CR>",  { desc = ".NET remove project reference", silent = true })

    ---@format enable
end

M.add_lsp_mappings = function(bufnr)
    local map = vim.keymap.set
    local telescope = require("telescope.builtin")

    ---@format disable

    map({"n", "v"}, "<leader>la", function() require("actions-preview").code_actions() end ,   { desc = "lsp: code actions",       buffer = bufnr, remap = false })
    map("n", "<leader>ld", function() telescope.lsp_type_definitions()          end,    { desc = "lsp: type definitions",   buffer = bufnr, remap = false })
    map("n", "<leader>le", function() telescope.diagnostics()                   end,    { desc = "lsp: diagnostics",        buffer = bufnr, remap = false })
    map("n", "<leader>li", function() telescope.lsp_implementations()           end,    { desc = "lsp: implemetations",     buffer = bufnr, remap = false })
    map("n", "<leader>lm", function() vim.lsp.buf.rename()                      end,    { desc = "lsp: rename",             buffer = bufnr, remap = false })
    map("n", "<leader>lr", function() telescope.lsp_references()                end,    { desc = "lsp: references",         buffer = bufnr, remap = false })

    map("n", "gd", function() vim.lsp.buf.definition() end, { desc = "lsp: go to definition", buffer = bufnr, remap = false })

    map("n", "[d", function() vim.diagnostic.goto_next() end, { desc = "lsp: go to next diagnostic", buffer = bufnr, remap = false })
    map("n", "]d", function() vim.diagnostic.goto_prev() end, { desc = "lsp: go to prev diagnostic", buffer = bufnr, remap = false })

    map("n", "lh", "<cmd>Lspsaga hover_doc<CR>", { desc = "lsp: open hover doc", buffer = bufnr, remap = false })

    ---@format enable
end

return M
