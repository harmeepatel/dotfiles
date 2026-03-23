[lots of plugins](https://github.com/rockerBOO/awesome-neovim)

[dadbod](https://github.com/kristijanhusak/vim-dadbod-ui)
plugin for database completions and database ui for neovim

[Traap's awsm config](https://github.com/Traap/nvim)
[no nvim-lspconfig lsp setup](https://github.com/jdhao/nvim-config/blob/main/lua/config/lsp.lua#L177-L179)


[inline diagnostic](https://github.com/rachartier/tiny-inline-diagnostic.nvim)
``` lua
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
```
