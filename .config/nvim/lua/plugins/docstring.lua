local init = function()
    local opts = { noremap = true, silent = true }
    vim.api.nvim_set_keymap("n", "<Leader>ds", ":lua require('neogen').generate()<CR>", opts)
end

return {
    "danymat/neogen",
    dependencies = "nvim-treesitter/nvim-treesitter",
    config = true,
    init = init
}
