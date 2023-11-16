
return require('packer').startup(function(use)
	-- Packer can manage itself
    use "HiPhish/nvim-ts-rainbow2"



		--	'williamboman/mason.nvim',

    use {
        "klen/nvim-test",
        config = function()
            require('nvim-test').setup()
        end
    }

end)
