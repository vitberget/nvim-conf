-- https://github.com/nvim-treesitter/nvim-treesitter-textobjects

require("nvim-treesitter-textobjects").setup {
  select = {
    -- Automatically jump forward to textobj, similar to targets.vim
    lookahead = true,
    -- You can choose the select mode (default is charwise 'v')
    --
    -- Can also be a function which gets passed a table with the keys
    -- * query_string: eg '@function.inner'
    -- * method: eg 'v' or 'o'
    -- and should return the mode ('v', 'V', or '<c-v>') or a table
    -- mapping query_strings to modes.
    selection_modes = {
      ['@parameter.outer'] = 'v', -- charwise
      ['@function.outer'] = 'V', -- linewise
      -- ['@class.outer'] = '<c-v>', -- blockwise
    },
    -- If you set this to `true` (default is `false`) then any textobject is
    -- extended to include preceding or succeeding whitespace. Succeeding
    -- whitespace has priority in order to act similarly to eg the built-in
    -- `ap`.
    --
    -- Can also be a function which gets passed a table with the keys
    -- * query_string: eg '@function.inner'
    -- * selection_mode: eg 'v'
    -- and should return true of false
    include_surrounding_whitespace = false,
    move = {
        set_jumps = true,
    },
  },
}

-- Selects
vim.keymap.set({ "x", "o" }, "if", function()
  require "nvim-treesitter-textobjects.select".select_textobject("@function.inner", "textobjects")
end)
vim.keymap.set({ "x", "o" }, "af", function()
  require "nvim-treesitter-textobjects.select".select_textobject("@function.outer", "textobjects")
end)
vim.keymap.set({ "x", "o" }, "iz", function()
  require "nvim-treesitter-textobjects.select".select_textobject("@block.inner", "textobjects")
end)
vim.keymap.set({ "x", "o" }, "az", function()
  require "nvim-treesitter-textobjects.select".select_textobject("@block.outer", "textobjects")
end)


-- Moves
vim.keymap.set({ "n", "x", "o" }, "]f", function()
    require("nvim-treesitter-textobjects.move").goto_next_start("@function.outer", "textobjects")
end, {desc = "Next function"})
vim.keymap.set({ "n", "x", "o" }, "[f", function()
    require("nvim-treesitter-textobjects.move").goto_previous_start("@function.outer", "textobjects")
end, {desc = "Previous function"})

vim.keymap.set({ "n", "x", "o" }, "]z", function()
    require("nvim-treesitter-textobjects.move").goto_next_start("@block.outer", "textobjects")
end, {desc = "Next block"})
vim.keymap.set({ "n", "x", "o" }, "[z", function()
    require("nvim-treesitter-textobjects.move").goto_previous_start("@block.outer", "textobjects")
end, {desc = "Previous block"})

vim.keymap.set({ "n", "x", "o" }, "]z", function()
    require("nvim-treesitter-textobjects.move").goto_next_start("@comment.outer", "textobjects")
end, {desc = "Next comment"})
vim.keymap.set({ "n", "x", "o" }, "[z", function()
    require("nvim-treesitter-textobjects.move").goto_previous_start("@comment.outer", "textobjects")
end, {desc = "Previous comment"})
