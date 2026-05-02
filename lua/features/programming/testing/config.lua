require("neotest").setup({
    adapters = {
        require("neotest-dotnet"),
        require("neotest-go"),
    },
    status = {
        enabled = true,
        signs = true,
        virtual_text = false,
    },
    icons = {
        passed = "", -- Nerd Font icon (e.g., "✓")
        failed = "", -- Customize as needed
        running = "",
        skipped = "",
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
        open = "vsplit"
    }
})
