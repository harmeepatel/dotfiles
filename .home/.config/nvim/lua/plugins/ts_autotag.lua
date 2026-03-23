vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
    group = vim.g.group,
    once = true,
    callback = function()
        vim.pack.add({
            { src = "https://github.com/windwp/nvim-ts-autotag" }
        })

        vim.schedule(function()
            require("nvim-ts-autotag").setup({
                -- enable_close = true,
                -- enable_rename = true,
                -- enable_close_on_slash = true
            })
        end)
    end
})
