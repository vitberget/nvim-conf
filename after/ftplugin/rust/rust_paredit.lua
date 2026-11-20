require("rust_paredit").setup()

vim.keymap.set("n", ">}", "<cmd>RustSlurp<cr>")
vim.keymap.set("n", "<}", "<cmd>RustBarf<cr>")
vim.keymap.set("n", ">{", "<cmd>RustSlurpBack<cr>")
vim.keymap.set("n", "<{", "<cmd>RustBarfBack<cr>")
