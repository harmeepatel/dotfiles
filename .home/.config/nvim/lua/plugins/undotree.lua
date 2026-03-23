vim.pack.add({
    { src="https://github.com/jiaoshijie/undotree" }
})

vim.keymap.set("n", "<F3>", "<cmd>lua require('undotree').toggle()<cr>" )
