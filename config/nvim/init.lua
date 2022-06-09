require 'user.general'
require 'user.colorscheme'
require 'user.keymaps'
require 'user.comment'
require 'user.plugins'
require 'user.colorizer'
require 'user.hardline'
require 'user.bufferline'
require 'user.web_devicons'
require 'user.toggleterm'
require 'user.nvim_tree'
require 'user.treesitter'
require 'user.gitsigns'
require 'user.telescope'
require 'user.coc'
-- require 'user.indent-blankline'

vim.cmd [[
    source ~/.config/nvim/lua/coc.vim
]]
