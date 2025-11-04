require('Comment').setup()

local call = require('Comment.api').call

vim.keymap.set( 'n', "<leader>/",
    call('toggle.linewise.current', 'g@$'),
    { expr = true, desc = 'Comment toggle linewise' })

vim.keymap.set( 'x', "<leader>/",
    '<ESC><CMD>lua require("Comment.api").locked("toggle.linewise")(vim.fn.visualmode())<CR>',
    { desc = 'Comment toggle linewise (visual)' })
