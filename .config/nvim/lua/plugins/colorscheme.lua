return {
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
        local c = require("vscode.colors").get_colors()
        require("vscode").setup({
            transparent = true,
            italic_comments = true,
        })
    end,
}
