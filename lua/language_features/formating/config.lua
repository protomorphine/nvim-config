require("formatter").setup({
    logging = true,
    log_level = vim.log.levels.DEBUG,
    filetype = {
        lua = { require("language_features.formating.formatters.stylua") },
        cs = { require("language_features.formating.formatters.dotnet") },
    },
})

-- enable formating on save
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
augroup("__formatter__", { clear = true })
autocmd("BufWritePost", {
    group = "__formatter__",
    command = ":FormatWrite",
})
