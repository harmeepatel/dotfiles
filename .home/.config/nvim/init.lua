require("whatadrag.set")
require("whatadrag.remap")
require("whatadrag.lazy")
-- require("whatadrag.custom")

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- no commenting new line
vim.cmd([[autocmd BufEnter * set formatoptions-=o]])


vim.filetype.add({ extension = { templ = "templ" } })

vim.api.nvim_create_autocmd({ "BufWritePre" }, { pattern = { "*.templ" }, callback = vim.lsp.buf.format })
