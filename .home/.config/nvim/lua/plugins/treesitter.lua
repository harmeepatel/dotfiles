local opts = {
    -- A list of parser names, or "all"
    ensure_installed = { "vim", "vimdoc", "javascript", "typescript", "tsx", "lua", "rust", "go", "python", "bash",
        "astro",
        "html", "css", "scss", "dockerfile", "json", "json5", "markdown", "markdown_inline", "sql", "toml" },

    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = true,

    -- Automatically install missing parsers when entering buffer
    -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
    auto_install = true,

    indent = { enable = true },

    highlight = {
        -- `false` will disable the whole extension
        enable = true,

        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
        additional_vim_regex_highlighting = false,
    },
}

return {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
        {
            "nvim-treesitter/nvim-treesitter-context",
            config = function()
                require 'treesitter-context'.setup {
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
    config = function()
        local configs = require("nvim-treesitter.configs")
        configs.setup(opts)
    end,
}
