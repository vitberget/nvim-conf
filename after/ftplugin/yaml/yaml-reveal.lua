if vim.fn.exists("+winbar") == 1 then
  vim.opt_local.winbar = "%{YamlRevealerStatusLine()}"
end
