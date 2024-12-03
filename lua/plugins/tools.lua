return {
    'will133/vim-dirdiff',
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
    {
        "rayliwell/tree-sitter-rstml",
        dependencies = { "nvim-treesitter" },
        build = ":TSUpdate",
        config = function ()
            require("tree-sitter-rstml").setup()
        end
    },
    {
        "windwp/nvim-ts-autotag",
        config = function()
            require("nvim-ts-autotag").setup()
        end,
    },
    'nvim-treesitter/playground',
    'mbbill/undotree',
    -- 'tpope/vim-fugitive',
    -- 'airblade/vim-gitgutter',
    'nvim-tree/nvim-tree.lua',
    "jiangmiao/auto-pairs",
    "easymotion/vim-easymotion",
    "tpope/vim-surround",
    "tpope/vim-abolish",
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
    -- "alexghergh/nvim-tmux-navigation",
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
    -- { 'simrat39/symbols-outline.nvim', opts = {} },
    {
        'crispgm/nvim-tabline',
        dependencies = { 'nvim-tree/nvim-web-devicons' }, -- optional
        config = true,
    },
    'RaafatTurki/hex.nvim',
    {
        "cuducos/yaml.nvim",
        ft = { "yaml" }, -- optional
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "nvim-telescope/telescope.nvim", -- optional
        },
    },
    "mg979/vim-visual-multi",
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
    'phelipetls/jsonpath.nvim',
    {
        'stevearc/oil.nvim',
        opts = {},
        -- Optional dependencies
        dependencies = { "nvim-tree/nvim-web-devicons" },
    },
    {
        'cameron-wags/rainbow_csv.nvim',
        config = true,
        ft = {
            'csv',
            'tsv',
            'csv_semicolon',
            'csv_whitespace',
            'csv_pipe',
            'rfc_csv',
            'rfc_semicolon'
        },
        cmd = {
            'RainbowDelim',
            'RainbowDelimSimple',
            'RainbowDelimQuoted',
            'RainbowMultiDelim'
        }
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
