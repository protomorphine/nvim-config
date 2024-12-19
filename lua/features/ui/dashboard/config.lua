return {
    bigfile = { enabled = true },
    dashboard = {
        enabled = true,
        sections = {
            {
                section = "terminal",
                cmd = "chafa ~/.config/nvim/dashboard/wall.jpg --format symbols --symbols vhalf --size 60x17 --stretch; sleep .1",
                height = 17,
                padding = 1,
            },
            {
                pane = 2,
                { section = "keys", gap = 1, padding = 1 },
                { section = "startup" },
            },
        },
    },
    notifier = { enabled = true, timeout = 3000 },
    -- quickfile = { enabled = true },
    statuscolumn = { enabled = true },
    words = { enabled = true },
    styles = {
        notification = {
            wo = { wrap = true }, -- Wrap notifications
        },
    },
}
