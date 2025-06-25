return {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        {
            "nvim-treesitter/nvim-treesitter-context",
            config = function()
                require "treesitter-context".setup {
                    max_lines = 3, -- How many lines the window should span. Values <= 0 mean no limit.
                    line_numbers = true,
                    separator = '―',
                    on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching

                }
                vim.api.nvim_set_hl(0, "TreesitterContextSeparator", { fg = "#353535" })
            end
        },
    },
    build = ":TSUpdate",
    opts = {
        ensure_installed = { "vim", "vimdoc", "javascript", "typescript", "tsx", "lua", "rust", "go", "python", "bash",
            "astro",
            "html", "css", "scss", "dockerfile", "json", "json5", "markdown", "markdown_inline", "sql", "toml" },

        sync_install = true,
        auto_install = true,
        indent = { enable = true },
        highlight = {
            enable = true,
            additional_vim_regex_highlighting = false,
        },
    },
}
