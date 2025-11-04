require('Comment').setup {
    post_hook = function(ctx)
        if ctx.range.srow == ctx.range.erow then
            local r = unpack(vim.api.nvim_win_get_cursor(0))
            local rcnt = vim.api.nvim_buf_line_count(0)

            if rcnt > r then
                vim.api.nvim_win_set_cursor(0, {r+1,0})
            end
        end
    end,
}

local api = require('Comment.api')

vim.keymap.set( 'n', "<leader>/",
    api.call('toggle.linewise.current', 'g@$'),
    { expr = true, desc = 'Comment toggle linewise' })

vim.keymap.set( 'x', "<leader>/",
    '<ESC><CMD>lua require("Comment.api").locked("toggle.linewise")(vim.fn.visualmode())<CR>',
    { desc = 'Comment toggle linewise (visual)' })
