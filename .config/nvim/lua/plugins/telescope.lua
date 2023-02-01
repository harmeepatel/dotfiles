local config = function()

    local ok, telescope = pcall(require, "telescope")

    if not ok then
        vim.notify("404: telescope")
        return
    end

    local builtin = require("telescope.builtin")
    vim.keymap.set('n', "<leader>ff", builtin.find_files, {})
    vim.keymap.set('n', "<leader>fg", builtin.git_files, {})
    vim.keymap.set('n', '<leader>fr', builtin.live_grep, {})
    vim.keymap.set('n', "<leader>fb", builtin.buffers, {})
    vim.keymap.set('n', "<leader>fh", builtin.help_tags, {})
end

return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim"
    },
    config = config
}
