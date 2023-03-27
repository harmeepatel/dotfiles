local init = function()
    local lsp_lines = require('lsp_lines')
    vim.keymap.set('n', "<leader>ll", lsp_lines.toggle)
end

return {
    "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    config = function()
        require("lsp_lines").setup()
    end,
    init = init,
}
