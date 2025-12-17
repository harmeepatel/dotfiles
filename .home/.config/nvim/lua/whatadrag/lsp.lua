local keymap = vim.keymap
vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspConfig", {}),

    callback = function(ev)
        local opts = { buffer = ev.buf, silent = true }

        opts.desc = "Goto Declaration"
        keymap.set("n",  "gD",          vim.lsp.buf.declaration, opts)

        opts.desc = "Goto Definition"
        keymap.set("n",  "gd",          vim.lsp.buf.definition, opts)

        opts.desc = "Goto Implementation"
        keymap.set("n",  "gi",          vim.lsp.buf.implementation, opts)

        opts.desc = "Goto Refrences"
        keymap.set("n",  "gr",          vim.lsp.buf.references, opts)

        opts.desc = "Goto Type definition"
        keymap.set("n",  "<leader>gt",  vim.lsp.buf.type_definition, opts)

        opts.desc = "ReName variables and function names"
        keymap.set("n",  "<leader>rn",  vim.lsp.buf.rename, opts)

        opts.desc = "LSP: Code Actions"
        keymap.set("n",  "<leader>ca",  vim.lsp.buf.code_action, opts)

        opts.desc = "Goto Next Diagnostic"
        keymap.set("n",  "]d",  function() vim.diagnostic.jump({ count = 1, float = true }) end, opts)

        opts.desc = "Goto Prev Diagnostic"
        keymap.set("n",  "[d",  function() vim.diagnostic.jump({ count = -1, float = true }) end, opts)

        opts.desc = "hover info"
        keymap.set("n",  "K",  function() vim.lsp.buf.hover({ border = "rounded" }) end, opts)

        opts.desc = "format file"
        keymap.set("n",  "<leader>=",  function() vim.lsp.buf.format({ async = true }) end, opts)
    end,
})

local severity = vim.diagnostic.severity
vim.diagnostic.config({
    float = {
        border = "rounded",
    },
})

