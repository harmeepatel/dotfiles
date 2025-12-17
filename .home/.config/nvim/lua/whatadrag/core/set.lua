vim.g.mapleader = ' '
vim.g.netrw_banner = 0

vim.o.syntax = "on"

vim.o.nu = true
vim.o.relativenumber = true

vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true

vim.o.splitbelow = true
vim.o.splitright = true
vim.o.scrolloff = 8
vim.o.signcolumn = "yes"

vim.o.swapfile = false
vim.o.backup = false
vim.o.undodir = os.getenv("HOME") .. "/.config/nvim/undodir"
vim.o.undofile = true
vim.o.clipboard = 'unnamedplus'

vim.o.smartindent = true

vim.o.wrap = false
vim.o.textwidth = 99

vim.o.incsearch = true

vim.o.termguicolors = true

vim.o.updatetime = 50

vim.o.colorcolumn = "100"

vim.o.pumheight = 16
