local colors = require("features.ui.colorscheme.colors")
-- sets underline for selected buffer
vim.api.nvim_set_hl(0, "TabLineSel", { fg = colors.blue, bg = colors.bg })

require("bufferline").setup({
    highlights = {
        fill = { bg = "#151515" },
        info_selected = { bold = true },
        error_selected = { bold = true },
        buffer_selected = { bold = true },
        warning_selected = { bold = true },
        diagnostic_selected = { bold = true },
        info_diagnostic_selected = { bold = true },
        error_diagnostic_selected = { bold = true },
        warning_diagnostic_selected = { bold = true },
    },
    options = {
        separator_style = "thick",
        always_show_bufferline = true,
        show_close_icon = false,
        diagnostics = 'nvim_lsp',
        max_prefix_length = 8,
        indicator = { style = 'underline', },
    },
})
