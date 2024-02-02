require("nvim-tree").setup {
    view = { side = "right" }
}

local api = require("nvim-tree.api")
vim.keymap.set("n", "<M-`>", api.tree.toggle, { desc = "Nvim tree toggle" })
