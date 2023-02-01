-- basic
vim.keymap.set('n', "<leader>e", ":Ex<CR>")

vim.keymap.set('i', "kj", "<ESC>")
vim.keymap.set('i', "KJ", "<ESC>")

vim.keymap.set('n', 'j', "gj")
vim.keymap.set('n', 'k', "gk")
vim.keymap.set('v', 'j', "gj")
vim.keymap.set('v', 'k', "gk")
vim.keymap.set('n', 'J', "gj")
vim.keymap.set('n', 'K', "gk")

vim.keymap.set('n', ';', ':')
vim.keymap.set('n', ':', ';')
vim.keymap.set('v', ';', ':')
vim.keymap.set('v', ':', ';')

-- move line or block
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

-- center cursor when moving
vim.keymap.set('n', "<C-d>", "<C-d>zz")
vim.keymap.set('n', "<C-u>", "<C-u>zz")
vim.keymap.set('n', 'n', "nzzzv")
vim.keymap.set('n', 'N', "Nzzzv")

-- paste over text and not loose yanked text
vim.keymap.set("x", "<leader>p", "\"_dP")

-- format buffer
vim.keymap.set('n', "<leader>=", ":lua vim.lsp.buf.formatting({ async = true })<cr>")

-- close window
vim.keymap.set('n', "<leader>w", ":bd<CR>")
