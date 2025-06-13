require("foldtext").setup({
    ignore_buftypes = {},
    ignore_filetypes = {},

    styles = {
        default = {
            { kind = "bufline" }
        },

        -- Custom foldtext.
        custom_a = {
            -- Only on these filetypes.
            filetypes = {},
            -- Only on these buftypes.
            buftypes = {},

            -- Only if this condition is
            -- true.
            condition = function(win)
                return vim.wo[win].foldmethod == "manual";
            end,

            -- Parts to create the foldtext.
            parts = {
                { kind = "fold_size" }
            }
        }
    }
});
