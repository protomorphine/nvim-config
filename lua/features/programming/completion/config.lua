vim.api.nvim_set_hl(0, 'BlinkCmpMenu', { link = 'NormalFloat' })
vim.api.nvim_set_hl(0, 'BlinkCmpMenuBorder', { link = 'FloatBorder' })

require("colorful-menu").setup({})
require("nvim-autopairs").setup()
