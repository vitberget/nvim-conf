require 'hex'.setup({
    is_file_binary_post_read = function()
        -- default is_file_binary_post_read checks ifs not utf-8
        return false
    end,
})
