local transparent = function()
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
    vim.api.nvim_set_hl(0, "WinSeparator", { bg = "none" })
end

local catppuccin_opts = {
    transparent_background = true,
    term_colors = true,
    color_overrides = {
        mocha = {
            base = "#000000",
            mantle = "#000000",
            crust = "#000000",
        },
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
        gitsigns = true,
        nvimtree = true,
        telescope = true,
        notify = true,
        mini = false,
    },
}

local name = "catppuccin"
return {
    "catppuccin/nvim",
    name = name,
    priority = 4,
    opts = catppuccin_opts,
    init = function()
        vim.cmd.colorscheme(name)
        -- vim.g.gruvbox_flat_style = "dark"
        -- vim.g.gruvbox_transparent = true
        -- transparent()
    end,
}
