vim.api.nvim_create_autocmd("FileType", {
    pattern = "TelescopePrompt",
    callback = function()
        vim.opt_local.statusline = ""
    end,
})

local initialized = false
local function ensure_telescope()
    if initialized then return end

    vim.pack.add({
        { src = "https://github.com/nvim-lua/plenary.nvim" },
        { src = "https://github.com/nvim-telescope/telescope-fzf-native.nvim", build = "make" },
        { src = "https://github.com/nvim-tree/nvim-web-devicons" },
        { src = "https://github.com/nvim-telescope/telescope.nvim" },
    })

    local telescope = require("telescope")
    telescope.setup({
        defaults = {
            file_ignore_patterns = { "git/", "node%_modules", "go.sum", "zig%-cache", "zig%-out", "target", ".wasm", ".fiber.gz", "pgsql/" },
            layout_config = { horizontal = { preview_width = 0.64 } },
            color_devicons = true,
        },
        extensions = {
            file_browser = { hijack_netrw = true },
            fzf = {
                fuzzy = true,
                override_generic_sorter = true,
                override_file_sorter = true,
                case_mode = "smart_case",
            }
        }
    })
    pcall(telescope.load_extension, 'fzf')

    vim.api.nvim_set_hl(0, 'TelescopeNormal', { bg = 'none' })
    vim.api.nvim_set_hl(0, 'TelescopeBorder', { bg = 'none' })
    vim.api.nvim_set_hl(0, 'TelescopeTitle', { bg = 'none' })
    vim.api.nvim_set_hl(0, 'TelescopePromptTitle', { bg = 'none' })
    vim.api.nvim_set_hl(0, 'TelescopePromptBorder', { bg = 'none' })
    vim.api.nvim_set_hl(0, 'TelescopePreviewTitle', { bg = 'none' })
    vim.api.nvim_set_hl(0, 'TelescopeResultsTitle', { bg = 'none' })
    initialized = true
end

local function t_cmd(builtin_fn, opts)
    return function()
        ensure_telescope()
        require("telescope.builtin")[builtin_fn](opts or {})
    end
end

vim.keymap.set('n', "<leader>sh", t_cmd("help_tags"), { desc = "[S]earch [H]elp" })
vim.keymap.set('n', "<leader>sk", t_cmd("keymaps"), { desc = "[S]earch [K]eymaps" })
vim.keymap.set('n', "<leader>sf", t_cmd("find_files"), { desc = "[S]earch [F]iles" })
vim.keymap.set('n', "<leader>sw", t_cmd("grep_string"), { desc = "[S]earch current [W]ord" })
vim.keymap.set('n', "<leader>sg", t_cmd("live_grep"), { desc = "[S]earch by [G]rep" })
vim.keymap.set('n', "<leader>sd", t_cmd("diagnostics"), { desc = "[S]earch [D]iagnostics" })
vim.keymap.set('n', "<leader>sr", t_cmd("resume"), { desc = "[S]earch [R]esume" })
vim.keymap.set('n', "<leader>s.", t_cmd("oldfiles"), { desc = "[S]earch Recent Files (\".\" for repeat)" })
vim.keymap.set('n', "<leader><leader>", t_cmd("buffers"), { desc = "[ ] Find existing buffers" })

vim.keymap.set('n', '<leader>sF',
    t_cmd("lsp_dynamic_workspace_symbols", { symbols = { "Function", "Method" }, prompt_title = "Search Functions" }),
    { desc = "[S]earch [F]unctions" })
vim.keymap.set('n', '<leader>sc',
    t_cmd("lsp_dynamic_workspace_symbols", { symbols = { "Class" }, prompt_title = "Search Classes" }),
    { desc = "[S]earch [C]lasses" })
vim.keymap.set('n', '<leader>sv',
    t_cmd("lsp_dynamic_workspace_symbols", { symbols = { "Variable", "Constant" }, prompt_title = "Search Variables" }),
    { desc = "[S]earch [V]ariables" })
vim.keymap.set('n', "<leader>so",
    t_cmd("live_grep", { grep_open_files = true, prompt_title = "Live Grep in Open Files" }),
    { desc = "[S]earch [/] in Open Files" })
vim.keymap.set('n', "<leader>sn", t_cmd("find_files", { cwd = vim.fn.stdpath("config") }),
    { desc = "[S]earch [N]eovim files" })
