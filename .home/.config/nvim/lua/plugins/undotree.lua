vim.pack.add({
    { src = "https://github.com/jiaoshijie/undotree" }
})

vim.keymap.set("n", "<F3>", function()
    require('undotree').toggle()
end, { desc = "Toggle Undotree" })
