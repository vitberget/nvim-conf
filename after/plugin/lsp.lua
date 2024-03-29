local function toggleDiagnostics()
	local config = vim.diagnostic.config
	local vt = config().virtual_text
	config {
		virtual_text = not vt,
		underline = not vt,
		signs = not vt,
	}
end

vim.api.nvim_create_user_command("DiagnosticToggle", toggleDiagnostics, { desc = "toggle diagnostic" })

local lsp = require('lsp-zero').preset({
  name = 'minimal',
  set_lsp_keymaps = true,
  manage_nvim_cmp = true,
})

lsp.on_attach(function(client, bufnr)
	lsp.default_keymaps({buffer = bufnr})
end)

local cmp = require('cmp')
-- local cmp_action = require('lsp-zero').cmp_action()
cmp.setup({
    mapping = cmp.mapping.preset.insert({
        ['<C-a>'] =  cmp.mapping.confirm({select=true}),
        ['<C-space>'] =  cmp.mapping.confirm({select=true}),
        ['<CR>'] =  cmp.mapping.confirm({select=true}),
    }),
    snippet = {
        expand = function (args)
            require('luasnip').lsp_expand(args.body)
        end
    }
})

lsp.set_preferences({
	sign_icons = { }
})

lsp.on_attach(function(client, bufnr)
	local opts = {buffer = bufnr, remap = false}

	vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
	vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
	vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
	vim.keymap.set("n", "]d", function() vim.diagnostic.goto_next() end, opts)
	vim.keymap.set("n", "[d", function() vim.diagnostic.goto_prev() end, opts)
	vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, opts)
	vim.keymap.set("n", "<leader>ch", function() vim.lsp.buf.document_highlight() end, opts)
	vim.keymap.set("n", "<leader>cH", function() vim.lsp.buf.clear_references() end, opts)
	vim.keymap.set("n", "<leader>rr", function() vim.lsp.buf.references() end, opts)
	vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)
end)

lsp.setup()

require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {},
  handlers = { lsp.default_setup, },
})
