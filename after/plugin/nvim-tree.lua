require("nvim-tree").setup {}

local api = require("nvim-tree.api")
vim.keymap.set("n", "<M-`>", api.tree.toggle)
