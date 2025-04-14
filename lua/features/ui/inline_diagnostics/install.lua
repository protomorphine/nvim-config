return {
    "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    config = function()
        local lsp_lines = require("lsp_lines")

        lsp_lines.setup()
        lsp_lines.toggle()

        -- Disable virtual_text since it's redundant due to lsp_lines.
        vim.diagnostic.config({ virtual_text = false, underline = false })
    end,
}
