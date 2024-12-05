return {
    {
        'nvim-treesitter/nvim-treesitter',
        build = ":TSUpdate",
        config = function ()
            local configs = require("nvim-treesitter.configs")

            configs.setup({
                ensure_installed = { "c", "lua", "query", "javascript", "rust" },
                sync_install = false,
                auto_install = true,

                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = true,
                },

            })
        end
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
        init = function()
            vim.opt.clipboard = "unnamedplus"
            vim.opt.fixeol = false
        end,
        opts = {
            copy_sync = {
                enable = true,
                -- sync_registers = true,
                -- sync_registers_keymap_put = true,
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
        opts = {
            -- add any options here
        },
        dependencies = {
            -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
            "MunifTanjim/nui.nvim",
            -- OPTIONAL:
            --   `nvim-notify` is only needed, if you want to use the notification view.
            --   If not available, we use `mini` as the fallback
            "rcarriga/nvim-notify",
        }
    },
    'nvim-telescope/telescope-symbols.nvim',
    {
        'stevearc/oil.nvim',
        opts = {},
        -- Optional dependencies
        dependencies = { "nvim-tree/nvim-web-devicons" },
    },
    {
        "folke/zen-mode.nvim",
        opts = {
            window = {
                options = {
                    number = false,
                    relativenumber = false,
                }
            },
        }
    },
}
