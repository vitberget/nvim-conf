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
