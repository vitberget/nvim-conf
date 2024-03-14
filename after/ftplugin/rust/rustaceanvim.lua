vim.g.rustaceanvim = function()
    local mason_registry = require("mason-registry")

    local codelldb_root = mason_registry.get_package("codelldb"):get_install_path() .. "/extension/"
    local codelldb_path = codelldb_root .. "adapter/codelldb"
    local liblldb_path = codelldb_root .. "lldb/lib/liblldb.so"

    local cfg = require('rustaceanvim.config')
    return {
        dap = {
            adapter = cfg.get_codelldb_adapter(codelldb_path, liblldb_path),
        },
    }
end

vim.keymap.set("n", "<leader>Rr", ":RustLsp runnables<CR>" , {desc="Rust Runnables"})
vim.keymap.set("n", "<leader>Rd", ":RustLsp debuggables<CR>" , {desc="Rust Debuggables"})
vim.keymap.set("n", "<leader>Rt", ":RustLsp testables<CR>" , {desc="Rust Testables"})

vim.keymap.set("n", "<leader>Rmu", ":RustLsp moveItem up<CR>", {desc="Rust move item Up"} )
vim.keymap.set("n", "<leader>Rmd", ":RustLsp moveItem down<CR>", {desc="Rust move item Down"} )

-- vim.keymap.set("n", "<leader>Rh", ":RustLsp <CR>", {desc="Rust hover actions"})
vim.keymap.set("n", "<leader>Rj", ":RustLsp joinLines<CR>" , {desc="Rust join lines"})

vim.keymap.set("n", "<leader>Rp", ":RustLsp parentModule<CR>", {desc="Rust parent module"} )
vim.keymap.set("n", "<leader>Ro", ":RustLsp openCargo<CR>", {desc="Rust Open Cargo"} )
vim.keymap.set("n", "<leader>Rw", ":RustLsp reloadWorkspace<CR>", {desc="Rust reload workspace"} )
