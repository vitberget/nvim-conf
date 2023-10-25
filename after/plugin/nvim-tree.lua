require("nvim-tree").setup {}

local api = require("nvim-tree.api")
vim.keymap.set("n", "<M-1>", api.tree.toggle)
