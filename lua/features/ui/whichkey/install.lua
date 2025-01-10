return {
    "folke/which-key.nvim",
    dependencies = { "echasnovski/mini.icons", version = false },
    event = "VeryLazy",
    init = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 300
    end,
}
