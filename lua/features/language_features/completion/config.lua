-- Here is where you configure the autocompletion settings.
local lsp_zero = require("lsp-zero")
lsp_zero.extend_cmp()

-- And you can configure cmp even more, if you want to.
local cmp = require("cmp")
local cmp_action = lsp_zero.cmp_action()

cmp.setup({
    snippet = {
        expand = function(args)
            require("luasnip").lsp_expand(args.body)
        end,
    },
    sources = {
        { name = "path" },
        { name = "nvim_lsp" },
        { name = "nvim_lua" },
        { name = "luasnip" },
        { name = "buffer" },
        { name = "nvim_lsp_signature_help" },
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    formatting = lsp_zero.cmp_format(),
})

require("luasnip.loaders.from_vscode").load({ paths = { "~/.config/snippets" } })
require("nvim-autopairs").setup()
