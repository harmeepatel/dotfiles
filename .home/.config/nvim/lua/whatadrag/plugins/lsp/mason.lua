return {
    "mason-org/mason-lspconfig.nvim",
    event = { 'BufReadPre', 'BufNewFile' },
    opts = {
        -- list of servers for mason to install
        ensure_installed = {
            "bashls",
            "gopls",
            "html",
            "cssls",
            "clangd",
            "jsonls",
            "lua_ls",
            "ltex",
            "marksman",
            "nginx_language_server",
            "pylsp",
            "rust_analyzer",
            "templ",
            "taplo",
            "ts_ls",
            "yamlls",
            "zls",
            "ols",
        },
    },
    dependencies = {
        {
            "williamboman/mason.nvim",
            opts = {},
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

        "neovim/nvim-lspconfig",
    },
}


-- return {
--     "mason-org/mason-lspconfig.nvim",
--     opts = {
--         ensure_installed = {
--             "bashls",
--             "gopls",
--             "html",
--             "cssls",
--             "clangd",
--             "jsonls",
--             "lua_ls",
--             "ltex",
--             "marksman",
--             "nginx_language_server",
--             "pylsp",
--             "rust_analyzer",
--             "templ",
--             "taplo",
--             "ts_ls",
--             "wgsl_analyzer",
--             "yamlls",
--             "zls",
--             "ols",
--         },
--     },
--     event = { "BufReadPre", "BufNewFile" },
--     dependencies = {
--         {
--             "mason-org/mason.nvim",
--             opts = {},
--         },
--
--         {
--             "folke/lazydev.nvim",
--             ft = "lua", -- only load on lua files
--             opts = {
--                 library = {
--                     -- See the configuration section for more details
--                     -- Load luvit types when the `vim.uv` word is found
--                     { path = "${3rd}/luv/library", words = { "vim%.uv" } },
--                 },
--             },
--         },
--
--         {
--             "neovim/nvim-lspconfig",
--             event = { "BufReadPre", "BufNewFile" },
--             keys = function()
--                 -- Enable completion triggered by <c-x><c-o>
--                 -- vim.bo[event.buf].omnifunc = "v:lua.vim.lsp.omnifunc"
--
--                 return {
--                     { "gD",         vim.lsp.buf.declaration,     desc = "Goto Declaration" },
--                     { "gd",         vim.lsp.buf.definition,      desc = "Goto Definition" },
--                     { "gi",         vim.lsp.buf.implementation,  desc = "Goto Implementation" },
--                     { "gr",         vim.lsp.buf.references,      desc = "Goto Refrences" },
--                     { "<leader>gt", vim.lsp.buf.type_definition, desc = "Goto Type definition" },
--                     { "<leader>rn", vim.lsp.buf.rename,          desc = "ReName variables and function names" },
--                     { "<leader>ca", vim.lsp.buf.code_action,     desc = "LSP: Code Actions" },
--                     {
--                         "]d",
--                         function()
--                             vim.diagnostic.jump({ count = 1, float = true })
--                         end,
--                         desc = "Goto Next Diagnostic"
--                     },
--                     {
--                         "[d",
--                         function()
--                             vim.diagnostic.jump({ count = -1, float = true })
--                         end,
--                         desc = "Goto Prev Diagnostic"
--                     },
--                     {
--                         "K",
--                         function()
--                             vim.lsp.buf.hover({ border = "rounded" })
--                         end,
--                         desc = "hover info"
--                     },
--                     {
--                         "<leader>=",
--                         function() vim.lsp.buf.format({ async = true }) end,
--                         desc = "format file"
--                     },
--
--                     -- map("<space>wa", vim.lsp.buf.add_workspace_folder, "")
--                     -- map("<space>wr", vim.lsp.buf.remove_workspace_folder, "")
--                     -- map("<space>wl", function()
--                         --     print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
--                         -- end, "")
--                     }
--                 end,
--
--                 config = function()
--                     vim.lsp.config["ltex"] = {
--                         filetypes = { "bib", "gitcommit", "org", "plaintex", "rst", "rnoweb", "tex", "pandoc", "quarto", "rmd", "context", "mail", "text" },
--                         settings = {
--                             ltex = {
--                                 enabled = { "bibtex", "gitcommit", "org", "tex", "restructuredtext", "rsweave", "latex", "quarto", "rmd", "context", "mail", "plaintext" }
--                             }
--                         },
--                     }
--
--                     vim.lsp.config["clangd"] = {
--                         cmd = {
--                             "clangd",
--                             "--fallback-style=webkit"
--                         }
--                     }
--
--                     vim.lsp.config["pylsp"] = {
--                         settings = {
--                             pylsp = {
--                                 plugins = {
--                                     pycodestyle = {
--                                         ignore = { "W391" },
--                                         maxLineLength = 120
--                                     }
--                                 }
--                             }
--                         }
--                     }
--
--                     -- css
--                     vim.lsp.config["cssls"] = {
--                         settings = {
--                             css = {
--                                 lint = {
--                                     unknownAtRules = "ignore",
--                                 }
--                             }
--                         }
--                     }
--
--                     -- templ
--                     vim.filetype.add({ extension = { templ = "templ" } })
--
--                     -- tailwind
--                     vim.lsp.config["tailwindcss"] = {
--                         filetypes = { "templ", "astro", "javascript", "typescript", "react" },
--                         init_options = { userLanguages = { templ = "html" } },
--                     }
--                 end,
--             },
--         },
--     }
