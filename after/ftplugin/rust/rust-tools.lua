vim.keymap.set("n", "<leader>Rr", ":RustRunnables<CR>" , {desc="Rust Runnables"})
vim.keymap.set("n", "<leader>Rd", ":RustDebuggables<CR>" , {desc="Rust Debuggables"})

vim.keymap.set("n", "<leader>Rmu", ":RustMoveItemUp<CR>", {desc="Rust move item Up"} )
vim.keymap.set("n", "<leader>Rmd", ":RustMoveItemDown<CR>", {desc="Rust move item Down"} )

vim.keymap.set("n", "<leader>Rh", ":RustHoverActions<CR>", {desc="Rust hover actions"})
vim.keymap.set("n", "<leader>Rj", ":RustJoinLines<CR>" , {desc="Rust join lines"})

vim.keymap.set("n", "<leader>Rp", ":RustParentModule<CR>", {desc="Rust parent module"} )
vim.keymap.set("n", "<leader>Rw", ":RustReloadWorkspace<CR>", {desc="Rust reload workspace"} )

