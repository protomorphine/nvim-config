local util = require("formatter.util")

return {
    exe = "dotnet",
    args = { "format", "--include", util.get_current_buffer_file_path() },
}

-- require("formatter.filetypes.cs").dotnetformat()
