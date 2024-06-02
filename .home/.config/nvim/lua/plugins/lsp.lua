local ensure_installed = {
    'astro',
    'autotools_ls',
    'denols',
    'emmet_ls',
    'eslint',
    'gopls',
    'html',
    'cssls',
    'htmx',
    'jsonls',
    'lua_ls',
    'ltex',
    'pylsp',
    'rust_analyzer',
    'templ',
    'taplo',
    'tsserver',
    'tailwindcss',
    'wgsl_analyzer',
    'zls'
}

local config = function()
    require('mason').setup({})
    require('mason-lspconfig').setup({
        ensure_installed = ensure_installed,
    })
    local lspconfig = require('lspconfig')

    -- Set up lspconfig.
    local capabilities = require('cmp_nvim_lsp').default_capabilities()
    for _, server in ipairs(ensure_installed) do
        lspconfig[server].setup({
            capabilities = capabilities
        })
    end

    lspconfig.zls.setup({
        cmd = { "/Users/daddy_davinci/Developer/tools/zls/zig-out/bin/zls" }
    })

    lspconfig.lua_ls.setup({
        settings = {
            Lua = {
                diagnostics = {
                    globals = { 'vim' }
                }
            }
        }
    })

    lspconfig.pylsp.setup({
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

    -- templ
    vim.filetype.add({ extension = { templ = "templ" } })

    lspconfig.html.setup({
        filetypes = { 'html', 'templ' },
    })

    lspconfig.htmx.setup({
        filetypes = { 'html', 'templ' },
    })

    lspconfig.tailwindcss.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        filetypes = { "templ", "astro", "javascript", "typescript", "react" },
        init_options = { userLanguages = { templ = "html" } },
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


    -- hover boundry
    local border = {
        { "╭", "FloatBorder" }, -- top left corner
        { "─", "FloatBorder" }, -- top
        { "╮", "FloatBorder" }, -- top right corner
        { "│", "FloatBorder" }, -- right side center
        { "╯", "FloatBorder" }, -- bottom right corner
        { "─", "FloatBorder" }, -- bottom
        { "╰", "FloatBorder" }, -- bottom left corner
        { "│", "FloatBorder" }, -- left side center
    }
    -- local handlers = {
    --     ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = border }),
    --     ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = border }),
    -- }
    --
    -- -- Do not forget to use the on_attach function
    -- require 'lspconfig'.myserver.setup { handlers = handlers }
    --
    -- To instead override globally
    local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
    function vim.lsp.util.open_floating_preview(contents, syntax, opts)
        opts = opts or {}
        opts.border = opts.border or border
        return orig_util_open_floating_preview(contents, syntax, opts)
    end
end

return {
    'neovim/nvim-lspconfig',
    dependencies = {
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',
        {
            'j-hui/fidget.nvim',
            opts = {},
        },

        {
            'folke/neodev.nvim',
            opts = {},
        },
    },
    config = config,
}
