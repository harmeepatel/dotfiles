vim.pack.add({
    { src = "https://github.com/prichrd/netrw.nvim" }
})

vim.keymap.set('n', "<leader>e", "<cmd>Ex<CR>", { desc = "toggle netrw explorer" })

require("netrw").setup({
    use_devicons = true,
    mappings = {},
})
