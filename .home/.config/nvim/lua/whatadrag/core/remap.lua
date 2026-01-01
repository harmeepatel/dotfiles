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
vim.keymap.set('v', '>', ">+1<CR>gv")
vim.keymap.set('v', '<', "<-1<CR>gv")

-- center cursor when moving
vim.keymap.set('n', "<C-d>", "<C-d>zz")
vim.keymap.set('n', "<C-u>", "<C-u>zz")
vim.keymap.set('n', 'n', "nzzzv")
vim.keymap.set('n', 'N', "Nzzzv")

-- paste over text and not loose yanked text
vim.keymap.set('x', "<leader>p", "\"_dP")

-- close
-- window
vim.keymap.set('n', "<leader>w", ":bd<CR>")
-- quick fix list
vim.keymap.set('n', "<leader>q", ":cclose")

-- indent rehighlight
-- vim.keymap.set('v', "<", ":<<CR><CMD>gv<CR>")
-- vim.keymap.set('x', "<", ":<<CR><CMD>gv<CR>")
-- vim.keymap.set('v', ">", ":<<CMD>gv<CR>")
-- vim.keymap.set('x', ">", ":<<CMD>gv<CR>")

-- quick fix list
vim.keymap.set('n', "<leader>cn", ":cn<CR>")
vim.keymap.set('n', "<leader>cp", ":cp<CR>")

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

-- golang
vim.keymap.set('n', '<leader>ge', 'oif err != nil {\n\n}<left><up>\t')
