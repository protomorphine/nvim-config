local util = require("formatter.util")

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
augroup("__formatter__", { clear = true })
autocmd("BufWritePost", {
	group = "__formatter__",
	command = ":FormatWrite",
})

return {
	require("formatter.filetypes.lua").stylua,

	function()
		if util.get_current_buffer_file_name() == "special.lua" then
			return nil
		end

		return {
			exe = "stylua",
			args = {
				"--search-parent-directories",
				"--stdin-filepath",
				util.escape_path(util.get_current_buffer_file_path()),
				"--",
				"-",
			},
			stdin = true,
		}
	end,
}
