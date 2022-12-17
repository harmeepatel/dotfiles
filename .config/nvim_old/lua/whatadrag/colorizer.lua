local status_ok, colorizer = pcall(require, 'colorizer')

if not status_ok then
    vim.notify('404: colorizer')
    return
end

colorizer.setup()
