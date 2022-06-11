local status_ok, hardline = pcall(require, "hardline")

if not status_ok then
    vim.notify("hardline not installed.")
    return
end

hardline.setup({})
