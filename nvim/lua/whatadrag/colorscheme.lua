local setColorScheme = 'base16-monokai'
-- 'base16-gruvbox-dark-hard'

local status_ok, _ = pcall(vim.cmd, 'colorscheme ' .. setColorScheme)
if not status_ok then
    vim.notify('404: colorscheme - ' .. setColorScheme)
    return
end

-- transparent background
vim.cmd [[ hi Normal guibg=NONE ctermbg=NONE ]]
