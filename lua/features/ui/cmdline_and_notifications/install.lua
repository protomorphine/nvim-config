return {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
        cmdline = { enabled = true, },
        messages = { enabled = true, },
        popupmenu = { enabled = true, },
        notify = { enabled = true, view = "notify", },
        lsp = {
            progress = { enabled = false, },
            hover = { enabled = false, },
            signature = { enabled = false, },
            message = { enabled = false, },
        },
    },
    dependencies = {
        "MunifTanjim/nui.nvim",
        "rcarriga/nvim-notify",
    }
}
