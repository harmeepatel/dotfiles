local status_ok, bufbar = pcall(require, 'bufbar')

if not status_ok then
    vim.notify('404: bufbar')
    return
end

bufbar.setup({
    show_index = true,        -- show tab index
    show_modify = true,       -- show buffer modification indicator
    modify_indicator = '[+]', -- modify indicator
    no_name = '[]',    -- no name buffer name
})
