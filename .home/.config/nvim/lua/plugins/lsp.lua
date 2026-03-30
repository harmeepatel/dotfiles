vim.api.nvim_create_autocmd({ "BufReadPost" }, {
    group = vim.g.group,
    once = true,
    callback = function()
        -- lsp {

        vim.pack.add({
            { src = "https://github.com/mason-org/mason.nvim.git" },
            { src = "https://github.com/mason-org/mason-lspconfig.nvim.git" },
            { src = "https://github.com/neovim/nvim-lspconfig.git" },
        })

        vim.schedule(function()
            require("mason").setup()
            require("mason-lspconfig").setup({
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
            })
        end)

        local on_jump = function(diagnostic, bufnr)
            if diagnostic then
                vim.diagnostic.open_float(bufnr, {
                    focus = false,
                    border = "rounded",
                    source = "if_many",
                })
            end
        end

        vim.api.nvim_create_autocmd("LspAttach", {
            callback = function(ev)
                local opts = { buffer = ev.buf, silent = true }
                local mappings = {
                    { "gD",         vim.lsp.buf.declaration,                                               "Goto Declaration" },
                    { "gd",         vim.lsp.buf.definition,                                                "Goto Definition" },
                    { "gi",         vim.lsp.buf.implementation,                                            "Goto Implementation" },
                    { "gr",         vim.lsp.buf.references,                                                "Goto References" },
                    { "<leader>gt", vim.lsp.buf.type_definition,                                           "Goto Type Definition" },
                    { "<leader>rn", vim.lsp.buf.rename,                                                    "Rename variables and function names" },
                    { "<leader>ca", vim.lsp.buf.code_action,                                               "LSP: Code Actions" },
                    { "]d",         function() vim.diagnostic.jump({ count = 1, on_jump = on_jump }) end,  "Goto Next Diagnostic" },
                    { "[d",         function() vim.diagnostic.jump({ count = -1, on_jump = on_jump }) end, "Goto Prev Diagnostic" },
                    { "K",          function() vim.lsp.buf.hover({ border = "rounded" }) end,              "Hover info" },
                    { "<leader>=",  function() vim.lsp.buf.format({ async = true }) end,                   "Format file" },
                }

                for _, map in ipairs(mappings) do
                    opts.desc = map[3]
                    vim.keymap.set("n", map[1], map[2], opts)
                end
            end,
        })


        vim.filetype.add({ extension = { templ = "templ" } })

        vim.lsp.config("lua_ls", {
            settings = {
                Lua = {
                    workspace = { checkThirdParty = false, library = vim.api.nvim_get_runtime_file("", true) },
                    diagnostics = {
                        globals = { "vim" } }
                }
            }
        })

        vim.lsp.config["ltex"] = {
            filetypes = { "bib", "gitcommit", "org", "plaintex", "rst", "rnoweb", "tex", "pandoc", "quarto", "rmd", "context", "mail", "text" },
            settings = {
                ltex = {
                    enabled = { "bibtex", "gitcommit", "org", "tex", "restructuredtext", "rsweave", "latex", "quarto", "rmd", "context", "mail", "plaintext" }
                }
            },
        }

        vim.lsp.config["clangd"] = {
            cmd = {
                "clangd",
                "--fallback-style=webkit"
            }
        }

        vim.lsp.config["pylsp"] = {
            settings = {
                pylsp = {
                    plugins = {
                        pycodestyle = {
                            ignore = { "W391" },
                            maxLineLength = 120
                        }
                    }
                }
            }
        }

        vim.lsp.config["cssls"] = {
            settings = {
                css = {
                    lint = {
                        unknownAtRules = "ignore",
                    }
                }
            }
        }

        vim.lsp.config["rust_analyzer"] = {
            settings = {
                ["rust-analyzer"] = {
                    diagnostics = {
                        disabled = { "inactive-code" },
                    },
                },
            },
        }

        vim.lsp.config["tailwindcss"] = {
            filetypes = { "templ", "astro", "javascript", "typescript", "react", "rust" },
            init_options = { userLanguages = { templ = "html", rust = "html", } },
        }
        -- }
    end
})

vim.api.nvim_create_autocmd({ "InsertEnter" }, {
    group = vim.g.group,
    once = true,
    callback = function()
        -- blink {
        vim.pack.add({
            { src = "https://github.com/moyiz/blink-emoji.nvim" },
            { src = "https://github.com/L3MON4D3/LuaSnip" },
            { src = "https://github.com/saghen/blink.cmp",      name = "completion", version = "v1.10.1", build = "cargo build --release" },
        })

        local border_style = "rounded"
        require("blink.cmp").setup({
            keymap = { preset = "default" },
            appearance = {
                nerd_font_variant = "mono"
            },
            completion = {
                menu = { border = border_style },
                documentation = {
                    window = { border = border_style },
                    auto_show = true,
                },
            },
            signature = { window = { border = "single" } },
            sources = {
                default = { "lsp", "path", "snippets", "buffer", "emoji" },
                providers = {
                    lsp = {
                        name = "lsp",
                        enabled = true,
                        module = "blink.cmp.sources.lsp",
                        fallbacks = { "snippets", "buffer" },
                        score_offset = 90,
                    },
                    snippets = {
                        name = "snippets",
                        enabled = true,
                        max_items = 15,
                        min_keyword_length = 3,
                        module = "blink.cmp.sources.snippets",
                        score_offset = 85,
                    },
                    -- dadbod = {
                    --     name = "Dadbod",
                    --     module = "vim_dadbod_completion.blink",
                    --     min_keyword_length = 2,
                    --     score_offset = 85, -- the higher the number, the higher the priority
                    -- },
                    path = {
                        name = "Path",
                        module = "blink.cmp.sources.path",
                        fallbacks = { "snippets", "buffer" },
                        opts = {
                            trailing_slash = false,
                            label_trailing_slash = true,
                            get_cwd = function(context)
                                return vim.fn.expand(("#%d:p:h"):format(context.bufnr))
                            end,
                            show_hidden_files_by_default = true,
                        },
                        score_offset = 35,
                    },
                    buffer = {
                        name = "Buffer",
                        enabled = true,
                        max_items = 3,
                        module = "blink.cmp.sources.buffer",
                        min_keyword_length = 2,
                        score_offset = 25,
                    },
                    emoji = {
                        module = "blink-emoji",
                        name = "Emoji",
                        opts = {
                            insert = true, -- Insert emoji (default) or complete its name
                            ---@type string|table|fun():table
                            trigger = function()
                                return { ":" }
                            end,
                        },
                        -- should_show_items = function()
                        --     return vim.tbl_contains(
                        --     -- Enable emoji completion only for git commits and markdown.
                        --     -- By default, enabled for all file-types.
                        --         { "gitcommit", "markdown" },
                        --         vim.o.filetype
                        --     )
                        -- end,
                        score_offset = 15, -- Tune by preference
                    },
                },
            },
            cmdline = {
                enabled = true,
            },
            fuzzy = { implementation = "prefer_rust_with_warning" },
            snippets = {
                preset = "luasnip", -- Choose LuaSnip as the snippet engine
            }
        })
        --}
    end,
})
