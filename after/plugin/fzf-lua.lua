require("fzf-lua").setup({
    keymap = {
        fzf = {
            ["ctrl-q"] = "select-all+accept",
        },
    },
})

local fzf = require('fzf-lua')

fzf.register_ui_select()

vim.keymap.set('n', '<leader>tf', fzf.files, { desc = "FZF find files" })
vim.keymap.set('n', '<leader>ts', fzf.git_status, { desc = "FZF git status" })
vim.keymap.set('n', '<leader>tg', fzf.grep, { desc = "FZF git grep" })
vim.keymap.set('n', '<leader>tc', fzf.grep_cword, { desc = "FZF grep current word" })
vim.keymap.set('n', '<leader>tb', fzf.buffers, { desc = "FZF buffers" })
vim.keymap.set('n', '<leader>tR', fzf.registers, { desc = "FZF registers" })
vim.keymap.set('n', '<leader>tr', fzf.lsp_references, { desc = "FZF references" })
vim.keymap.set('n', '<leader>td', fzf.diagnostics_document, { desc = "FZF diagnostics" })
vim.keymap.set('n', '<leader>tq', fzf.quickfix, { desc = "FZF quickfix" })
vim.keymap.set('n', '<leader>tl', fzf.loclist, { desc = "FZF loclist" })
vim.keymap.set('n', '<leader>tw', fzf.lsp_live_workspace_symbols, { desc = "FZF workspace symbols" })
