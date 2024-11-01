vim.api.nvim_create_autocmd({'BufRead', 'BufNewFile'}, {
  desc = 'Set filetype for SSH config directory',
  pattern = '*/.ssh/config.d/*',
  command = 'set filetype=sshconfig'
})
