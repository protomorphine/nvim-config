local api = vim.api
local cmd = vim.cmd
local opt = vim.opt
local nvim_create_autocmd = api.nvim_create_autocmd
local nvim_set_hl = api.nvim_set_hl

-- disable swap files
opt.swapfile = false

-- Line Numbers
opt.number = true
opt.relativenumber = true

-- Clipboard
opt.clipboard = "unnamedplus"

-- Indent Settings
opt.expandtab = true
opt.shiftwidth = 4
opt.smartindent = true
opt.softtabstop = 4
opt.tabstop = 4

opt.signcolumn = "yes"

opt.cursorline = true

opt.showmode = false
opt.termguicolors = true
opt.laststatus = 0

-- show whitespaces in insert mode
opt.list = true

opt.listchars = {
    tab = "│─"
}

cmd([[match TrailingWhitespace /\s\+$/]])
nvim_set_hl(0, "TrailingWhitespace", { link = "Error" })

nvim_create_autocmd("InsertEnter", {
    callback = function()
        local space = "·"
        opt.listchars = {
            tab = "│─",
            multispace = space,
            lead = space,
            trail = space,
            nbsp = space
        }

        nvim_set_hl(0, "TrailingWhitespace", { link = "Whitespace" })
    end
})

nvim_create_autocmd("InsertLeave", {
    callback = function()
        local space = " "
        opt.listchars = {
            multispace = space,
            lead = space,
            trail = space,
            nbsp = space
        }

        nvim_set_hl(0, "TrailingWhitespace", { link = "Error" })
    end
})

-- highlight yank
local highlight_group = api.nvim_create_augroup("YankHighlight", { clear = true })

nvim_create_autocmd("TextYankPost", {
    callback = function()
        vim.highlight.on_yank()
    end,
    group = highlight_group,
    pattern = "*",
})
