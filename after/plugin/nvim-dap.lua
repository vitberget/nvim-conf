vim.keymap.set("n", "<leader>dc", ":lua require'dap'.continue()<CR>", {desc="DAP Continue"})
vim.keymap.set("n", "<leader>db", ":lua require'dap'.toggle_breakpoint()<CR>", {desc="DAP breakpoint"})

vim.keymap.set({'n', 'v'}, '<Leader>dh', function()
    require('dap.ui.widgets').hover()
end, {desc="DAP hover"})
vim.keymap.set('n', '<Leader>df', function()
    local widgets = require('dap.ui.widgets')
    widgets.centered_float(widgets.frames)
end, {desc="DAP float"})
vim.keymap.set('n', '<Leader>ds', function()
    local widgets = require('dap.ui.widgets')
    widgets.centered_float(widgets.scopes)
end, {desc="DAP float"})

local cmd = vim.api.nvim_create_user_command
cmd('TestShowLog', 'split | e ' .. vim.fn.stdpath('cache') .. '/dap.log | normal! G', {})
