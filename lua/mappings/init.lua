vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

require("features.ui.file_tree.mappings")
require("features.ui.telescope.mappings")
require("features.ui.git.mappings")
require("features.ui.tabs.mappings")
require("features.language_features.completion.mappings")
require("features.language_features.lsp.mappings")
