  -- /autocmd BufNewFile,BufRead *.cl set filetype=opencl
  vim.api.nvim_create_autocmd(
    {"BufNewFile", "BufRead"},
    {
        pattern = "*.opencl",
        callback = function ()
            local buf = vim.api.nvim_get_current_buf()
            vim.api.nvim_set_option_value("filetype", "opencl", {buf = buf})
        end
    }
  )

  vim.api.nvim_create_autocmd(
    {"BufNewFile", "BufRead"},
    {
        pattern = "*.simconf",
        callback = function ()
            local buf = vim.api.nvim_get_current_buf()
            vim.api.nvim_set_option_value("filetype", "json", {buf = buf})
        end
    }
  )
