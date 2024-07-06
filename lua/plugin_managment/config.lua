-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    spec = {
        { require("ui.file_tree.install") },
        { require("ui.colorscheme.install") },
        { require("ui.statusbar.install") },
        { require("ui.dashboard.install") },
        { require("ui.whichkey.install") },
        { require("ui.git.install") },
        { require("language_features.syntax_highlighting.install") },
        { require("language_features.lsp.install") },
        { require("language_features.completion.install") },
        { require("language_features.formating.install") },
        {
            "lukas-reineke/headlines.nvim",
            dependencies = "nvim-treesitter/nvim-treesitter",
            config = true, -- or `opts = {}`
        },
    },
    install = { colorscheme = { "habamax" } },
    checker = { enabled = true },
})
