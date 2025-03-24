require("neotest").setup({
    adapters = {
        require("neotest-dotnet")
    },
    status = {
        enabled = true,   -- Enable gutter icons
        signs = true,     -- Show signs in the gutter
        virtual_text = false, -- Disable virtual text (optional)
    },
    icons = {
        passed = "", -- Nerd Font icon (e.g., "✓")
        failed = "", -- Customize as needed
        running = "",
        skipped = "ﰸ",
        unknown = "",
    },
    -- Optional: Custom highlights
    highlights = {
        passed = "DiagnosticSignOk",
        failed = "DiagnosticSignError",
        skipped = "DiagnosticSignWarn",
        running = "DiagnosticSignInfo",
    },
    summary = {
        enabled = true,
        animated = true,
        follow = true,
        open = "split"
    }
})
