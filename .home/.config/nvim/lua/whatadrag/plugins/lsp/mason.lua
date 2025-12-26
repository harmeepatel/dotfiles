return {
    "mason-org/mason-lspconfig.nvim",
    event = { 'BufReadPre', 'BufNewFile' },
    opts = {
        -- list of servers for mason to install
        ensure_installed = {
            "bashls",
            "clangd",
            "cssls",
            "gopls",
            "html",
            "jsonls",
            "ltex",
            "lua_ls",
            "marksman",
            "nginx_language_server",
            "ols",
            "pylsp",
            "rust_analyzer",
            "tailwindcss",
            "taplo",
            "templ",
            "ts_ls",
            "yamlls",
            "zls",
        },
    },
    dependencies = {
        {
            "williamboman/mason.nvim",
            opts = {},
        },

        {
            "folke/lazydev.nvim",
            ft = "lua",
            opts = {
                library = {
                    -- See the configuration section for more details
                    -- Load luvit types when the `vim.uv` word is found
                    { path = "${3rd}/luv/library", words = { "vim%.uv" } },
                },
            },
        },

        "neovim/nvim-lspconfig",
    },
}
