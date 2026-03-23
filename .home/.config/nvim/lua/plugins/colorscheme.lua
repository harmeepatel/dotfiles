vim.pack.add({
    { src = "https://github.com/catppuccin/nvim.git", name = "catppuccin" },
})

require("catppuccin").setup({
    transparent_background = true,
    term_colors = true,
    integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        telescope = true,
        notify = true,
        mini = false,
        mason = true,
    },
})

vim.cmd.colorscheme("catppuccin")

-- transparent {
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
vim.api.nvim_set_hl(0, "WinSeparator", { bg = "none" })
-- }
