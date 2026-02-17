vim.lsp.config("harper_ls", {
    settings = {
        ["harper-ls"] = {
          linters = {
            SentenceCapitalization = false,
            SpellCheck = false
          }
      }
  }
})
