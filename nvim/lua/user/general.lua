-- :help options for more information

local g = vim.g
local o = vim.opt

g.mapleader = " "
g.maplocalleader = " "
g.syntax_on = true

o.mouse = "a"
o.clipboard = "unnamedplus"
o.colorcolumn = "128"
o.fileencoding = "utf-8"
o.encoding = "UTF-8"
o.syntax = "on"
o.showmode = false
o.number = true
o.relativenumber = true
o.expandtab = true
o.smartindent = true
o.cursorline = true
o.ignorecase = true
o.smartcase = true
o.errorbells = false
o.visualbell = false
o.splitbelow = true
o.splitright = true
o.backup = false
o.termguicolors = true

o.shiftwidth = 4
o.tabstop = 4
o.softtabstop = 4
o.numberwidth = 4
o.scrolloff = 8
o.sidescrolloff = 8
o.conceallevel = 0
o.pumheight = 16
o.laststatus = 3
o.signcolumn = "yes"
o.swapfile = false
o.undofile = true
o.writebackup = false
o.wrap = false


-- autocmd
require 'user.autocmd'
