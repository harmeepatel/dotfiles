vim.api.nvim_create_autocmd({ "BufReadPost" }, {
    group = vim.g.group,
    once = true,
    callback = function()
        vim.pack.add({
            { src = "https://github.com/numToStr/Comment.nvim" },
        })

        vim.schedule(function()
            require("comment").setup({
                padding = true,
                sticky = true,
                toggler = {
                    line = "<leader>/",
                    block = "cb",
                },
                opleader = {
                    line = "<leader>/",
                    block = "cb",
                },
                extra = {
                    above = "cO",
                    below = "co",
                    eol = "cA",
                },
                mappings = {
                    basic = true,
                    extra = true,
                    extended = false,
                },
            })
        end)
    end
})
