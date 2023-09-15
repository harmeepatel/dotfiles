local opts = {
    defaults = {
        layout_config = {
            horizontal = {
                preview_width = 0.45,
                results_width = 1,
            },
            vertical = {
                mirror = false,
            },
            width = 0.80,
            height = 0.80,
            preview_cutoff = 120,
        },
        color_devicons = true,
        set_env = { ["COLORTERM"] = "truecolor" },
        file_ignore_patterns = { "node_modules", "go.sum" },
    },
    -- pickers = {
    --     find_files = {
    --         theme = "ivy",
    --     }
    -- },
}

return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim"
    },
    keys = {
        { "<leader>ff", "<cmd>lua require'telescope.builtin'.find_files({hidden = true})<cr>" },
        { "<leader>fg", "<cmd>lua require'telescope.builtin'.git_files()<cr>" },
        { '<leader>fr', "<cmd>lua require'telescope.builtin'.live_grep()<cr>" },
        { "<leader>fb", "<cmd>lua require'telescope.builtin'.buffers()<cr>" },
        { "<leader>fh", "<cmd>lua require'telescope.builtin'.help_tags()<cr>" },
    },
    opts = opts,
}
