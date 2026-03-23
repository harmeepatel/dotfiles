vim.api.nvim_create_autocmd({ "BufReadPost" }, {
    group = vim.g.group,
    once = true,
    callback = function()
        vim.pack.add({
            { src = "https://github.com/nvim-treesitter/nvim-treesitter-context" },
            { src = "https://github.com/nvim-treesitter/nvim-treesitter" },
        })

        vim.schedule(function()
            require("nvim-treesitter").install {
                "astro", "bash", "css", "dockerfile", "go", "html",
                "javascript", "json", "json5", "lua", "markdown_inline",
                "markdown", "python", "rust", "scss", "sql", "templ",
                "toml", "tsx", "typescript", "vim", "vimdoc", "zig",
            }

            require("nvim-treesitter").setup {
                sync_install = true,
                auto_install = true,
                indent = { enable = true },
                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = false,
                },
            }
        end)
    end
})
