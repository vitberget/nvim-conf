local rt = require("rust-tools")
local mason_registry = require("mason-registry")

local codelldb_root = mason_registry.get_package("codelldb"):get_install_path() .. "/extension/"
local codelldb_path = codelldb_root .. "adapter/codelldb"
local liblldb_path = codelldb_root .. "lldb/lib/liblldb.so"

local opts = {
    server = {
        on_attach = function(_, bufnr)
            -- Hover actions
            --vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
            -- Code action groups
            --vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
        end,
    },
    dap = { adapter = require('rust-tools.dap').get_codelldb_adapter( codelldb_path, liblldb_path) }
}

rt.setup(opts)

vim.keymap.set("n", "<leader>Rr", ":RustRunnables<CR>" , {desc="Rust Runnables"})
vim.keymap.set("n", "<leader>Rd", ":RustDebuggables<CR>" , {desc="Rust Debuggables"})

vim.keymap.set("n", "<leader>Rmu", ":RustMoveItemUp<CR>", {desc="Rust move item Up"} )
vim.keymap.set("n", "<leader>Rmd", ":RustMoveItemDown<CR>", {desc="Rust move item Down"} )

vim.keymap.set("n", "<leader>Rh", ":RustHoverActions<CR>", {desc="Rust hover actions"})
vim.keymap.set("n", "<leader>Rj", ":RustJoinLines<CR>" , {desc="Rust join lines"})

vim.keymap.set("n", "<leader>Rp", ":RustParentModule<CR>", {desc="Rust parent module"} )
vim.keymap.set("n", "<leader>Rw", ":RustReloadWorkspace<CR>", {desc="Rust reload workspace"} )

