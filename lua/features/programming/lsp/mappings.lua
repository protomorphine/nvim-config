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

    map({"n", "v"}, "<leader>la",  require("actions-preview").code_actions,   { desc = "lsp: code actions",       buffer = bufnr, remap = false })

    map("n", "<leader>ls", telescope.lsp_dynamic_workspace_symbols, { desc = "lsp: workspace symbols",  buffer = bufnr, remap = false })
    map("n", "<leader>ld", telescope.lsp_type_definitions,          { desc = "lsp: type definitions",   buffer = bufnr, remap = false })
    map("n", "<leader>le", telescope.diagnostics,                   { desc = "lsp: diagnostics",        buffer = bufnr, remap = false })
    map("n", "<leader>li", telescope.lsp_implementations,           { desc = "lsp: implemetations",     buffer = bufnr, remap = false })
    map("n", "<leader>lr", telescope.lsp_references,                { desc = "lsp: references",         buffer = bufnr, remap = false })
    map("n", "<leader>lm", vim.lsp.buf.rename,                      { desc = "lsp: rename",             buffer = bufnr, remap = false })
    map("n", "gd",         vim.lsp.buf.definition,                  { desc = "lsp: go to definition",   buffer = bufnr, remap = false })

    map("n", "<leader>lh", require("pretty_hover").hover, { desc = "lsp: open hover doc", buffer = bufnr, remap = false })

    ---@format enable
end

return M
