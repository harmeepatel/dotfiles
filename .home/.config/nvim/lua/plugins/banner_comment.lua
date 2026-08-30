vim.pack.add({
    { src = "https://github.com/nthnd/comment-banner.nvim" }
})

local initialized = false
vim.keymap.set('n', '<leader>cc', function()
    if not initialized then
        require('comment-banner').setup({})
        initialized = true
    end
    require('comment-banner').createComment()
end, { desc = "Create Comment Banner" })
