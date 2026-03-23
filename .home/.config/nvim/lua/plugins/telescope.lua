-- hide statusline for telescope
vim.api.nvim_create_autocmd("FileType", {
    pattern = "TelescopePrompt",
    callback = function()
        vim.opt_local.statusline = ""
    end,
})

vim.pack.add({
    { src = "https://github.com/nvim-lua/plenary.nvim" },
    { src = "https://github.com/nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    { src = "https://github.com/nvim-tree/nvim-web-devicons" },
    { src = "https://github.com/nvim-telescope/telescope.nvim" },
})

require("telescope").setup({
    config = function(_, opts)
        local telescope = require("telescope")
        telescope.setup(opts)
        require('telescope').load_extension('fzf')

        vim.api.nvim_set_hl(0, 'TelescopeNormal', { bg = 'none' })
        vim.api.nvim_set_hl(0, 'TelescopeBorder', { bg = 'none' })
        vim.api.nvim_set_hl(0, 'TelescopeTitle', { bg = 'none' })
        vim.api.nvim_set_hl(0, 'TelescopePromptTitle', { bg = 'none' })
        vim.api.nvim_set_hl(0, 'TelescopePromptBorder', { bg = 'none' })
        vim.api.nvim_set_hl(0, 'TelescopePreviewTitle', { bg = 'none' })
        vim.api.nvim_set_hl(0, 'TelescopeResultsTitle', { bg = 'none' })
    end,
    defaults = {
        file_ignore_patterns = { "git/", "node%_modules", "go.sum", "zig%-cache", "zig%-out", "target", ".wasm", ".fiber.gz", "pgsql/" },
        layout_config = {
            horizontal = {
                preview_width = 0.64
            },
        },
        color_devicons = true,
    },
    extensions = {
        file_browser = {
            hijack_netrw = true,
        },
        fzf = {
            fuzzy = true,                   -- false will only do exact matching
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true,    -- override the file sorter
            case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
        }
    }
})

local builtin = require('telescope.builtin')
local cmdT = "<CMD>Telescope "

vim.keymap.set('n', "<leader>sh", cmdT .. "help_tags<CR>", { desc = "[S]earch [H]elp" })
vim.keymap.set('n', "<leader>sk", cmdT .. "keymaps<CR>", { desc = "[S]earch [K]eymaps" })
vim.keymap.set('n', "<leader>sf", cmdT .. "find_files<CR>", { desc = "[S]earch [F]iles" })
vim.keymap.set('n', "<leader>sw", cmdT .. "grep_string<CR>", { desc = "[S]earch current [W]ord" })
vim.keymap.set('n', "<leader>sg", cmdT .. "live_grep<CR>", { desc = "[S]earch by [G]rep" })
vim.keymap.set('n', "<leader>sd", cmdT .. "diagnostics<CR>", { desc = "[S]earch [D]iagnostics" })
vim.keymap.set('n', "<leader>sr", cmdT .. "resume<CR>", { desc = "[S]earch [R]esume" })
vim.keymap.set('n', "<leader>s.", cmdT .. "oldfiles<CR>", { desc = "[S]earch Recent Files (\".\" for repeat)" })
vim.keymap.set('n', "<leader><leader>", cmdT .. "buffers<CR>", { desc = "[ ] Find existing buffers" })

vim.keymap.set('n', '<leader>sF', function()
    builtin.lsp_dynamic_workspace_symbols({
        symbols = { "Function", "Method" },
        prompt_title = "Search Functions"
    })
end, { desc = "[S]earch [F]unctions" })
vim.keymap.set('n', '<leader>sc', function()
    builtin.lsp_dynamic_workspace_symbols({
        symbols = { "Class" },
        prompt_title = "Search Classes"
    })
end, { desc = "[S]earch [C]lasses" })
vim.keymap.set('n', '<leader>sv', function()
    builtin.lsp_dynamic_workspace_symbols({
        symbols = { "Variable", "Constant" },
        prompt_title = "Search Variables"
    })
end, { desc = "[S]earch [V]ariables" })

vim.keymap.set('n', "<leader>so", function()
    require("telescope.builtin").live_grep { grep_open_files = true, prompt_title = "Live Grep in Open Files", }
end, { desc = "[S]earch [/] in Open Files" })
vim.keymap.set('n', "<leader>sn", function()
    require("telescope.builtin").find_files { cwd = vim.fn.stdpath "config" }
end, { desc = "[S]earch [N]eovim files" })
