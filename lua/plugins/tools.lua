return {
    {
        "https://github.com/arborist-ts/arborist.nvim",
        opts = { update_cadence = "daily" }
    },
    "easymotion/vim-easymotion",
    "tpope/vim-surround",
    "tpope/vim-abolish",
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
    {
        "aserowy/tmux.nvim",
        opts = {
            copy_sync = {
                enable = true,
                redirect_to_clipboard = false,
            },
            navigation = {
                enable_default_keybindings = false
            }
        },
        keys = {
            { "<C-w>h", mode = {"n"}, function () require("tmux").move_left() end, desc = "Navigate left" },
            { "<C-w>j", mode = {"n"}, function () require("tmux").move_bottom() end, desc = "Navigate down" },
            { "<C-w>k", mode = {"n"}, function () require("tmux").move_top() end, desc = "Navigate up" },
            { "<C-w>l", mode = {"n"}, function () require("tmux").move_right() end, desc = "Navigate right" },
        },
    },
    {
        "julienvincent/nvim-paredit",
        config = function()
            require("nvim-paredit").setup()
        end
    },
    {
        'crispgm/nvim-tabline',
        dependencies = { 'nvim-tree/nvim-web-devicons' }, -- optional
        config = true,
    },
    'RaafatTurki/hex.nvim',
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        opts = { },
        dependencies = {
            "MunifTanjim/nui.nvim",
            "rcarriga/nvim-notify",
        }
    },
    {
        'stevearc/oil.nvim',
        opts = {},
        dependencies = { "nvim-tree/nvim-web-devicons" },
    },
    {
        "ibhagwan/fzf-lua",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = { }
    },
}
