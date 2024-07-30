local wk = require("which-key")
wk.add({
    { "<leader>f", group = "file" }, -- group
    { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find File", mode = "n" },
    {
        mode = { "n", "v" }, -- NORMAL and VISUAL mode
        { "<leader>q", "<cmd>q<cr>", desc = "Quit" },
        { "<leader>w", "<cmd>w<cr>", desc = "Write" },
    },
})
