local colors = require("features.ui.colorscheme.colors")

-- highlight float windows
vim.api.nvim_set_hl(0, "SignColumn", { fg = "none", bg = "none" })
vim.api.nvim_set_hl(0, "FloatBorder", { bg = colors.bg, fg = colors.fg })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = colors.bg })
vim.api.nvim_set_hl(0, "Folded", { bg = "none" })
