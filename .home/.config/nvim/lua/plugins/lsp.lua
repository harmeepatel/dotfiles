local ensure_installed = {
    'bashls',
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
    'ts_ls',
    'tailwindcss',
    'wgsl_analyzer',
    'yamlls',
    'zls',
    'ols',
}

return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
        lazy = false,
    },

    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = ensure_installed,
            })
        end,
        lazy = false,
    },

    {
        "neovim/nvim-lspconfig",
        config = function()
            local lspconfig = require('lspconfig')
            local masonlsp = require("mason-lspconfig")

            local capabilities = require('blink.cmp').get_lsp_capabilities()
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

            lspconfig.clangd.setup {
                cmd = {
                    "clangd",
                    "--fallback-style=webkit"
                }
            }

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

            lspconfig.cssls.setup({
                settings = {
                    css = {
                        lint = {
                            unknownAtRules = 'ignore',
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
        end,
        lazy = false,
    },
}
