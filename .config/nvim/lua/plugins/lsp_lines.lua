return {
    "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    config = function()
        require("lsp_lines").setup()
    end,
    keys = {
        { "<leader>ll", ":lua require\"lsp_lines\".toggle<cr>", desc = "Toggle lsp_lines" },
    },
}
