local keys = {
    {
        "<leader>xx",
        "<cmd>Trouble diagnostics toggle<cr>",
        desc = "Diagnostics (Trouble)",
    },
    {
        "<leader>xX",
        "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
        desc = "Buffer Diagnostics (Trouble)",
    },
    {
        "<leader>cs",
        "<cmd>Trouble symbols toggle focus=false<cr>",
        desc = "Symbols (Trouble)",
    },
    {
        "<leader>cl",
        "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
        desc = "LSP Definitions / references / ... (Trouble)",
    },
    {
        "<leader>xL",
        "<cmd>Trouble loclist toggle<cr>",
        desc = "Location List (Trouble)",
    },
    {
        "<leader>xQ",
        "<cmd>Trouble qflist toggle<cr>",
        desc = "Quickfix List (Trouble)",
    },
}


vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
    group = vim.g.group,
    once = true,
    callback = function(ev)
        vim.pack.add({
            { src = "https://github.com/folke/trouble.nvim" }
        })

        local opts = { buffer = ev.buf, silent = true }
        for _, map in ipairs(keys) do
            opts.desc = map["desc"]
            vim.keymap.set("n", map[1], map[2], opts)
        end

        vim.schedule(function()
            require("trouble").setup({})
        end)
    end
})
