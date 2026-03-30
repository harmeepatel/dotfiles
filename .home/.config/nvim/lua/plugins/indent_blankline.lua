vim.api.nvim_create_autocmd({ "BufReadPost" }, {
    group = vim.g.group,
    once = true,
    callback = function()
        vim.pack.add({
            { src = "https://github.com/lukas-reineke/indent-blankline.nvim" }
        })

        vim.schedule(function()
            -- local highlight = {
            --     "CursorColumn",
            --     "Whitespace",
            -- }
            require("ibl").setup {
                indent = { char = "·" },
                -- whitespace = {
                --     highlight = highlight,
                --     remove_blankline_trail = false,
                -- },
                scope = { enabled = false },
            }
        end)
    end
})
