vim.api.nvim_create_autocmd({ 'BufReadPre', 'BufNewFile' }, {
    group = vim.g.group,
    once = true,
    callback = function()
        vim.opt.termguicolors = true
        vim.pack.add({
            { src = "https://github.com/brenoprata10/nvim-highlight-colors" },
        })
    end
})
