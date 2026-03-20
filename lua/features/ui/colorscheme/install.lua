return {
    { "rebelot/kanagawa.nvim" },
    {
        "wtfox/jellybeans.nvim",
        lazy = false,
        priority = 1000,
        opts = {
            transparent = false,
            italics = true,
            bold = true,
            flat_ui = false,                 -- toggles "flat UI" for pickers
            plugins = {
                all = false,
                auto = true, -- auto-detect installed plugins via lazy.nvim
            },
            on_highlights = function(hl, c)
                hl.Operator = { fg = require("features.ui.colorscheme.colors").red, bold = true }
            end,
        },
    }
}
