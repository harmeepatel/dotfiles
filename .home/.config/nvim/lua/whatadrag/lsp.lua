local keymap = vim.keymap
vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspConfig", {}),

    callback = function(ev)
        local opts = { buffer = ev.buf, silent = true }

        opts.desc = "Goto Declaration"
        keymap.set('n', "gD", vim.lsp.buf.declaration, opts)

        opts.desc = "Goto Definition"
        keymap.set('n', "gd", vim.lsp.buf.definition, opts)

        opts.desc = "Goto Implementation"
        keymap.set('n', "gi", vim.lsp.buf.implementation, opts)

        opts.desc = "Goto Refrences"
        keymap.set('n', "gr", vim.lsp.buf.references, opts)

        opts.desc = "Goto Type definition"
        keymap.set('n', "<leader>gt", vim.lsp.buf.type_definition, opts)

        opts.desc = "ReName variables and function names"
        keymap.set('n', "<leader>rn", vim.lsp.buf.rename, opts)

        opts.desc = "LSP: Code Actions"
        keymap.set('n', "<leader>ca", vim.lsp.buf.code_action, opts)

        opts.desc = "Goto Next Diagnostic"
        keymap.set('n', "]d", function() vim.diagnostic.jump({ count = 1 }) end, opts)

        opts.desc = "Goto Prev Diagnostic"
        keymap.set('n', "[d", function() vim.diagnostic.jump({ count = -1 }) end, opts)

        opts.desc = "Hover info"
        keymap.set('n', 'K', function() vim.lsp.buf.hover({ border = "rounded" }) end, opts)

        opts.desc = "Format file"
        keymap.set('n', "<leader>=", function() vim.lsp.buf.format({ async = true }) end, opts)

        opts.desc = "Restart LSP"
        keymap.set('n', "<leader>lr", ":LspRestart<CR>", opts)
    end,
})

-- lsp config {
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

-- css
vim.lsp.config["cssls"] = {
    settings = {
        css = {
            lint = {
                unknownAtRules = "ignore",
            }
        }
    }
}

-- templ
vim.filetype.add({ extension = { templ = "templ" } })

-- tailwind
vim.lsp.config["tailwindcss"] = {
    filetypes = { "templ", "astro", "javascript", "typescript", "react" },
    init_options = { userLanguages = { templ = "html" } },
}
-- }
