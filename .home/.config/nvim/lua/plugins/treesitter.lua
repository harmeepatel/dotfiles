vim.api.nvim_create_autocmd({ "BufReadPre" }, {
    group = vim.g.group,
    once = true,
    callback = function()
        vim.pack.add({
            { src = "https://github.com/nvim-treesitter/nvim-treesitter" },
            { src = "https://github.com/nvim-treesitter/nvim-treesitter-context" },
        })

        vim.schedule(function()
            local ensureInstalled = {
                "astro", "bash", "css", "dockerfile", "go", "html",
                "javascript", "json", "json5", "lua", "markdown_inline",
                "markdown", "python", "rust", "scss", "sql", "templ",
                "toml", "tsx", "typescript", "vim", "vimdoc", "zig",
            }

            local alreadyInstalled = require("nvim-treesitter.config").get_installed()
            local parsersToInstall = vim.iter(ensureInstalled)
                :filter(function(parser) return not vim.tbl_contains(alreadyInstalled, parser) end)
                :totable()

            require("nvim-treesitter").install(parsersToInstall)

            require("nvim-treesitter").setup {
                build = ':TSUpdate',
                sync_install = true,
                auto_install = true,
                indent = { enable = true },
                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = false,
                },
            }
            vim.treesitter.start()
        end)
    end
})
