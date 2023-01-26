local colorscheme = 'vscode'

local ok, _ = pcall(vim.cmd.colorscheme, colorscheme)
if not ok then
    vim.notify('404: colorscheme - ' .. colorscheme)
    return
end

local c = require('vscode.colors').get_colors()
require('vscode').setup({
    -- Enable transparent background
    transparent = true,

    -- Enable italic comment
    italic_comments = true,

    -- Override highlight groups (see ./lua/vscode/theme.lua)
    group_overrides = {
        -- this supports the same val table as vim.api.nvim_set_hl
        -- use colors from this colorscheme by requiring vscode.colors!
        Cursor = { fg=c.vscDarkBlue, bg=c.vscLightGreen, bold=true },
    }
})

-- transparent that shit
vim.api.nvim_set_hl(0, "Normal", {bg = "none"})
vim.api.nvim_set_hl(0, "NormalFloat", {bg = "none"})
vim.api.nvim_set_hl(0, "SignColumn", {bg = "none"})
