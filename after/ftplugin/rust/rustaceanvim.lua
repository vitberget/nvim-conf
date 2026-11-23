vim.keymap.set("n", "<leader>Rr", ":RustLsp runnables<CR>" , {desc="Rust Runnables"})
vim.keymap.set("n", "<leader>Rd", ":RustLsp debuggables<CR>" , {desc="Rust Debuggables"})
vim.keymap.set("n", "<leader>Rt", ":RustLsp testables<CR>" , {desc="Rust Testables"})

vim.keymap.set("n", "<leader>Rmu", ":RustLsp moveItem up<CR>", {desc="Rust move item Up"} )
vim.keymap.set("n", "<leader>Rmd", ":RustLsp moveItem down<CR>", {desc="Rust move item Down"} )

vim.keymap.set("n", "<leader>Rj", ":RustLsp joinLines<CR>" , {desc="Rust join lines"})

vim.keymap.set("n", "<leader>Rp", ":RustLsp parentModule<CR>", {desc="Rust parent module"} )
vim.keymap.set("n", "<leader>Ro", ":RustLsp openCargo<CR>", {desc="Rust Open Cargo"} )
vim.keymap.set("n", "<leader>Rw", ":RustLsp reloadWorkspace<CR>", {desc="Rust reload workspace"} )
vim.keymap.set("n", "<leader>Rb", ":terminal cargo build<CR>", {desc="Cargo build in Nvim terminal"} )
