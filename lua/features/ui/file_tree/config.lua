local colors = require("features.ui.colorscheme.colors")
vim.api.nvim_set_hl(0, 'NeotreeFloatBorder', { fg = colors.fg, bg = colors.bg })

require("neo-tree").setup({
    close_if_last_window = false,
    popup_border_style = "rounded",
    enable_git_status = true,
    enable_diagnostics = true,
    open_files_do_not_replace_types = { "terminal", "trouble", "qf" },
    sort_case_insensitive = false,
    default_component_configs = {
        container = {
            enable_character_fade = true,
        },
        indent = {
            indent_size = 2,
            padding = 1,
            with_markers = true,
            indent_marker = "│",
            last_indent_marker = "└",
            highlight = "NeoTreeIndentMarker",
            with_expanders = true,
            expander_collapsed = "",
            expander_expanded = "",
            expander_highlight = "NeoTreeExpander",
        },
        icon = {
            folder_closed = "",
            folder_open = "",
            folder_empty = "󰜌",
            default = "*",
            highlight = "NeoTreeFileIcon",
        },
        modified = {
            symbol = "[+]",
            highlight = "NeoTreeModified",
        },
        name = {
            trailing_slash = false,
            use_git_status_colors = true,
            highlight = "NeoTreeFileName",
        },
        git_status = {
            symbols = {
                added = "✚",
                modified = "",
                deleted = "✖",
                renamed = "󰁕",
                untracked = "",
                ignored = "",
                unstaged = "U",
                staged = "S",
                conflict = "",
            },
        },
        -- If you don't want to use these columns, you can set `enabled = false` for each of them individually
        file_size = {
            enabled = true,
            required_width = 64, -- min width of window required to show this column
        },
        last_modified = {
            enabled = true,
            required_width = 88, -- min width of window required to show this column
        },
        created = {
            enabled = true,
            required_width = 110, -- min width of window required to show this column
        },
        symlink_target = {
            enabled = false,
        },
    },
    filesystem = {
        filtered_items = {
            visible = false, -- when true, they will just be displayed differently than normal items
            hide_dotfiles = false,
            hide_gitignored = true,
            hide_hidden = true, -- only works on Windows for hidden files/directories
        },
        follow_current_file = {
            enabled = true,
            leave_dirs_open = true,
        },
        group_empty_dirs = false, -- when true, empty folders will be grouped together
        use_libuv_file_watcher = false,
    },
    buffers = {
        follow_current_file = {
            enabled = false,         -- This will find and focus the file in the active buffer every time
            leave_dirs_open = false, -- `false` closes auto expanded dirs, such as with `:Neotree reveal`
        },
        group_empty_dirs = true,     -- when true, empty folders will be grouped together
        show_unloaded = true,
    },
})
