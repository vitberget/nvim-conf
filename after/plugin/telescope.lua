require("telescope").setup { }
vim.keymap.set('n', '<leader>tt', ":TodoTelescope<CR>", { desc = "Telescope TODO" })
