return {
    "rachartier/tiny-inline-diagnostic.nvim",
    event = { "VeryLazy", "BufReadPre", "BufNewFile" },
    priority = 1000,
    config = function()
        vim.diagnostic.config({ virtual_text = false })
        vim.diagnostic.config({ float = false })

        require("tiny-inline-diagnostic").setup({
            preset = "simple",
            -- transparent_bg = true,
            options = {
                show_source = { enabled = true },
            },
            signs = {
                left = "",
                right = "",
                diag = "",
                arrow = "    ",
                up_arrow = "    ",
                vertical = " │",
                vertical_end = " └",
            },
            blend = {
                factor = 0.22,
            },
        })
    end,
}
