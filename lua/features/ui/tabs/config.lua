vim.opt.termguicolors = true

require("bufferline").setup({
    options = {
        mode = "buffers",
        diagnostics = "nvim_lsp",
    },
})
