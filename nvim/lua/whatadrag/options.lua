-- :help options for more information


vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.syntax_on = true

vim.opt.mouse = "a"
vim.opt.clipboard = ""
vim.opt.colorcolumn = "100"
vim.opt.fileencoding = "utf-8"
vim.opt.encoding = "UTF-8"
vim.opt.syntax = "on"
vim.opt.showmode = false
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.cursorline = false
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.errorbells = false
vim.opt.visualbell = false
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.backup = false
vim.opt.termguicolors = true

vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.numberwidth = 4
vim.opt.scrolloff = 12
vim.opt.sidescrolloff = 12
vim.opt.conceallevel = 0
vim.opt.pumheight = 16
vim.opt.laststatus = 3
vim.opt.signcolumn = "yes"
vim.opt.swapfile = false
vim.opt.undofile = true
vim.opt.undodir = vim.fn.expand('~/.vim/undodir')
vim.opt.writebackup = false
vim.opt.wrap = false

-- vim.g.Hexokinase_optInPatterns = 'full_hex,rgb,rgba,hsl,hsla'
vim.g.Hexokinase_highlighters = { 'foregroundfull' }
