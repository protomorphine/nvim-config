require("formatter").setup({
	logging = true,
	log_level = vim.log.levels.WARN,
	filetype = {

		lua = { require("language_features.formating.formatters.stylua") },
		cs = { require("language_features.formating.formatters.dotnet") },

		["*"] = {
			require("formatter.filetypes.any").remove_trailing_whitespace,
		},
	},
})
