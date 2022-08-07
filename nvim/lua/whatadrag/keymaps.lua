local opts = { silent = true }
local keymap = vim.keymap.set

-- Classic
keymap("i", "kj", "<ESC>")
keymap("i", "jk", "<ESC>")
keymap("i", "KJ", "<ESC>")
keymap("i", "JK", "<ESC>")
keymap("n", "j", "gj")
keymap("n", "k", "gk")
keymap("v", "j", "gj")
keymap("v", "k", "gk")
keymap("n", "J", "gj")
keymap("n", "K", "gk")
keymap("v", "J", "gj")
keymap("v", "K", "gk")
keymap("n", ";", ":")
keymap("n", ":", ";")
keymap("v", ";", ":")
keymap("v", ":", ";")

-- pasting in new line
keymap("n", "<leader>p", ":pu<CR>")

--close buffer
keymap("n", "<leader>wc", ":bd<CR>")

-- tabing
keymap("n", "<TAB>", "V>")
keymap("n", "<S-TAB>", "V<")
keymap("v", "<TAB>", ">")
keymap("v", "<S-TAB>", "<")

-- close buffer
keymap("n", "<C-b>", ":bd<CR>")

-- format buffer
keymap("n", "<leader>=", ":lua vim.lsp.buf.formatting({ async = true })<CR>")


-- Changing panes and tabs
keymap("n", "<LEFT>", "<C-w>h")
keymap("n", "<RIGHT>", "<C-w>l")
keymap("n", "<UP>", "<C-w>k")
keymap("n", "<DOWN>", "<C-w>j")

-- move lines
keymap("n", "<A-j>", ":m .+1<CR>==")
keymap("n", "<A-k>", ":m .-2<CR>==")
keymap("i", "<A-j>", "<Esc>:m .+1<CR>==gi")
keymap("i", "<A-k>", "<Esc>:m .-2<CR>==gi")
keymap("v", "<A-j>", ":m '>+1<CR>gv=gv")
keymap("v", "<A-k>", ":m '<-2<CR>gv=gv")

-- resize windows
-- keymap("n", "<C-k>", ":vertical resize +3<CR>", opts)
-- keymap("n", "<C-j>", ":vertical resize -3<CR>", opts)
-- keymap("n", "<C-h>", ":resize +3<CR>", opts)
-- keymap("n", "<C-l>", ":resize +3<CR>", opts)


-- remove highlight
keymap("n", "<ESC>", ":noh<CR><ESC>", opts)


-- move between buffers
keymap("", "gt", ":bnext<CR>")
keymap("", "gT", ":bprev<CR>")

-- bufferline
keymap("n", "be", ":BufferLineSortByExtension<CR>", opts)
keymap("n", "bd", ":BufferLineSortByDirectory<CR>", opts)

-- nvim tree
keymap("n", "<leader>e", ":NvimTreeToggle<CR>")


-- telescope
-- Find files using Telescope command-line sugar.
keymap("n", "<leader>ff", ":Telescope find_files hidden=true<CR>")
keymap("n", "<leader>fr", ":Telescope live_grep<cr>")
keymap("n", "<leader>fb", ":Telescope buffers<cr>")
keymap("n", "<leader>fh", ":Telescope help_tags<cr>")
keymap("n", "<leader>gr", ":Telescope registers<cr>")

keymap("n", "<leader>lg", function() require('telescope.builtin').live_grep({ grep_open_files = true }) end)

-- telescope primeagen
keymap("n", "<leader>fg", ":lua require('telescope.builtin').git_files()<CR>")


-- comment box
-- left aligned fixed size box with left aligned text
keymap("n", "<Leader>bb", "<Cmd>lua require('comment-box').lbox()<CR>", {})
keymap("v", "<Leader>bb", "<Cmd>lua require('comment-box').lbox()<CR>", {})

-- centered adapted box with centered text
keymap("n", "<Leader>bc", "<Cmd>lua require('comment-box').accbox()<CR>", {})
keymap("v", "<Leader>bc", "<Cmd>lua require('comment-box').accbox()<CR>", {})

-- centered line
keymap("n", "<Leader>bl", "<Cmd>lua require('comment-box').cline()<CR>", {})
keymap("i", "<M-l>", "<Cmd>lua require('comment-box').cline()<CR>", {})

-- toggleterm
keymap("n", "<C-t>", "<Cmd>exe v:count1 . 'ToggleTerm'<CR>", {})
keymap("i", "<C-t>", "<Esc><Cmd>exe v:count1 . 'ToggleTerm'<CR>", {})
