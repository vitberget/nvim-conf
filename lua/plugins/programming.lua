return {
    { 'numToStr/Comment.nvim', opts = {}, lazy = false, },
    { 'neovim/nvim-lspconfig' },
    { "williamboman/mason.nvim", opts = {} },
    { 'williamboman/mason-lspconfig.nvim', config = function ()
        require("mason-lspconfig").setup {
            -- ensure_installed = { "rust_analyzer", "texlab", },
        }
    end},
    {"jay-babu/mason-nvim-dap.nvim", config = function ()
        require("mason-nvim-dap").setup({
            ensure_installed = { "codelldb", }
        })
    end},
    {
        'mrcjkb/rustaceanvim',
        version = '^9', -- Recommended
        lazy = false, -- already lazy
        ft = { 'rust' },

    },
    {
        'saecki/crates.nvim',
        ft = {"toml"},
        tag = 'stable',
        config = function()
            require("crates").setup {
                -- completion = {
                --     cmp = {
                --         enabled = true
                --     },
                -- },
            }
            -- require('cmp').setup.buffer({
            --     sources = { { name = "crates" }}
            -- })
        end
    },
    'folke/neodev.nvim',
    { "rcarriga/nvim-dap-ui", dependencies = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"} },
    'mfussenegger/nvim-dap',
    -- { "klen/nvim-test", opts = {} }, TODO fix nvim-test?
    {
        "Olical/conjure",
        ft = { "clojure" },
        config = function(_, opts)
            require("conjure.main").main()
            require("conjure.mapping")["on-filetype"]()
        end,
        init = function()
            -- Set configuration options here
            -- vim.g["conjure#debug"] = true
        end,
    },
    -- {
    --     -- Remove none-ls / nulls-ls ?
    --     'nvimtools/none-ls.nvim',
    --     config = function ()
    --         local null_ls = require("null-ls")
    --         null_ls.setup({
    --             sources = {
    --                 -- null_ls.builtins.code_actions.gitsigns,
    --             },
    --         })
    --     end
    -- },
    { 'lewis6991/gitsigns.nvim', opts = {} },
    'brgmnn/vim-opencl',
}
