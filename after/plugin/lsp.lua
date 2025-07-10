vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(args)
        -- local bufnr = event.buf
        vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end,
        { buffer = args.buf, remap = false, desc = "Go to definition" })

        vim.keymap.set("n", "<leader>co", function() vim.diagnostic.open_float() end,
        { buffer = args.buf, remap = false, desc = "Diagnostic popup" })

        vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end,
        { buffer = args.buf, remap = false, desc = "Code action" })

        vim.keymap.set("n", "<leader>rr", function() vim.lsp.buf.references() end,
        { buffer = args.buf, remap = false, desc = "References" })

        vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end,
        { buffer = args.buf, remap = false, desc = "Rename" })
    end,
})

vim.lsp.enable('luals')

