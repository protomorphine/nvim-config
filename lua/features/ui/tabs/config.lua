-- sets underline for selected buffer
vim.api.nvim_set_hl(0, "TabLineSel", { fg = "#8197bf", bg = "#151515" })

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

        ---@diagnostic disable-next-line: unused-local
        diagnostics_indicator = function(count, level, diagnostics_dict, context)
            if context.buffer:current() then
                return ''
            end
            if level:match('error') then
                return ' ' .. vim.g.diagnostic_icons.Error
            elseif level:match('warning') then
                return ' ' .. vim.g.diagnostic_icons.Warning
            end
            return ''
        end,
    },
})
