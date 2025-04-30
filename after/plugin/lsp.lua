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
	vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end,
        { buffer = bufnr, remap = false, desc = "Go to definition" })
	vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end,
        { buffer = bufnr, remap = false, desc = "Hover LSP" })
	vim.keymap.set("n", "]d", function() vim.diagnostic.jump({ count=1, float=false}) end,
        { buffer = bufnr, remap = false, desc = "Prev diagnostic" })
	vim.keymap.set("n", "[d", function() vim.diagnostic.jump({ count=-1, float=false}) end,
        { buffer = bufnr, remap = false, desc = "Next diagnostic" })
	vim.keymap.set("n", "<leader>co", function() vim.diagnostic.open_float() end,
        { buffer = bufnr, remap = false, desc = "Diagnostic popup" })
	vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end,
        { buffer = bufnr, remap = false, desc = "Code action" })
	vim.keymap.set("n", "<leader>ch", function() vim.lsp.buf.document_highlight() end,
		{ buffer = bufnr, remap = false, desc = "Document highlight" })
	vim.keymap.set("n", "<leader>cH", function() vim.lsp.buf.clear_references() end,
		{ buffer = bufnr, remap = false, desc = "Clear references" })
	vim.keymap.set("n", "<leader>ci", function() vim.lsp.inlay_hint.enable(true) end,
		{ buffer = bufnr, remap = false, desc = "Enable inlay hints" })
	vim.keymap.set("n", "<leader>cI", function() vim.lsp.inlay_hint.enable(false) end,
		{ buffer = bufnr, remap = false, desc = "Disable inlay hints" })
	vim.keymap.set("n", "<leader>rr", function() vim.lsp.buf.references() end,
		{ buffer = bufnr, remap = false, desc = "References" })
	vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end,
		{ buffer = bufnr, remap = false, desc = "Rename" })
end)

lsp.setup()

require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {},
  handlers = { lsp.default_setup, },
})
