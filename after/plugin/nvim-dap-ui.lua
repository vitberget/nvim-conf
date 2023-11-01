local dap, dapui = require("dap"), require("dapui")

dapui.setup()

dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

vim.keymap.set('n', '<Leader>ut', function () dapui.toggle() end)
vim.keymap.set('n', '<Leader>uo', function () dapui.open() end)
vim.keymap.set('n', '<Leader>uO', function () dapui.open({ reset=true }) end)
vim.keymap.set('n', '<Leader>uc', function () dapui.close() end)
