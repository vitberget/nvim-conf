return {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
        signs = false,
        highlight = {
            pattern = [[.*<(KEYWORDS)\s*]],
            keyword = "fg",
            after = "fg",
        },
        search = {
            pattern = [[\b(KEYWORDS)\b]],
        }

    }
}
