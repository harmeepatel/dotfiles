return {
    -- "catppuccin/nvim",
    -- name = "catppuccin",
    -- "ellisonleao/gruvbox.nvim",
    "Mofiqul/vscode.nvim",
    priority = 4,
    init = function()
        -- transparent that shit
        vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
        vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
        vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
    end,
    config = function()
        vim.cmd.colorscheme("vscode")
        require("vscode").setup({
            transparent = true,
            italic_comments = true,
        })
    end,
}
