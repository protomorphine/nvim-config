local colors = require("features.ui.colorscheme.colors")

vim.api.nvim_set_hl(0, "NotifyERRORIcon", { fg = colors.red })
vim.api.nvim_set_hl(0, "NotifyWARNIcon", { fg = colors.yellow })
vim.api.nvim_set_hl(0, "NotifyINFOIcon", { fg = colors.blue })

vim.api.nvim_set_hl(0, "NotifyERRORTitle", { fg = colors.red })
vim.api.nvim_set_hl(0, "NotifyWARNTitle", { fg = colors.yellow })
vim.api.nvim_set_hl(0, "NotifyINFOTitle", { fg = colors.blue })

vim.api.nvim_set_hl(0, "NotifyERRORBorder", { fg = colors.red })
vim.api.nvim_set_hl(0, "NotifyWARNBorder", { fg = colors.yellow })
vim.api.nvim_set_hl(0, "NotifyINFOBorder", { fg = colors.blue })

vim.api.nvim_set_hl(0, "NoiceVirtualText", { fg = colors.gray })
vim.api.nvim_set_hl(0, "NoiceCmdlineIcon", { fg = colors.blue, bg = colors.bg })
vim.api.nvim_set_hl(0, "NoiceCmdlinePopupBorder", { fg = colors.blue, bg = colors.bg })
