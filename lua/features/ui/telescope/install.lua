return {
    { "nvim-telescope/telescope.nvim",           version = '*',                                     dependencies = { "nvim-lua/plenary.nvim", }, },
    { "nvim-telescope/telescope-ui-select.nvim", dependencies = { "nvim-telescope/telescope.nvim" } }
}
