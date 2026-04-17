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
            flat_ui = false, -- toggles "flat UI" for pickers
            plugins = {
                all = false,
                auto = true, -- auto-detect installed plugins via lazy.nvim
            },
            on_highlights = function(hl, _)
                local colors = require("features.ui.colorscheme.colors")
                hl.Operator = { fg = colors.red, bold = true }
                hl["@lsp.type.extensionMethod.cs"] = { fg = colors.blue }
                hl.Title = { fg = colors.blue, bold = true }
            end,
        },
    }
}
