vim.g.group = vim.api.nvim_create_augroup('UserLazyLoad', { clear = true })

require("vim.diagnostic")

require("core.set")
require("core.remap")
require("core.au")
require("core.custom")

require("plugins.colorscheme")
require("plugins.treesitter")
require("plugins.telescope")
require("plugins.undotree")
require("plugins.netrw")
require("plugins.lsp")
require("plugins.ai.supermaven")

-- vim.lsp.log.set_level("DEBUG")
