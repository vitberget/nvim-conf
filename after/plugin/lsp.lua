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

        -- Autocompletion
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if client:supports_method('textDocument/completion') then
            vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = false })
            vim.keymap.set("i", "<c-m>", function() vim.lsp.completion.get() end,
            { buffer = args.buf, remap = false, desc = "References" })
        end
    end,
})

