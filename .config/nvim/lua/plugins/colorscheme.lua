local transparent = function()
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
end

local vscode = function()
    vim.cmd.colorscheme("vscode")
    require("vscode").setup({
        transparent = true,
        italic_comments = true,
    })
    transparent()
end

return {
    -- "catppuccin/nvim",
    -- name = "catppuccin",
    -- "ellisonleao/gruvbox.nvim",
    "Mofiqul/vscode.nvim",
    priority = 4,
    init = vscode,
    config = vscode,
}
