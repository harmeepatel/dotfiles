vim.pack.add({
    'https://github.com/nvim-lua/plenary.nvim',
    'https://github.com/stevearc/dressing.nvim',
    'https://github.com/nvim-flutter/flutter-tools.nvim',
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "dart",
    group = vim.g.group,
    once = true,
    callback = function()
        require('flutter-tools').setup {}
    end,
})
