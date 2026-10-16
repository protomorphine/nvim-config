-- Semantic UI palette mirroring the active terminal theme:
-- ~/.config/kitty/theme.conf -> "Kanagawa_dragon" (rebelot/kanagawa.nvim)
-- Keys are consumed by statusbar / tabs / file_tree / cmdline / highlights,
-- so names are kept stable; only the hues follow the palette.
local M = {
    -- base
    gray     = "#a6a69c", -- color8   sumi ink / inactive tab fg
    bg       = "#181616", -- background
    fg       = "#c5c9c5", -- foreground (color15)

    -- accents
    yellow   = "#e6c384", -- color11  gold
    cyan     = "#7aa89f", -- color14  dragon teal
    darkblue = "#8ba4b0", -- color4   muted blue
    green    = "#87a987", -- color10  shinryoku green
    orange   = "#b6927b", -- color16  amber
    violet   = "#a292a3", -- color5   pale mauve
    magenta  = "#938aa9", -- color13  fuji purple
    blue     = "#7fb4ca", -- color12  wave blue
    red      = "#c4746e", -- color1   peach red

    -- available but not wired up yet
    bg_deep         = "#12120f", -- active/inactive tab background
    black           = "#0d0c0c", -- color0
    selection_fg    = "#c8c093", -- selection_background fg / cursor / color7
    selection_bg    = "#2d4f67", -- selection_background
    url             = "#72a7bc", -- url_color
    red_bright      = "#e46876", -- color9
    green_muted     = "#8a9a7b", -- color2
    orange_muted    = "#b98d7b", -- color17
}

return M
