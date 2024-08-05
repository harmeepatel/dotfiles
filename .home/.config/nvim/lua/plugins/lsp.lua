local ensure_installed = {
    'emmet_language_server',
    -- 'eslint',
    'gopls',
    'html',
    'cssls',
    'clangd',
    'htmx',
    'jsonls',
    'lua_ls',
    'ltex',
    'nginx_language_server',
    'pylsp',
    'rust_analyzer',
    'templ',
    'taplo',
    'tsserver',
    'tailwindcss',
    'wgsl_analyzer',
    'zls'
}

local function hover_border()
    -- hover boundry
    local border = {
        { '╭', 'FloatBorder' }, -- top left corner
        { '─', 'FloatBorder' }, -- top
        { '╮', 'FloatBorder' }, -- top right corner
        { '│', 'FloatBorder' }, -- right side center
        { '╯', 'FloatBorder' }, -- bottom right corner
        { '─', 'FloatBorder' }, -- bottom
        { '╰', 'FloatBorder' }, -- bottom left corner
        { '│', 'FloatBorder' }, -- left side center
    }

    local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
    function vim.lsp.util.open_floating_preview(contents, syntax, opts)
        opts = opts or {}
        opts.border = opts.border or border
        return orig_util_open_floating_preview(contents, syntax, opts)
    end
end

return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    },

    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = ensure_installed,
            })
        end,
    },

    {
        "neovim/nvim-lspconfig",
        config = function()
            local lspconfig = require('lspconfig')
            local masonlsp = require("mason-lspconfig")

            local capabilities = require('cmp_nvim_lsp').default_capabilities()
            for _, server in ipairs(masonlsp.get_installed_servers()) do
                lspconfig[server].setup({
                    capabilities = capabilities
                })
            end

            lspconfig.ltex.setup({
                filetypes = { "bib", "gitcommit", "markdown", "org", "plaintex", "rst", "rnoweb", "tex", "pandoc", "quarto", "rmd", "context", "mail", "text" },
                settings = {
                    ltex = {
                        enabled = { "bibtex", "gitcommit", "markdown", "org", "tex", "restructuredtext", "rsweave", "latex", "quarto", "rmd", "context", "mail", "plaintext" }
                    }
                },
            })

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
            hover_border()
        end,

    },
}
