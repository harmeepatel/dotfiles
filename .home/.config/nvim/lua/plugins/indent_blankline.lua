vim.pack.add({
    { src = "https://github.com/lukas-reineke/indent-blankline.nvim" }
})

vim.api.nvim_create_autocmd({ "BufReadPre", "BufNewFile" }, {
    group = vim.g.group,
    once = true,
    callback = function()
        require("ibl").setup {
            indent = { char = "·" },
            -- indent = { char = "│" },
            scope = { enabled = false },
            exclude = {
                filetypes = {
                    "go",
                    "jai",
                    "odin",
                    "rust",
                    "zig",
                },
            },
        }
    end,
})
