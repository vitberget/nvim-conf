local cwd = vim.fn.getcwd()
local conf_dir = vim.fn.stdpath("config")

local inside_conf_dir = string.find(cwd, conf_dir)
if inside_conf_dir then
    local lsp = require('lsp-zero')
    require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())
end
