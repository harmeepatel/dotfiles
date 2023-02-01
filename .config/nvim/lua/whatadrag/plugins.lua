local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    "dstein64/vim-startuptime",
    "mbbill/undotree",

    "ellisonleao/gruvbox.nvim",
    {
        "catppuccin/nvim",
        name = "catppuccin"
    },
    "https://gitlab.com/__tpb/monokai-pro.nvim",
    'Mofiqul/vscode.nvim',
    -- "folke/toyonight.nvim",

    {
        "nvim-telescope/telescope.nvim",
        dependencies = {

            "nvim-lua/plenary.nvim"
        },
    },

    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate"
    },


    {
        "VonHeikemen/lsp-zero.nvim",
        dependencies = {
            -- LSP Support
            { "neovim/nvim-lspconfig" },
            { "williamboman/mason.nvim" },
            { "williamboman/mason-lspconfig.nvim" },

            -- Autocompletion
            { "hrsh7th/nvim-cmp" },
            { "hrsh7th/cmp-buffer" },
            { "hrsh7th/cmp-path" },
            { "saadparwaiz1/cmp_luasnip" },
            { "hrsh7th/cmp-nvim-lsp" },
            { "hrsh7th/cmp-nvim-lua" },

            -- Snippets
            { "L3MON4D3/LuaSnip" },
            { "rafamadriz/friendly-snippets" },
        }
    },

    "nvim-tree/nvim-web-devicons",
    "lewis6991/gitsigns.nvim",
    -- use ("nvim-lualine/lualine.nvim")
    "feline-nvim/feline.nvim",

    -- commenting
    {
        "numToStr/Comment.nvim",
        config = function()
            require("Comment").setup()
        end
    },
})
