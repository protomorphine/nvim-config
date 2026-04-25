math.randomseed(os.time())
local splashes = { "skeleton", "shader", "lights", "finger", "aiface" }
local splash_preset = splashes[math.random(#splashes)]

return {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    dependencies = { "amansingh-afk/milli.nvim" },
    opts = function()
        local splash = require("milli").load({ splash = splash_preset })
        return {
            theme = "doom",
            config = {
                header = splash.frames[1], -- seed header with frame 0
                center = {
                    { icon = "  ", desc = "Find File", key = "f", action = "Telescope find_files" },
                    { icon = "  ", desc = "Quit",      key = "q", action = "qa" },
                },
            },
        }
    end,
    config = function(_, opts)
        require("dashboard").setup(opts)
        require("milli").dashboard({ splash = splash_preset, loop = true })
    end,
}
