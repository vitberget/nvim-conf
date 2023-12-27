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

vim.keymap.set('n', '<Leader>ut', function () dapui.toggle() end, { desc = "DapUI Toggle" })
vim.keymap.set('n', '<Leader>uo', function () dapui.open() end, { desc = "DapUI Open" })
vim.keymap.set('n', '<Leader>uO', function () dapui.open({ reset=true }) end, {desc="DapUI Open reset"})
vim.keymap.set('n', '<Leader>uc', function () dapui.close() end, {desc="DapUI Close"})

vim.keymap.set('n', '<Leader>uh', function () dapui.float_element("scopes", { enter=true }) end, {desc="DapUI scopes"})
