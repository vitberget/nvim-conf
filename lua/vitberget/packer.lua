local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
		vim.cmd [[packadd packer.nvim]]
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    use 'will133/vim-dirdiff'
    use({ "L3MON4D3/LuaSnip",
          run = "make install_jsregexp"
    })
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'
    use "HiPhish/nvim-ts-rainbow2"
    use {
        'ThePrimeagen/harpoon',
		requires = { {'nvim-lua/plenary.nvim'} }
    }
	use {
		'nvim-telescope/telescope.nvim',
		requires = { {'nvim-lua/plenary.nvim'} }
	}
    use{'ckipp01/nvim-jenkinsfile-linter', requires = { {"nvim-lua/plenary.nvim" } } }

	use({
		'rose-pine/neovim',
		as = 'rose-pine',
		config = function()
			vim.cmd('colorscheme rose-pine')
		end
	})
	use { "arcticicestudio/nord-vim" }
    use { "Mofiqul/dracula.nvim" }
    use { "morhetz/gruvbox" }
    use { "Mofiqul/vscode.nvim" }


	use( 'nvim-treesitter/nvim-treesitter', { run = ':TSUpdate'})
	use( 'nvim-treesitter/playground' )
	use( 'mbbill/undotree' )
	use( 'tpope/vim-fugitive' )
    use 'airblade/vim-gitgutter'
    use {
        'numToStr/Comment.nvim',
        config = function()
                require('Comment').setup()
                end
            }
	use {
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v2.x',
		requires = {
			-- LSP Support
			{'neovim/nvim-lspconfig'},             -- Required
			{                                      -- Optional
			'williamboman/mason.nvim',
			run = function()
				pcall(vim.cmd, 'MasonUpdate')
			end,
		},
		{'williamboman/mason-lspconfig.nvim'}, -- Optional

		-- Autocompletion
		{'hrsh7th/nvim-cmp'},     -- Required
		{'hrsh7th/cmp-nvim-lsp'}, -- Required
		{'L3MON4D3/LuaSnip'},     -- Required
        { 'saadparwaiz1/cmp_luasnip'  }
	}
}
    use { 'nvim-tree/nvim-tree.lua' }
	use { "jiangmiao/auto-pairs" }
	use { "easymotion/vim-easymotion" }
	use { "tpope/vim-surround" }
	use { "mattn/emmet-vim" }
	use { 'guns/vim-sexp' }
	use { 'tpope/vim-sexp-mappings-for-regular-people' }
	use { "Olical/conjure" }

    use 'simrat39/rust-tools.nvim'
    use {'folke/neodev.nvim', requires = { "rcarriga/nvim-dap-ui"}}
    use 'mfussenegger/nvim-dap'
    use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"}  }

    use {
        "klen/nvim-test",
        config = function()
            require('nvim-test').setup()
        end
    }
    
    use {
        "folke/which-key.nvim",
        config = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 700
            require("which-key").setup {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end
    }

    use {
        "folke/twilight.nvim",
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
            context = 5,
        }
    }
    use {"akinsho/toggleterm.nvim", tag = '*', config = function()
        require("toggleterm").setup()
    end}
    use ({"ziontee113/color-picker.nvim",
        config = function()
            require("color-picker")
        end,
    })
    use 'NvChad/nvim-colorizer.lua'
    use { "alexghergh/nvim-tmux-navigation" }
    use {'nvim-telescope/telescope-ui-select.nvim' }

-- Automatically set up your configuration after cloning packer.nvim
-- Put this at the end after all plugins
if packer_bootstrap then
	require('packer').sync()
end
end)
