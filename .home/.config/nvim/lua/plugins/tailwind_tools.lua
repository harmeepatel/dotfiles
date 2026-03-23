return {
    "luckasRanarison/tailwind-tools.nvim",
    name = "tailwind-tools",
    event = { "BufReadPre", "BufNewFile" },
    build = ":UpdateRemotePlugins",
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "nvim-telescope/telescope.nvim",
    },
    opts = {},
    keys = {
        { "<leader>tw", "<cmd>TailwindConcealToggle<cr>" },
        { "<leader>tc", "<cmd>TailwindColorToggle<cr>" },
    },
}
