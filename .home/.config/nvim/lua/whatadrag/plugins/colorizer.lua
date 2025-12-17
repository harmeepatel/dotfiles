vim.opt.termguicolors = true
return {
    "brenoprata10/nvim-highlight-colors",
    opts = {},
    event = { "BufReadPre", "BufNewFile" },
    lazy = true,
}
