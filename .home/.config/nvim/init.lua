require("whatadrag.set")
require("whatadrag.remap")
require("whatadrag.lazy")
-- require("whatadrag.custom")

vim.cmd [[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]]
