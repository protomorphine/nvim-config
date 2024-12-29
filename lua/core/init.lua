-- Line Numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Clipboard
vim.opt.clipboard = "unnamedplus"

-- Indent Settings
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.smartindent = true

vim.opt.signcolumn = "yes"

vim.opt.cursorline = true

vim.opt.showmode = false
vim.opt.termguicolors = true
vim.opt.laststatus = 0

local api = vim.api

-- highlight yank
local highlight_group = api.nvim_create_augroup("YankHighlight", { clear = true })

api.nvim_create_autocmd("TextYankPost", {
    callback = function()
        vim.highlight.on_yank()
    end,
    group = highlight_group,
    pattern = "*",
})
