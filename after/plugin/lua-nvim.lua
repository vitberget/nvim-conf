vim.api.nvim_create_user_command( 'LuaNvimLSP',
function ()
    local lsp = require('lsp-zero')
    require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())
end, {}
)
