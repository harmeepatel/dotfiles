local transparent = function()
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
    vim.api.nvim_set_hl(0, "WinSeparator", { bg = "none" })
end

vim.pack.add({
    { src = "https://github.com/catppuccin/nvim.git", name = "catppuccin" },
})

vim.cmd.colorscheme("catppuccin")
transparent()

require("catppuccin").setup({
    transparent_background = true,
    term_colors = true,
    color_overrides = {
        -- mocha = {
        --     base = "#000000",
        --     mantle = "#000000",
        --     crust = "#000000",
        -- },
    },
    highlight_overrides = {
        mocha = function(C)
            return {
                TabLineSel = { bg = C.pink },
                CmpBorder = { fg = C.surface2 },
                Pmenu = { bg = C.none },
                TelescopeBorder = { link = "FloatBorder" },
            }
        end,
    },
    custom_highlights = {},
    integrations = {
        cmp = true,
        -- gitsigns = true,
        nvimtree = true,
        telescope = true,
        notify = true,
        mini = false,
        mason = true,
    },
})
