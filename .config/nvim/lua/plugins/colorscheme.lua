local transparent = function()
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
    vim.api.nvim_set_hl(0, "WinSeparator", { bg = "none" })
end

local vscode_opts = {
    transparent = true,
    italic_comments = true,
}

local tokyonight_opts = {
    transparent = true,
    styles = {
        sidebars = "transparent",
        floats = "transparent"
    }
}

local theme = function()
    vim.cmd.colorscheme("gruvbox-flat")
    vim.g.gruvbox_flat_style = "dark"
    vim.g.gruvbox_transparent = true
    -- transparent()
end

return {
    -- "catppuccin/nvim",
    -- name = "catppuccin",
    -- "Mofiqul/vscode.nvim",
    "eddyekofo94/gruvbox-flat.nvim",
    -- "folke/tokyonight.nvim",
    priority = 4,
    init = theme,
    config = theme,
}
