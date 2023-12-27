vim.g.mapleader = " "
vim.g.maplocalleader = ","

vim.keymap.set("n", "<leader>bn", ":bnext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<leader>bp", ":bprev<CR>", { desc = "Previous buffer" })
vim.keymap.set("n", "]b", ":bnext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "[b", ":bprev<CR>", { desc = "Previous buffer" })
vim.keymap.set("n", "]t", ":tabnext<CR>", { desc = "Next tab" })
vim.keymap.set("n", "[t", ":tabprev<CR>", { desc = "Previous tab" })
vim.keymap.set("n", "]T", ":+tabmove<CR>", { desc = "Move tab left" })
vim.keymap.set("n", "[T", ":-tabmove<CR>", { desc = "Move tab right" })
vim.keymap.set("n", "]q", ":cnext<CR>", { desc = "Next tab" })
vim.keymap.set("n", "[q", ":cNext<CR>", { desc = "Previous tab" })

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("n", "J", "mzJ`z")

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("x", "<leader>p", [["_dP]])

vim.keymap.set("n", "<leader>o", "o<ESC>")
vim.keymap.set("n", "<leader>O", "O<ESC>")

vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "<Leader>xp", "\"+p")
vim.keymap.set("v", "<Leader>xy", "\"+y")

vim.keymap.set("n", "<Leader>cc", ":w! | !~/.config/nvim/vim-compiler/vim-compiler <c-r>%<CR><CR>", {desc="My Compile"})
vim.keymap.set("n", "<Leader>cp", ":!~/.config/nvim/vim-compiler/vim-view-file <c-r>%<CR><CR>", {desc="My Preview"})

vim.keymap.set("n", "<Localleader>et", ":ConjureCljRunCurrentNsTests<CR>", {desc="Clj current ns tests"})

vim.keymap.set("n", "<Leader>T", ":tabnew<CR>", {desc="New tab"})
