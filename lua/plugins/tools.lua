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
    {
        "folke/flash.nvim",
        event = "VeryLazy",
        opts = {},
        keys = {
            { "<leader>fj", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
            { "<leader>ft", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
            -- { "<leader>fr", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
            -- { "<leader>fT", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
            -- { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
        },
    }
}
