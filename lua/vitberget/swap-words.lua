local function swapWords()
    local which_mark = vim.fn.getcharstr()
    local apos = vim.api.nvim_buf_get_mark(0, which_mark)
    local cpos = vim.api.nvim_win_get_cursor(0)

    local cword = vim.fn.expand('<cword>')
    vim.api.nvim_win_set_cursor(0, apos)
    local aword = vim.fn.expand('<cword>')

    vim.cmd(":norm \"_ciw" .. cword)
    vim.api.nvim_win_set_cursor(0, cpos)
    vim.cmd(":norm \"_ciw" .. aword)
    vim.api.nvim_win_set_cursor(0, cpos)
end

vim.api.nvim_create_user_command('SwapWords', swapWords, {})

vim.keymap.set('n', "<leader>sw", swapWords, {})
