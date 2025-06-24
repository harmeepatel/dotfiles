local opts = {
    use_devicons = true,
    mappings = {},
}

return {
    "prichrd/netrw.nvim",
    opts = opts,
    keys = {
        -- { "<leader>e", "<cmd>lua require'telescope.builtin'.find_files({hidden = true})<cr>" },
        { "<leader>e", "<cmd>Ex<CR>" },
    },
    lazy = true,
}
