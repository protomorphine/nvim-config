vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local map = vim.keymap.set

-- move lines up and down
map("n", "<A-j>", ":m .+1<CR>==", { silent = true })     -- move line up(n)
map("n", "<A-k>", ":m .-2<CR>==", { silent = true })     -- move line down(n)
map("v", "<A-j>", ":m '>+1<CR>gv=gv", { silent = true }) -- move line up(v)
map("v", "<A-k>", ":m '<-2<CR>gv=gv", { silent = true }) -- move line down(v)

-- back to normal mode with jj
map("i", "jj", "<Esc>")

-- move right and left by L and H
map("n", "L", "$")
map("n", "H", "^")

-- sort selected lines
map("v", "<A-q>", ":sort<CR>", { silent = true })

require("features.ui.file_tree.mappings")
require("features.ui.telescope.mappings")
require("features.ui.git.mappings")
require("features.ui.tabs.mappings")
