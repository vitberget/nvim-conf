return {
    'will133/vim-dirdiff',
    'nvim-treesitter/nvim-treesitter',
    'nvim-treesitter/playground',
    'mbbill/undotree',
    'tpope/vim-fugitive',
    'airblade/vim-gitgutter',
    'nvim-tree/nvim-tree.lua',
    "jiangmiao/auto-pairs",
    "easymotion/vim-easymotion",
    "tpope/vim-surround",
    "mattn/emmet-vim",
    'guns/vim-sexp',
    'tpope/vim-sexp-mappings-for-regular-people',
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 700
        end,
        opts = { }
    },
    { "folke/twilight.nvim", opts = { } },
    'NvChad/nvim-colorizer.lua',
    "alexghergh/nvim-tmux-navigation",
}
