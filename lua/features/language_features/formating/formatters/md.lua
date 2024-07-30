local util = require("formatter.util")

return {
    exe = "mdformat",
    args = { util.get_current_buffer_file_dir() },
}
