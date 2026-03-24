vim.pack.add({
    {src="https://github.com/nthnd/comment-banner.nvim"}
})
require 'comment-banner'.setup{}
vim.keymap.set('n', '<leader>cc', require 'comment-banner'.createComment)
