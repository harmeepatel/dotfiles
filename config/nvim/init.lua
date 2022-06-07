require 'user.general'
require 'user.colorscheme'
require 'user.keymaps'
require 'user.comment'
require 'user.plugins'
require 'user.colorizer'
require 'user.bufferline'
require 'user.web-devicons'
require 'user.toggleterm'
require 'user.nvim-tree'
require 'user.treesitter'
require 'user.gitsigns'
-- require 'user.indent-blankline'
require 'user.telescope'
require 'user.coc'

vim.cmd [[
    source ~/.config/nvim/lua/coc.vim
]]
