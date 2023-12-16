local harpoon = require("harpoon")
harpoon:setup()

vim.keymap.set("n", "<M-1>", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<M-2>", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<M-3>", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<M-4>", function() harpoon:list():select(4) end)

vim.keymap.set("n", "<M-0>", function() harpoon:list():append() end)
vim.keymap.set("n", "<M-9>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

require("telescope").load_extension('harpoon')
vim.keymap.set("n", "<leader>th", ":Telescope harpoon marks<CR>" )


