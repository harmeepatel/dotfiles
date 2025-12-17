return {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    enabled = true,
    cmd = { "Telescope" },

    dependencies = {
        { "nvim-lua/plenary.nvim" },
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            build = "make",
        },
        {
            "nvim-telescope/telescope-ui-select.nvim",
        },
        {
            "nvim-tree/nvim-web-devicons",
            enabled = vim.g.have_nerd_font
        },
    },
    keys = function()
        -- local builtin = require("telescope.builtin")
        local cmdT = "<CMD>Telescope "
        return {
            { "<leader>sh",       cmdT .. "help_tags<CR>",   desc = "[S]earch [H]elp" },
            { "<leader>sk",       cmdT .. "keymaps<CR>",     desc = "[S]earch [K]eymaps" },
            { "<leader>sf",       cmdT .. "find_files<CR>",  desc = "[S]earch [F]iles" },
            { "<leader>sw",       cmdT .. "grep_string<CR>", desc = "[S]earch current [W]ord" },
            { "<leader>sg",       cmdT .. "live_grep<CR>",   desc = "[S]earch by [G]rep" },
            { "<leader>sd",       cmdT .. "diagnostics<CR>", desc = "[S]earch [D]iagnostics" },
            { "<leader>sr",       cmdT .. "resume<CR>",      desc = "[S]earch [R]esume" },
            { "<leader>s.",       cmdT .. "oldfiles<CR>",    desc = "[S]earch Recent Files (\".\" for repeat)" },
            { "<leader><leader>", cmdT .. "buffers<CR>",     desc = "[ ] Find existing buffers" },
            {
                "<leader>so",
                function()
                    require("telescope.builtin").live_grep { grep_open_files = true, prompt_title = "Live Grep in Open Files", }
                end,
                desc = "[S]earch [/] in Open Files"
            },
            {
                "<leader>sn",
                function()
                    require("telescope.builtin").find_files { cwd = vim.fn.stdpath "config" }
                end,
                desc = "[S]earch [N]eovim files"
            },
        }
    end,

    opts = function(_, opts)
        opts.defaults = {
            file_ignore_patterns = { "git/", "node%_modules", "go.sum", "zig%-cache", "zig%-out", "target", ".wasm", ".fiber.gz", "pgsql/" },
            layout_config = {
                horizontal = {
                    preview_width = 0.64
                },
            },
            color_devicons = true,

            prompt_prefix = " ",
        }
        opts.extensions = {
            ["ui-select"] = {
                require("telescope.themes").get_dropdown(),
            },
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
    end,

    config = function(_, opts)
        local telescope = require("telescope")
        telescope.setup(opts)
        require('telescope').load_extension('fzf')
        require('telescope').load_extension('ui-select')
    end,
}
