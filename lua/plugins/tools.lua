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
    'lambdalisue/suda.vim',
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
    {
        "folke/flash.nvim",
        event = "VeryLazy",
        opts = { modes = { search = { enabled = false, } } },
        keys = {
            { "<leader>ft", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
        },
    },
    {
        "julienvincent/nvim-paredit",
        config = function()
            require("nvim-paredit").setup()
        end
    },
    { 'simrat39/symbols-outline.nvim', opts = {} },
    {
        'crispgm/nvim-tabline',
        dependencies = { 'nvim-tree/nvim-web-devicons' }, -- optional
        config = true,
    },
    'RaafatTurki/hex.nvim'
}
