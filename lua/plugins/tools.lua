return {
    { 'nfnty/vim-nftables' },
    'will133/vim-dirdiff',
    { 'echasnovski/mini.nvim', version = '*' },
    { 'nvim-treesitter/nvim-treesitter-textobjects' },
    {
        'Wansmer/treesj',
        keys = { '<space>m', '<space>j', '<space>s' },
        dependencies = { 'nvim-treesitter/nvim-treesitter' }, -- if you install parsers with `nvim-treesitter`
        config = function()
            require('treesj').setup({--[[ your config ]]})
        end,
    },
    {
        'nvim-treesitter/nvim-treesitter',
        build = ":TSUpdate",
        config = function ()
            local configs = require("nvim-treesitter.configs")

            configs.setup({
                ensure_installed = { "lua", "query", "rust" },
                sync_install = false,
                auto_install = true,

                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = true,
                },
                textobjects = {
                    select = {
                        enable = true,
                        lookahead= true,
                        keymaps = {
                            -- You can use the capture groups defined in textobjects.scm
                            ["af"] = "@function.outer",
                            ["if"] = "@function.inner",
                            ["az"] = "@block.outer",
                            ["iz"] = "@block.inner",
                        },
                    },
                    move = {
                        enable = true,
                        set_jumps = true,
                        goto_next_start = {
                            ["]f"] = "@function.outer",
                            ["]F"] = "@function.inner",
                            ["]["] = "@class.outer",
                            ["]/"] = "@comment.outer",
                            ["]z"] = "@block.outer",
                            ["]C"] = "@conditional.outer",
                        },
                        goto_previous_start = {
                            ["[f"] = "@function.outer",
                            ["[F"] = "@function.inner",
                            ["[["] = "@class.outer",
                            ["[/"] = "@comment.outer",
                            ["[z"] = "@block.outer",
                            ["[C"] = "@conditional.outer",
                        },
                    },
                    -- swap = {
                    --     enable = true,
                    --     swap_next = {
                    --         ["<leader>sz"] = "@block.inner"
                    --     }
                    -- }
                }

            })
        end
    },
    {
        'chomosuke/typst-preview.nvim',
        lazy = false, -- or ft = 'typst'
        version = '1.*',
        opts = {}, -- lazy.nvim will implicitly calls `setup {}`
    },
    {
        "windwp/nvim-ts-autotag",
        config = function()
            require("nvim-ts-autotag").setup()
        end,
    },
    'nvim-treesitter/playground',
    'mbbill/undotree',
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        config = true,
        opts = {
            disable_in_visualblock = true,
            enable_check_bracket_line = false,
        },
        keys = {
            { "<leader>at", mode = { "n" }, function() require("nvim-autopairs").toggle() end, desc = "Autopairs Toggle" },
            { "<leader>ae", mode = { "n" }, function() require("nvim-autopairs").enable() end, desc = "Autopairs Enable" },
            { "<leader>ad", mode = { "n" }, function() require("nvim-autopairs").disable() end, desc = "Autopairs Disable" },
        },
    },
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
    'NvChad/nvim-colorizer.lua',
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
        "folke/flash.nvim",
        event = "VeryLazy",
        opts = { modes = { search = { enabled = false, } } },
        keys = {
            { "<leader>ft", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
            { "<leader>fT", mode = { "n", "x", "o" }, function() require("flash").treesitter_search() end, desc = "Flash Treesitter Search" },
            { "<leader>fj", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash Jump" },
            { "<leader>fr", mode = { "n", "x", "o" }, function() require("flash").remote() end, desc = "Flash Remote" },
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
        "cuducos/yaml.nvim",
        ft = { "yaml" }, -- optional
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "nvim-telescope/telescope.nvim", -- optional
        },
    },
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        opts = {
            -- presets = {
            --     lsp_doc_border = true,
            -- },
            lsp = {
                signature = {
                    enabled = false,
                },
            },
        },
        dependencies = {
            -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
            "MunifTanjim/nui.nvim",
            -- OPTIONAL:
            --   `nvim-notify` is only needed, if you want to use the notification view.
            --   If not available, we use `mini` as the fallback
            "rcarriga/nvim-notify",
        },
        keys = {
            { "<leader>nd", mode = { "n" }, ":NoiceDismiss<CR>", desc = "NoiceDismiss" },
        },
    },
    'phelipetls/jsonpath.nvim',
    {
        'Einenlum/yaml-revealer',
        config = function()
            -- Recommended for Neovim users
            vim.g.yaml_revealer_display_mode = 'statusline'
        end,
        ft = 'yaml',
    },
    {
        'stevearc/oil.nvim',
        opts = {},
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
    -- {
    --     "folke/zen-mode.nvim",
    --     opts = {
    --         window = {
    --             options = {
    --                 number = false,
    --                 relativenumber = false,
    --             }
    --         },
    --     }
    -- },
    {
        "ibhagwan/fzf-lua",
        -- optional for icon support
        dependencies = { "nvim-tree/nvim-web-devicons" },
        -- or if using mini.icons/mini.nvim
        -- dependencies = { "echasnovski/mini.icons" },
        opts = { }
    },
    {
        "folke/trouble.nvim",
        opts = {}, -- for default options, refer to the configuration section for custom setup.
        cmd = "Trouble",
        keys = {
            {
                "<leader>bd",
                "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
                desc = "Buffer Diagnostics (Trouble)",
            },
            {
                "<leader>bs",
                "<cmd>Trouble symbols toggle focus=false<cr>",
                desc = "Symbols (Trouble)",
            },
        }
    }
}
