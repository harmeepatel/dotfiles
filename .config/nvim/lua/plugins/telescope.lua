local init = function()
    local ok, builtin = pcall(require, "telescope.builtin")

    if not ok then
        vim.notify("404: telescope")
        return
    end

    vim.keymap.set('n', "<leader>ff", builtin.find_files, {})
    vim.keymap.set('n', "<leader>fg", builtin.git_files, {})
    vim.keymap.set('n', '<leader>fr', builtin.live_grep, {})
    vim.keymap.set('n', "<leader>fb", builtin.buffers, {})
    vim.keymap.set('n', "<leader>fh", builtin.help_tags, {})
end

local opts = {
    defaults = {
        layout_config = {
            horizontal = {
                preview_width = 0.45,
                results_width = 1,
            },
            vertical = {
                mirror = false,
            },
            width = 0.80,
            height = 0.80,
            preview_cutoff = 120,
        },
        color_devicons = true,
        set_env = { ["COLORTERM"] = "truecolor" },
        file_ignore_patterns = { "node_modules" },
    },
}

return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim"
    },
    config = function()
        require"telescope".setup(opts)
    end,
    init = init,
}
