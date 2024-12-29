vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local map = vim.keymap.set

-- move lines up and down
map("n", "<A-j>", ":m .+1<CR>==")     -- move line up(n)
map("n", "<A-k>", ":m .-2<CR>==")     -- move line down(n)
map("v", "<A-j>", ":m '>+1<CR>gv=gv") -- move line up(v)
map("v", "<A-k>", ":m '<-2<CR>gv=gv") -- move line down(v)

require("features.ui.file_tree.mappings")
require("features.ui.telescope.mappings")
require("features.ui.git.mappings")
require("features.ui.tabs.mappings")
require("features.language_features.completion.mappings")
