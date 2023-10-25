local rt = require("rust-tools")

local codelldb_path = '/home/kenneth/.vscode-oss/extensions/vadimcn.vscode-lldb-1.10.0-universal/adapter/codelldb'
local liblldb_path = '/home/kenneth/.vscode-oss/extensions/vadimcn.vscode-lldb-1.10.0-universal/lldb/lib/liblldb.so'

local opts = {
    server = {
        on_attach = function(_, bufnr)
            -- Hover actions
            vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
            -- Code action groups
            vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
        end,
    },
    dap = { adapter = require('rust-tools.dap').get_codelldb_adapter( codelldb_path, liblldb_path) }
}

rt.setup(opts)
