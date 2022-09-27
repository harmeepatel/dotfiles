local opts = { silent = true }
local map = vim.keymap.set

-- Classic
map("i", "kj", "<ESC>")
map("i", "jk", "<ESC>")
map("i", "KJ", "<ESC>")
map("i", "JK", "<ESC>")
map("n", "j", "gj")
map("n", "k", "gk")
map("v", "j", "gj")
map("v", "k", "gk")
map("n", "J", "gj")
map("n", "K", "gk")
map("v", "J", "gj")
map("v", "K", "gk")
map("n", ";", ":")
map("n", ":", ";")
map("v", ";", ":")
map("v", ":", ";")

-- pasting in new line
map("n", "<leader>p", ":pu<CR>")

--close buffer
map("n", "<leader>wc", ":bd<CR>")

-- yank to clipboard
map("n", "<leader>y", "\"+y")
map("v", "<leader>y", "\"+y")

-- tabing
map("n", "<TAB>", "V>")
map("n", "<S-TAB>", "V<")
map("v", "<TAB>", ">")
map("v", "<S-TAB>", "<")

-- close buffer
map("n", "<C-b>", ":bd<CR>")

-- format buffer
map("n", "<leader>=", ":lua vim.lsp.buf.formatting({ async = true })<CR>")


-- Changing panes and tabs
map("n", "<LEFT>", "<C-w>h")
map("n", "<RIGHT>", "<C-w>l")
map("n", "<UP>", "<C-w>k")
map("n", "<DOWN>", "<C-w>j")

-- move lines
map("n", "<A-j>", ":m .+1<CR>==")
map("n", "<A-k>", ":m .-2<CR>==")
map("i", "<A-j>", "<Esc>:m .+1<CR>==gi")
map("i", "<A-k>", "<Esc>:m .-2<CR>==gi")
map("v", "<A-j>", ":m '>+1<CR>gv=gv")
map("v", "<A-k>", ":m '<-2<CR>gv=gv")

-- resize windows
-- map("n", "<C-k>", ":vertical resize +3<CR>", opts)
-- map("n", "<C-j>", ":vertical resize -3<CR>", opts)
-- map("n", "<C-h>", ":resize +3<CR>", opts)
-- map("n", "<C-l>", ":resize +3<CR>", opts)


-- remove highlight
map("n", "<ESC>", ":noh<CR><ESC>", opts)


-- move between buffers
map("", "gt", ":bnext<CR>")
map("", "gT", ":bprev<CR>")

-- bufferline
map("n", "be", ":BufferLineSortByExtension<CR>", opts)
map("n", "bd", ":BufferLineSortByDirectory<CR>", opts)

-- nvim tree
map("n", "<leader>e", ":NvimTreeToggle<CR>")


-- telescope
-- Find files using Telescope command-line sugar.
map("n", "<leader>ff", ":Telescope find_files hidden=true<CR>")
map("n", "<leader>fr", ":Telescope live_grep<cr>")
map("n", "<leader>fb", ":Telescope buffers<cr>")
map("n", "<leader>fh", ":Telescope help_tags<cr>")
map("n", "<leader>gr", ":Telescope registers<cr>")

map("n", "<leader>lg", function() require('telescope.builtin').live_grep({ grep_open_files = true }) end)

-- telescope primeagen
map("n", "<leader>fg", ":lua require('telescope.builtin').git_files()<CR>")


-- comment box
-- left aligned fixed size box with left aligned text
map("n", "<Leader>bb", "<Cmd>lua require('comment-box').lbox()<CR>", {})
map("v", "<Leader>bb", "<Cmd>lua require('comment-box').lbox()<CR>", {})

-- centered adapted box with centered text
map("n", "<Leader>bc", "<Cmd>lua require('comment-box').accbox()<CR>", {})
map("v", "<Leader>bc", "<Cmd>lua require('comment-box').accbox()<CR>", {})

-- centered line
map("n", "<Leader>bl", "<Cmd>lua require('comment-box').cline()<CR>", {})
map("i", "<M-l>", "<Cmd>lua require('comment-box').cline()<CR>", {})

-- toggleterm
map("n", "<C-t>", "<Cmd>exe v:count1 . 'ToggleTerm'<CR>", {})
map("i", "<C-t>", "<Esc><Cmd>exe v:count1 . 'ToggleTerm'<CR>", {})
