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
vim.keymap.set('n', '<leader>tR', builtin.registers, { desc = "Telescope registers" })
vim.keymap.set('n', '<leader>tr', builtin.lsp_references, { desc = "Telescope references" })
vim.keymap.set('n', '<leader>tq', builtin.quickfix, { desc = "Telescope quickfix" })
vim.keymap.set('n', '<leader>tl', builtin.loclist, { desc = "Telescope loclist" })
