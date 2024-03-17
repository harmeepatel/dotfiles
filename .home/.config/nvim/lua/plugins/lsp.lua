local ensure_installed = {
    'astro',
    'denols',
    'emmet_ls',
    'eslint',
    'gopls',
    'html',
    'htmx',
    'jsonls',
    'lua_ls',
    'pylsp',
    'rust_analyzer',
    'zls',
    'tsserver',
    'tailwindcss',
    'wgsl_analyzer'
}

local config = function()
    require('mason').setup({})
    require('mason-lspconfig').setup({
        ensure_installed = ensure_installed,
    })
    local lspconfig = require('lspconfig')

    vim.keymap.set('n', '<leader>df', vim.diagnostic.open_float)
    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
    vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
    vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)

    vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
        callback = function(event)
            -- Enable completion triggered by <c-x><c-o>
            local map = function(keys, func, desc)
                vim.keymap.set('n', keys, func,
                    { buffer = event.buf, desc = 'LSP: ' .. desc }
                )
            end

            vim.bo[event.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

            map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
            map('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
            map('gi', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
            map('gr', vim.lsp.buf.references, '[G]oto [R]efrences')
            map('<leader>gt', vim.lsp.buf.type_definition, '[G]oto [T]ype definition')
            map('<leader>rn', vim.lsp.buf.rename, '[R]e[N]ame variables and function names')
            map('K', vim.lsp.buf.hover, 'hover info')
            map('<C-k>', vim.lsp.buf.signature_help, 'signature help')
            map('<leader>=', function() vim.lsp.buf.format({ async = true }) end, 'format file')
            -- map('<space>wa', vim.lsp.buf.add_workspace_folder, '')
            -- map('<space>wr', vim.lsp.buf.remove_workspace_folder, '')
            -- map('<space>wl', function()
            --     print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
            -- end, '')
            vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, { desc = 'LSP: [C]ode [A]ctions' })
        end,
    })

    -- Set up lspconfig.
    local capabilities = require('cmp_nvim_lsp').default_capabilities()
    for _, server in ipairs(ensure_installed) do
        lspconfig[server].setup({
            capabilities = capabilities
        })
    end

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

    -- for go templ templating
    lspconfig.html.setup({
        filetypes = { 'html', 'templ' },
    })

    lspconfig.htmx.setup({
        filetypes = { 'html', 'templ' },
    })

    lspconfig.tailwindcss.setup({
        settings = {
            filetypes = { 'templ', 'astro', 'javascript', 'typescript', 'react' },
            init_options = { userLanguages = { templ = 'html' } },
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
    event = "VeryLazy",
}
