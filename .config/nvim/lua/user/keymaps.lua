local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "

-- Buffer
keymap("n", "<leader>q", ":Bdelete<CR>", opts)

-- Nvimtree
keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts)

-- Window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Telescope
keymap("n", "<leader>ff", ":Telescope find_files<CR>", opts)
keymap("n", "<leader>fg", ":Telescope live_grep<CR>", opts)
keymap("n", "<leader>fb", ":Telescope buffers<CR>", opts)

-- When tabbing keep selection
keymap("v", ">", ">gv", opts)
keymap("v", "<", "<gv", opts)
