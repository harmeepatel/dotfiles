local setColorScheme = 'base16-monokai'
-- 'base16-gruvbox-dark-hard'

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. setColorScheme)
if not status_ok then
    vim.notify("colorscheme " .. setColorScheme .. " not found!")
    return
end
