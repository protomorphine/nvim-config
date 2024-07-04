return {
  "folke/which-key.nvim",
  keys = { "<leader>", "<c-r>", "<c-w>", '"', "'", "`", "c", "v", "g" },
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,
}
