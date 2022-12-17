-- 'base16-gruvbox-dark-hard'
local setColorScheme = 'gruvbox'

local status_ok, _ = pcall(vim.cmd, 'colorscheme ' .. setColorScheme)
if not status_ok then
    vim.notify('404: colorscheme - ' .. setColorScheme)
    return
end
