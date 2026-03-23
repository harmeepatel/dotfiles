vim.g.group = vim.api.nvim_create_augroup('UserLazyLoad', { clear = true })

require("vim.diagnostic")


require("core.set")
require("core.remap")
require("core.au")
require("core.custom")

require("plugins.colorscheme")
require("plugins.status_line")
require("plugins.colorizer")
require("plugins.comment")
require("plugins.gitsigns")
require("plugins.lsp")
require("plugins.netrw")
require("plugins.telescope")
require("plugins.treesitter")
require("plugins.trouble")
require("plugins.ts_autotag")
require("plugins.undotree")
require("plugins.ai.supermaven")

-- vim.lsp.log.set_level("DEBUG")
