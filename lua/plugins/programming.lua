return {
    { "L3MON4D3/LuaSnip", build = "make install_jsregexp" },
    { 'numToStr/Comment.nvim', opts = {}, lazy = false, },
    { 'VonHeikemen/lsp-zero.nvim', branch = 'v3.x' },
    { 'neovim/nvim-lspconfig' },
    { "williamboman/mason.nvim", opts = {} },
    { 'williamboman/mason-lspconfig.nvim', config = function ()
        require("mason-lspconfig").setup {
            ensure_installed = {
                "codelldb",
                "rust_analyzer",
                "texlab",
            },
        }
    end},
    { 'hrsh7th/nvim-cmp' },
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'L3MON4D3/LuaSnip' },
    { 'saadparwaiz1/cmp_luasnip' },
    'simrat39/rust-tools.nvim',
    'folke/neodev.nvim',
    'mfussenegger/nvim-dap',
    "rcarriga/nvim-dap-ui",
    { "klen/nvim-test", opts = {} },
    { 'nfnty/vim-nftables' },
    { 'ckipp01/nvim-jenkinsfile-linter' },
    -- use { "Olical/conjure" }

    {
        "Olical/conjure",
        ft = { "clojure", "fennel" }, -- etc
        -- [Optional] cmp-conjure for cmp
        dependencies = {
            {
                "PaterJason/cmp-conjure",
                config = function()
                    local cmp = require("cmp")
                    local config = cmp.get_config()
                    table.insert(config.sources, {
                        name = "buffer",
                        option = {
                            sources = {
                                { name = "conjure" },
                            },
                        },
                    })
                    cmp.setup(config)
                end,
            },
        },
        config = function(_, opts)
            require("conjure.main").main()
            require("conjure.mapping")["on-filetype"]()
        end,
        init = function()
            -- Set configuration options here
            vim.g["conjure#debug"] = true
        end,
    }
}
