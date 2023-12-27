local jenkinsfile_linter = require("jenkinsfile_linter")
local autocmd = vim.api.nvim_create_autocmd   -- Create autocommand

vim.keymap.set('n', '<leader>jl', jenkinsfile_linter.validate, { desc = "Jenkins linter" })

autocmd('BufRead', {
    pattern = {'Jenkinsfile'},
    command = 'setfiletype groovy'
})

autocmd('BufNewFile', {
    pattern = {'Jenkinsfile'},
    command = 'setfiletype groovy'
})
