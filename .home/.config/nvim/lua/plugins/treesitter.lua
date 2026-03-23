--return {
--    "nvim-treesitter/nvim-treesitter",
--    lazy = false,
--    build = ":TSUpdate",
--    event = { "BufReadPre", "BufNewFile" },
    -- dependencies = {
    --     {
    --         "nvim-treesitter/nvim-treesitter-context",
    --         config = function()
    --             require("treesitter-context").setup {
    --                 max_lines = 3,
    --                 line_numbers = true,
    --                 separator = '―',
    --                 on_attach = nil,
    --             }
    --             vim.api.nvim_set_hl(0, "TreesitterContextSeparator", { fg = "#353535" })
    --         end
    --     },
    -- },
    -- config = function()
    --     require("nvim-treesitter.configs").setup {
    --         ensure_installed = {
    --             "astro", "bash", "css", "dockerfile", "go", "html",
    --             "javascript", "json", "json5", "lua", "markdown_inline",
    --             "markdown", "python", "rust", "scss", "sql", "templ",
    --             "toml", "tsx", "typescript", "vim", "vimdoc", "zig",
    --         },
    --         sync_install = true,
    --         auto_install = true,
    --         indent = { enable = true },
    --         highlight = {
    --             enable = true,
    --             additional_vim_regex_highlighting = false,
    --         },
    --     }
    -- end,
--}

vim.pack.add({
    { src="https://github.com/nvim-treesitter/nvim-treesitter-context" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" },
})

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
