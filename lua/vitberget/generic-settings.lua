vim.opt.tabstop		= 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth	= 4
vim.opt.expandtab   = true

vim.opt.wrap        = false

vim.opt.swapfile    = false
vim.opt.backup      = false

os.execute("mkdir -p ~/.cache/nvim-undo")
vim.opt.undodir     = os.getenv("HOME") .. "/.cache/nvim-undo"
vim.opt.undofile    = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.scrolloff = 8

vim.opt.cursorline		= true
vim.opt.cursorcolumn	= true
vim.opt.number			= true
vim.opt.relativenumber	= true

vim.opt.listchars = {
    space = '_',
    tab = '  ⇥',
    eol = '↲',
    trail = '█',
    extends = '◀',
    precedes = '▶',
}

vim.o.ignorecase = true

vim.opt.termguicolors = true

vim.opt.updatetime = 50
vim.opt.colorcolumn = "120"

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.o.foldenable = false

vim.api.nvim_create_autocmd(
    "FileType", {
        callback = function()
            vim.opt.formatoptions:remove("c")
            vim.opt.formatoptions:remove("r")
            vim.opt.formatoptions:remove("o")
        end
    }
)
