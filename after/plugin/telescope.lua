require("telescope").setup {
    extensions = {
        ["ui-select"] = {
                  require("telescope.themes").get_dropdown {}
        }
    }
}
require("telescope").load_extension("ui-select")

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>tf', builtin.find_files, { desc = "Telescope find files" })
vim.keymap.set('n', '<leader>ts', builtin.git_status, { desc = "Telescote git status" })
vim.keymap.set('n', '<leader>tg', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end, { desc = "Telescope grep" })
vim.keymap.set('n', '<leader>tb', builtin.buffers, { desc = "Telescope buffers" })
vim.keymap.set('n', '<leader>tr', builtin.registers, { desc = "Telescope registers" })
vim.keymap.set('n', '<leader>tw', builtin.lsp_dynamic_workspace_symbols, { desc = "Telescope workspace symbols" })
vim.keymap.set('n', '<leader>tt', ":TodoTelescope<CR>", { desc = "Telescope TODO" })
