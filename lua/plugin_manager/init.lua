-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    spec = {
        { require("features.ui.file_tree.install") },
        { require("features.ui.colorscheme.install") },
        { require("features.ui.statusbar.install") },
        { require("features.ui.dashboard.install") },
        { require("features.ui.whichkey.install") },
        { require("features.ui.git.install") },
        { require("features.ui.tabs.install") },
        { require("features.ui.telescope.install") },
        { require("features.language_features.syntax_highlighting.install") },
        { require("features.language_features.lsp.install") },
        { require("features.language_features.completion.install") },
        { require("features.language_features.formating.install") },
        { require("features.language_features.comments.install") },
    },
    install = { colorscheme = { "habamax" } },
    checker = { enabled = true },
})
