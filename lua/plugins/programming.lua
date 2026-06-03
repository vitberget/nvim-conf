return {
    { 'numToStr/Comment.nvim', opts = {}, lazy = false, },
    { 'neovim/nvim-lspconfig' },
    { "williamboman/mason.nvim", opts = {} },
    { 'williamboman/mason-lspconfig.nvim', config = function ()
        require("mason-lspconfig").setup { }
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
            }
        end
    },
    { 'folke/neodev.nvim' },
    { "rcarriga/nvim-dap-ui", dependencies = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"} },
    { 'mfussenegger/nvim-dap' },
    {
        "Olical/conjure",
        ft = { "clojure" },
        config = function(_, opts)
            require("conjure.main").main()
            require("conjure.mapping")["on-filetype"]()
        end,
        init = function()
        end,
    },
    { 'lewis6991/gitsigns.nvim', opts = {} },
    {
        'brgmnn/vim-opencl',
        ft = "opencl"
    },
}
