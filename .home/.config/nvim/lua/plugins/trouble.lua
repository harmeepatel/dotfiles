vim.pack.add({
    { src = "https://github.com/folke/trouble.nvim" }
})

local initialized = false
local function trouble_cmd(cmd_str)
    return function()
        if not initialized then
            require("trouble").setup({})
            initialized = true
        end
        vim.cmd("Trouble " .. cmd_str)
    end
end

local keys = {
    { "<leader>xx", trouble_cmd("diagnostics toggle"),                        desc = "Diagnostics (Trouble)" },
    { "<leader>xX", trouble_cmd("diagnostics toggle filter.buf=0"),           desc = "Buffer Diagnostics (Trouble)" },
    { "<leader>cs", trouble_cmd("symbols toggle focus=false"),                desc = "Symbols (Trouble)" },
    { "<leader>cl", trouble_cmd("lsp toggle focus=false win.position=right"), desc = "LSP Definitions / references / ... (Trouble)" },
    { "<leader>xL", trouble_cmd("loclist toggle"),                            desc = "Location List (Trouble)" },
    { "<leader>xQ", trouble_cmd("qflist toggle"),                             desc = "Quickfix List (Trouble)" },
}

for _, map in ipairs(keys) do
    vim.keymap.set("n", map[1], map[2], { silent = true, desc = map.desc })
end
