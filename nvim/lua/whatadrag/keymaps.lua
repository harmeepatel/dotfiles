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
map("n", "<leader>p", ":pu<cr>")

--close buffer
map("n", "<leader>wc", ":bd<cr>")

-- yank to clipboard
map("n", "<leader>y", "\"+y")
map("v", "<leader>y", "\"+y")

-- tabing
map("n", "<TAB>", "V>")
map("n", "<S-TAB>", "V<")
map("v", "<TAB>", ">")
map("v", "<S-TAB>", "<")

-- close buffer
map("n", "<C-b>", ":bd<cr>")

-- format buffer
map("n", "<leader>=", ":lua vim.lsp.buf.formatting({ async = true })<cr>")


-- Changing panes and tabs
map("n", "<LEFT>", "<C-w>h")
map("n", "<RIGHT>", "<C-w>l")
map("n", "<UP>", "<C-w>k")
map("n", "<DOWN>", "<C-w>j")

-- move lines
map("n", "<A-j>", ":m .+1<cr>==")
map("n", "<A-k>", ":m .-2<cr>==")
map("i", "<A-j>", "<Esc>:m .+1<cr>==gi")
map("i", "<A-k>", "<Esc>:m .-2<cr>==gi")
map("v", "<A-j>", ":m '>+1<cr>gv=gv")
map("v", "<A-k>", ":m '<-2<cr>gv=gv")

-- resize windows
-- map("n", "<C-k>", ":vertical resize +3<cr>", opts)
-- map("n", "<C-j>", ":vertical resize -3<cr>", opts)
-- map("n", "<C-h>", ":resize +3<cr>", opts)
-- map("n", "<C-l>", ":resize +3<cr>", opts)


-- remove highlight
map("n", "<ESC>", ":noh<cr><ESC>", opts)


-- move between buffers
map("", "gt", ":bnext<cr>")
map("", "gT", ":bprev<cr>")

-- bufferline
map("n", "be", ":BufferLineSortByExtension<cr>", opts)
map("n", "bd", ":BufferLineSortByDirectory<cr>", opts)

-- nvim tree
map("n", "<leader>e", ":NvimTreeToggle<cr>")

-- undotree
map("n", "<F5>", ":UndotreeToggle<cr>")


-- telescope
-- Find files using Telescope command-line sugar.
map("n", "<leader>ff", ":Telescope find_files hidden=true<cr>")
map("n", "<leader>fr", ":Telescope live_grep<cr>")
map("n", "<leader>fb", ":Telescope buffers<cr>")
map("n", "<leader>fh", ":Telescope help_tags<cr>")
map("n", "<leader>gr", ":Telescope registers<cr>")

map("n", "<leader>lg", function() require('telescope.builtin').live_grep({ grep_open_files = true }) end)

-- telescope primeagen
map("n", "<leader>fg", ":lua require('telescope.builtin').git_files()<cr>")


-- comment box
-- left aligned fixed size box with left aligned text
map("n", "<Leader>bb", "<Cmd>lua require('comment-box').lbox()<cr>", {})
map("v", "<Leader>bb", "<Cmd>lua require('comment-box').lbox()<cr>", {})

-- centered adapted box with centered text
map("n", "<Leader>bc", "<Cmd>lua require('comment-box').accbox()<cr>", {})
map("v", "<Leader>bc", "<Cmd>lua require('comment-box').accbox()<cr>", {})

-- centered line
map("n", "<Leader>bl", "<Cmd>lua require('comment-box').cline()<cr>", {})
map("i", "<M-l>", "<Cmd>lua require('comment-box').cline()<cr>", {})

-- toggleterm
map("n", "<C-t>", "<Cmd>exe v:count1 . 'ToggleTerm'<cr>", {})
map("i", "<C-t>", "<Esc><Cmd>exe v:count1 . 'ToggleTerm'<cr>", {})
