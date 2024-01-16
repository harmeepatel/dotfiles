local config = function()
    local lspz = require("lsp-zero")
    local lspc = require("lspconfig")
    local cmp = require("cmp")
    local cmp_select = { behavior = cmp.SelectBehavior.Select }

    lspz.preset("recommended")
    lspz.ensure_installed({
        "astro",
        "denols",
        "emmet_ls",
        "eslint",
        "jsonls",
        "lua_ls",
        "pylsp",
        "rust_analyzer",
        "tsserver",
        "tailwindcss",
        "wgsl_analyzer"
    })

    lspz.configure("lua_ls", {
        settings = {
            Lua = {
                diagnostics = {
                    globals = { "vim" }
                }
            }
        }
    })

    lspz.configure("pylsp", {
        settings = {
            pylsp = {
                plugins = {
                    pycodestyle = {
                        ignore = { 'W391' },
                        maxLineLength = 150
                    }
                }
            }
        }
    })

    lspz.configure("tailwindcss", {
        settings = {
            tailwindCSS = {
                experimental = {
                    classRegex = {
                        { "cva\\(([^)]*)\\)",
                            "[\"'`]([^\"'`]*).*?[\"'`]" },
                    },
                },
            },
        },
    })

    -- todo
    lspz.configure("denols", {
        root_dir = lspc.util.root_pattern("deno.json", "deno.jsonc"),
        cmd = { vim.fn.stdpath('data') .. "/mason/packages/deno/deno" }
    })

    lspz.configure("tsserver", {
        root_dir = lspc.util.root_pattern("package.json"),
    })


    lspz.setup_nvim_cmp({
        mapping = lspz.defaults.cmp_mappings({
            ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
            ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
            ['<C-y>'] = cmp.mapping.confirm({ select = true }),
            ["<C-Space>"] = cmp.mapping.complete(),
        })
    })

    local on_attach = function(client, bufnr)
        -- from nvim-lspconfig
        -- https://github.com/neovim/nvim-lspconfig/blob/master/test/minimal_init.lua
        local function buf_set_option(...)
            vim.api.nvim_buf_set_option(bufnr, ...)
        end
        buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
        -- from minimal

        local opts = { buffer = bufnr, remap = false }
        if client.name == "eslint" then
            vim.cmd.LspStop('eslint')
            return
        end
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
        vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)
        vim.keymap.set("n", "[d", vim.diagnostic.goto_next, opts)
        vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, opts)
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
        vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, opts)
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
        vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
        vim.keymap.set('n', "<leader>=", function() vim.lsp.buf.format({ async = true }) end, opts)
    end

    lspz.on_attach(on_attach)
    lspz.setup()

    -- enable inline diagnostics through lsp
    vim.lsp.handlers["textDocument/publishDiagnostics"] =
        vim.lsp.with(
            vim.lsp.diagnostic.on_publish_diagnostics,
            {
                virtual_text = true,
            }
        )
end

return {
    "VonHeikemen/lsp-zero.nvim",
    branch = 'v1.x',
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
        {
            "j-hui/fidget.nvim",
            opts = {
                notification = {
                    -- Options related to the notification window and buffer
                    window = {
                        winblend = 50, -- Background color opacity in the notification window
                    },
                },
            },
        }
    },
    config = config,
    event = "VeryLazy"
}
