-- basic
vim.keymap.set('n', "<leader>e", ":Ex<CR>")

vim.keymap.set('i', "kj", "<ESC>")
vim.keymap.set('i', "KJ", "<ESC>")

vim.keymap.set('n', 'j', "gj")
vim.keymap.set('n', 'k', "gk")
vim.keymap.set('v', 'j', "gj")
vim.keymap.set('v', 'k', "gk")
-- vim.keymap.set('n', 'J', "gj")
-- vim.keymap.set('n', 'K', "gk")

-- move line or block
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

-- reselect lines after indentation
-- vim.keymap.set('x', '>', "><C-O>gv")
-- vim.keymap.set('x', '<', "<<C-O>gv")

-- center cursor when moving
vim.keymap.set('n', "<C-d>", "<C-d>zz")
vim.keymap.set('n', "<C-u>", "<C-u>zz")
vim.keymap.set('n', 'n', "nzzzv")
vim.keymap.set('n', 'N', "Nzzzv")

-- paste over text and not loose yanked text
vim.keymap.set('x', "<leader>p", "\"_dP")

-- close window
vim.keymap.set('n', "<leader>w", ":bd<CR>")

-- quick fix list
vim.keymap.set('n', "<leader>cn", ":cn")
vim.keymap.set('n', "<leader>cp", ":cp")

-- navigating buffers
vim.keymap.set('n', "<leader>bn", ":bnext<CR>")
vim.keymap.set('n', "<leader>bp", ":bprev<CR>")

-- navigating quick fix list
vim.keymap.set('n', "<C-j>", ":cnext<CR>")
vim.keymap.set('n', "<C-k>", ":cprev<CR>")

-- switching windows
for i = 1, 6 do
    local lsh = "<leader>" .. i
    local rsh = i .. "<C-w>w"
    vim.keymap.set('n', lsh, rsh, { desc = "Move to window " .. i })
end

-- lsp
vim.keymap.set('n', '<leader>df', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)
