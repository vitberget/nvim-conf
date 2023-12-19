local function colorDark(color)
    if color==nil or color=='' then
        color = "rose-pine"
    end

    vim.opt.termguicolors = true
    vim.cmd('set background=dark')
    vim.cmd.colorscheme(color)

    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

    vim.api.nvim_set_hl(0, "Cursor", { fg="orange", bg="orange" })
    vim.api.nvim_set_hl(0, "Cursor2", { fg="orange", bg="orange" })
    vim.api.nvim_set_hl(0, "CursorColumn", { bg="#171000" })

    -- vim.opt.nvim_set_hl(0, "TabLine", { fg="#bbbbbb", bg="#111111" })

    vim.opt.guicursor = "n-v-c:block-Cursor/lCursor,i-ci-ve:ver25-Cursor2/lCursor2,r-cr:hor20,o:hor50"

end

local function colorTabLineDark()
    vim.api.nvim_set_hl(0, 'TabLineFill', { bg="none" })
    vim.api.nvim_set_hl(0, 'TabLine', { bg="#222222", fg="#777777" })
    vim.api.nvim_set_hl(0, 'TabLineSel', { bg="#444444", fg="#dbb070" })
end

local function colorLight(color)
    if color==nil or color=='' then
        color = "vscode"
    end
    vim.opt.termguicolors = true
    vim.cmd('set background=light')
    vim.cmd.colorscheme(color)

    vim.api.nvim_set_hl(0, "Cursor", { fg="orange", bg="orange" })
    vim.api.nvim_set_hl(0, "Cursor2", { fg="orange", bg="orange" })
    vim.api.nvim_set_hl(0, "CursorColumn", { bg="#f2f2f2" })

    vim.opt.guicursor = "n-v-c:block-Cursor/lCursor,i-ci-ve:ver25-Cursor2/lCursor2,r-cr:hor20,o:hor50"
end

vim.api.nvim_create_user_command( 'ColorDark',
function (opts)
    colorDark(opts.args)
    colorTabLineDark()
end,
{ nargs = '?' })

vim.api.nvim_create_user_command( 'ColorLight',
function (opts)
    colorLight(opts.args)
end,
{ nargs = '?' })

colorDark()
colorTabLineDark()


vim.api.nvim_create_user_command('ColorTablineDark', colorTabLineDark, {})
