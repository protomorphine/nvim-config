return {
    "chrisgrieser/nvim-origami",
    event = "VeryLazy",
    opts = {
        foldtext = {
            lineCount = {
                hlgroup = "LspInlayHint"
            }
        }
    },

    init = function()
        vim.opt.foldlevel = 99
        vim.opt.foldlevelstart = 99
    end,
}
