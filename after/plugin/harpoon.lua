local ui = require("harpoon.ui")
local mark = require("harpoon.mark")


vim.keymap.set("n", "<M-1>", function() ui.nav_file(1) end)
vim.keymap.set("n", "<M-2>", function() ui.nav_file(2) end)
vim.keymap.set("n", "<M-3>", function() ui.nav_file(3) end)
vim.keymap.set("n", "<M-4>", function() ui.nav_file(4) end)


vim.keymap.set("n", "<M-0>", function() mark.add_file() end)
vim.keymap.set("n", "<M-9>", function() ui.toggle_quick_menu() end)

vim.keymap.set("n", "<M-h>", function() ui.nav_prev() end)
vim.keymap.set("n", "<M-l>", function() ui.nav_next() end)


require("telescope").load_extension('harpoon')
vim.keymap.set("n", "<leader>th", ":Telescope harpoon marks<CR>" )


