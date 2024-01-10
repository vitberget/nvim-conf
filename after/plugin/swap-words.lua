local function swapWords()
    local apos = vim.api.nvim_buf_get_mark(0, "a")
    local cpos = vim.api.nvim_win_get_cursor(0)

    local cword = vim.fn.expand('<cword>')
    vim.api.nvim_win_set_cursor(0, apos)
    local aword = vim.fn.expand('<cword>')

    vim.cmd(":norm diwi" .. cword)
    vim.api.nvim_win_set_cursor(0, cpos)

    vim.cmd(":norm diwi" .. aword)
end

vim.api.nvim_create_user_command('SwapWords', swapWords, {})

vim.keymap.set('n', "<leader>sw", swapWords)
