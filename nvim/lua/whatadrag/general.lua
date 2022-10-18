-- :help options for more information

local G = vim.g
local O = vim.opt

G.mapleader = " "
G.maplocalleader = " "
G.syntax_on = true

O.mouse = "a"
O.clipboard = ""
O.colorcolumn = "80"
O.fileencoding = "utf-8"
O.encoding = "UTF-8"
O.syntax = "on"
O.showmode = false
O.number = true
O.relativenumber = true
O.expandtab = true
O.smartindent = true
O.cursorline = false
O.ignorecase = true
O.smartcase = true
O.errorbells = false
O.visualbell = false
O.splitbelow = true
O.splitright = true
O.backup = false
O.termguicolors = true

O.shiftwidth = 4
O.tabstop = 4
O.softtabstop = 4
O.numberwidth = 4
O.scrolloff = 12
O.sidescrolloff = 12
O.conceallevel = 0
O.pumheight = 16
O.laststatus = 3
O.signcolumn = "yes"
O.swapfile = false
O.undofile = true
O.writebackup = false
O.wrap = false

vim.g.Hexokinase_optInPatterns = 'full_hex,rgb,rgba,hsl,hsla'
vim.g.Hexokinase_highlighters = { 'foregroundfull' }
