function ColorDark(color)
    if color==nil or color=='' then
        color = "rose-pine"
    end

    vim.opt.termguicolors = true
    vim.cmd('set background=dark')
    vim.cmd.colorscheme(color)

    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

function ColorLight(color)
    if color==nil or color=='' then
        color = "vscode"
    end
    vim.opt.termguicolors = true
    vim.cmd('set background=light')
    vim.cmd.colorscheme(color)
end

vim.api.nvim_create_user_command( 'ColorDark',
function (opts)
    ColorDark(opts.args)
end,
{ nargs = '?' })

vim.api.nvim_create_user_command( 'ColorLight',
function (opts)
    ColorLight(opts.args)
end,
{ nargs = '?' })


ColorDark()
