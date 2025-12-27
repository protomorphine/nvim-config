return {
    {
        "tris203/precognition.nvim",
        opts = {
            startVisible = true,
            showBlankVirtLine = true
        },
    },
    {

        "samiulsami/fFtT-highlights.nvim",
        config = function()
            require("fFtT-highlights"):setup({})
        end,
    }
}
