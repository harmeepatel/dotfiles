vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
    group = vim.g.group,
    once = true,
    callback = function()
        vim.opt.termguicolors = true
        vim.pack.add({
            { src = "https://github.com/brenoprata10/nvim-highlight-colors" },
        })
        vim.schedule(function ()
            require("nvim-highlight-colors").setup({})
        end)
    end
})
