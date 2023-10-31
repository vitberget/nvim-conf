require("telescope").setup {
    extensions = {
        ["ui-select"] = {
                  require("telescope.themes").get_dropdown {}
        }
    }
}
require("telescope").load_extension("ui-select")


local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>tf', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>tg', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)
vim.keymap.set('n', '<leader>tb', builtin.buffers, {})
vim.keymap.set('n', '<leader>tr', builtin.registers, {})
vim.keymap.set('n', '<leader>tw', builtin.lsp_dynamic_workspace_symbols, {})
