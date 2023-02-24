return {
    "danymat/neogen",
    dependencies = "nvim-treesitter/nvim-treesitter",
    keys = {
        { "<leader>ds", ":lua require('neogen').generate()<CR>" },
    },
    config = true,
}
