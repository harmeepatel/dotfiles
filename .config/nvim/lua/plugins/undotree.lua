local init = function()
    vim.keymap.set("n", "<F3>", vim.cmd.UndotreeToggle)
end

return {
    "mbbill/undotree",
    init = init
}
