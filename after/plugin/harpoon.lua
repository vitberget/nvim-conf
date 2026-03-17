local harpoon = require("harpoon")
harpoon:setup()

vim.keymap.set("n", "<M-1>", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<M-2>", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<M-3>", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<M-4>", function() harpoon:list():select(4) end)
vim.keymap.set("n", "<M-5>", function() harpoon:list():select(5) end)
vim.keymap.set("n", "<M-6>", function() harpoon:list():select(6) end)
vim.keymap.set("n", "<M-7>", function() harpoon:list():select(7) end)
vim.keymap.set("n", "<M-8>", function() harpoon:list():select(8) end)

vim.keymap.set("n", "<M-0>", function() harpoon:list():add() end)
vim.keymap.set("n", "<M-9>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

vim.keymap.set("n", "<leader>1", function() harpoon:list():select(1) end, {desc="Harpoon 1"})
vim.keymap.set("n", "<leader>2", function() harpoon:list():select(2) end, {desc="Harpoon 2"})
vim.keymap.set("n", "<leader>3", function() harpoon:list():select(3) end, {desc="Harpoon 3"})
vim.keymap.set("n", "<leader>4", function() harpoon:list():select(4) end, {desc="Harpoon 4"})
vim.keymap.set("n", "<leader>5", function() harpoon:list():select(5) end, {desc="Harpoon 5"})
vim.keymap.set("n", "<leader>6", function() harpoon:list():select(6) end, {desc="Harpoon 6"})
vim.keymap.set("n", "<leader>7", function() harpoon:list():select(7) end, {desc="Harpoon 7"})
vim.keymap.set("n", "<leader>8", function() harpoon:list():select(8) end, {desc="Harpoon 8"})

vim.keymap.set("n", "<leader>0", function() harpoon:list():add() end, {desc="Harpoon add"})
vim.keymap.set("n", "<leader>9", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, {desc="Harpoon quick menu"})

vim.keymap.set("n", "[h", function() harpoon:list():prev() end, {desc="Harpoon prev"})
vim.keymap.set("n", "]h", function() harpoon:list():next() end, {desc="Harpoon next"})

require("telescope").load_extension('harpoon')
vim.keymap.set("n", "<leader>tH", ":Telescope harpoon marks<CR>", {desc="Telescope Harpoon"} )
