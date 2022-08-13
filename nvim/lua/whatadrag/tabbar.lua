local status_ok, tabline = pcall(require, 'tabline')

if not status_ok then
    vim.notify('404: tabline')
    return
end

tabline.setup({
    show_index = true, -- show tab index
    show_modify = true, -- show buffer modification indicator
    modify_indicator = '[+]', -- modify indicator
    no_name = '[No name]', -- no name buffer name
})
