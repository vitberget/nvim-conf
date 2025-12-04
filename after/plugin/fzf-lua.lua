require("fzf-lua").setup({
    keymap = {
        fzf = {
            ["ctrl-q"] = "select-all+accept",
        },
    },
})

local fzf = require('fzf-lua')

fzf.register_ui_select()

vim.keymap.set('n', '<leader>to', function ()
    fzf.oldfiles({
        cwd_only = true,
        stat_file = true, -- verify files exist on disk
    })
end, { desc = "FZF find oldfiles" })
vim.keymap.set('n', '<leader>tf', fzf.files, { desc = "FZF find files" })
vim.keymap.set('n', '<leader>ts', fzf.git_status, { desc = "FZF git status" })
vim.keymap.set('n', '<leader>tS', fzf.search_history, { desc = "FZF search history" })
vim.keymap.set('n', '<leader>tj', fzf.jumps, { desc = "FZF jumps" })
vim.keymap.set('n', '<leader>tg', fzf.grep, { desc = "FZF git grep" })
vim.keymap.set('n', '<leader>tb', fzf.buffers, { desc = "FZF buffers" })
vim.keymap.set('n', '<leader>tc', fzf.grep_cword, { desc = "FZF grep current word" })
vim.keymap.set('n', '<leader>tC', fzf.command_history, { desc = "FZF command history" })
vim.keymap.set('n', '<leader>tm', fzf.marks, { desc = "FZF marks" })
vim.keymap.set('n', '<leader>tR', fzf.registers, { desc = "FZF registers" })
vim.keymap.set('n', '<leader>tr', fzf.lsp_references, { desc = "FZF references" })
vim.keymap.set('n', '<leader>td', fzf.diagnostics_document, { desc = "FZF diagnostics" })
vim.keymap.set('n', '<leader>tq', fzf.quickfix, { desc = "FZF quickfix" })
vim.keymap.set('n', '<leader>tl', fzf.loclist, { desc = "FZF loclist" })
vim.keymap.set('n', '<leader>tw', fzf.lsp_live_workspace_symbols, { desc = "FZF workspace symbols" })
