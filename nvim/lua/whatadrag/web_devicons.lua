-- Devicons
vim.g.webdevicons_enable = 1
vim.g.webdevicons_enable_unite = 1
vim.g.webdevicons_enable_denite = 1
vim.g.webdevicons_enable_nerdtree = 1
vim.g.webdevicons_enable_airline_tabline = 1
vim.g.webdevicons_enable_vimfiler = 1
vim.g.WebDevIconsUnicodeDecorateFileNodes = 1
vim.g.WebDevIconsUnicodeDecorateFolderNodes = 1
vim.g.WebDevIconsUnicodeGlyphDoubleWidth = 1
vim.g.webdevicons_enable_airline_statusline = 1
vim.g.WebDevIconsNerdTreeGitPluginForceVAlign = 1
vim.g.WebDevIconsUnicodeGlyphDoubleWidth = 1
vim.g.WebDevIconsUnicodeDecorateFolderNodesDefaultSymbol = ''
vim.g.DevIconsDefaultFolderOpenSymbol = ''


local status_ok, web_dev_icnos = pcall(require, 'nvim-web-devicons')

if not status_ok then
    vim.notify('404: web-dev-icons')
    return
end

web_dev_icnos.setup { default = true }
