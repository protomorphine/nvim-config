-- vim.cmd.colorscheme("jellybeans")

local colors = require("features.ui.colorscheme.colors")
require('kanagawa').setup({
    colors = {
        theme = {
            dragon = {
                ui = {
                    bg = colors.bg,
                    bg_gutter = colors.bg
                }
            }
        }
    },
})

vim.cmd("colorscheme kanagawa-dragon")
