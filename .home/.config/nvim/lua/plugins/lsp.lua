vim.diagnostic.config({
    float = {
        border = "rounded",
    },
})

return {
    "mason-org/mason-lspconfig.nvim",
    opts = {
        ensure_installed = {
            "bashls",
            "gopls",
            "html",
            "cssls",
            "clangd",
            "htmx",
            "jsonls",
            "lua_ls",
            "ltex",
            "nginx_language_server",
            "pylsp",
            "rust_analyzer",
            "templ",
            "taplo",
            "ts_ls",
            "tailwindcss",
            "wgsl_analyzer",
            "yamlls",
            "zls",
            "ols",
        },
    },
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        {
            "mason-org/mason.nvim",
            opts = {},
            event = { "BufReadPre", "BufNewFile" },
        },

        {
            "folke/lazydev.nvim",
            ft = "lua", -- only load on lua files
            opts = {
                library = {
                    -- See the configuration section for more details
                    -- Load luvit types when the `vim.uv` word is found
                    { path = "${3rd}/luv/library", words = { "vim%.uv" } },
                },
            },
        },

        {
            "neovim/nvim-lspconfig",
            event = { "BufReadPre", "BufNewFile" },
            keys = function()
                -- Enable completion triggered by <c-x><c-o>
                -- vim.bo[event.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

                return {
                    { "gD",         vim.lsp.buf.declaration,     desc = "[G]oto [D]eclaration" },
                    { "gd",         vim.lsp.buf.definition,      desc = "[G]oto [D]efinition" },
                    { "gi",         vim.lsp.buf.implementation,  desc = "[G]oto [I]mplementation" },
                    { "gr",         vim.lsp.buf.references,      desc = "[G]oto [R]efrences" },
                    { "<leader>gt", vim.lsp.buf.type_definition, desc = "[G]oto [T]ype definition" },
                    { "<leader>rn", vim.lsp.buf.rename,          desc = "[R]e[N]ame variables and function names" },
                    { "<leader>ca", vim.lsp.buf.code_action,     desc = "LSP: [C]ode [A]ctions" },
                    {
                        "K",
                        function()
                            vim.lsp.buf.hover({ border = "rounded" })
                        end,
                        desc = "hover info"
                    },
                    {
                        "<leader>=",
                        function() vim.lsp.buf.format({ async = true }) end,
                        desc = "format file"
                    },

                    -- map("<space>wa", vim.lsp.buf.add_workspace_folder, "")
                    -- map("<space>wr", vim.lsp.buf.remove_workspace_folder, "")
                    -- map("<space>wl", function()
                    --     print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
                    -- end, "")
                }
            end,

            config = function(_, _)
                local lspconfig = require("lspconfig")
                local masonlsp = require("mason-lspconfig")

                local capabilities = require("blink.cmp").get_lsp_capabilities()
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

                lspconfig.clangd.setup({
                    cmd = {
                        "clangd",
                        "--fallback-style=webkit"
                    }
                })

                lspconfig.pylsp.setup({
                    settings = {
                        pylsp = {
                            plugins = {
                                pycodestyle = {
                                    ignore = { "W391" },
                                    maxLineLength = 150
                                }
                            }
                        }
                    }
                })

                -- css
                lspconfig.cssls.setup({
                    settings = {
                        css = {
                            lint = {
                                unknownAtRules = "ignore",
                            }
                        }
                    }
                })

                -- templ
                vim.filetype.add({ extension = { templ = "templ" } })

                -- htmx
                lspconfig.htmx.setup({
                    filetypes = { "html", "templ" },
                    settings = {
                        ltex = {
                            enabled = { "html", "templ" }
                        }
                    },
                })

                -- tailwind
                lspconfig.tailwindcss.setup({
                    filetypes = { "templ", "astro", "javascript", "typescript", "react" },
                    init_options = { userLanguages = { templ = "html" } },
                })
            end,
        },
    },
}
