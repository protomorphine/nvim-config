-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    spec = {
        { require("features.ui.md.install") },
        { require("features.ui.git.install") },
        { require("features.ui.tabs.install") },
        { require("features.ui.whichkey.install") },
        { require("features.ui.file_tree.install") },
        { require("features.ui.statusbar.install") },
        { require("features.ui.dashboard.install") },
        { require("features.ui.telescope.install") },
        { require("features.ui.colorscheme.install") },
        { require("features.ui.cmdline_and_notifications.intall") },
        { require("features.ui.inline_diagnostics.install") },
        { require("features.ui.folds.install") },
        { require("features.ui.ft_motion_hl.install") },
        { require("features.ui.json_visualizer.install") },

        { require("features.programming.lsp.install") },
        { require("features.programming.mason.install") },
        { require("features.programming.comments.install") },
        { require("features.programming.completion.install") },
        { require("features.programming.syntax_highlighting.install") },
        { require("features.programming.testing.install") },
    },
    install = { colorscheme = { "jellybeans" } },
    checker = { enabled = true },
})
