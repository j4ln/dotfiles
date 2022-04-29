local opt = vim.opt

-- general
opt.autoread = true
opt.backup = false
opt.clipboard = "unnamedplus"
opt.encoding = "utf-8"

opt.swapfile = false
opt.undodir = os.getenv("HOME") .. "/.vim_undo"
opt.undofile = true

-- formatting (prefer tabs > spaces)
opt.smarttab = true
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = false

opt.autoindent = true
opt.backspace = { "indent", "eol", "start"}
opt.lazyredraw = true

-- search
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true

-- interface
opt.mouse = "a"
opt.showtabline = 2
opt.number = true
opt.relativenumber = false
opt.signcolumn = "number"
opt.title = true
opt.termguicolors = true
opt.cursorline = true

opt.splitbelow = true
opt.splitright = true
opt.scrolloff = 8
opt.sidescrolloff = 8
opt.wrap = true

vim.api.nvim_set_hl(0, 'SignColumn', {})
vim.api.nvim_set_hl(0, 'CursorLine', { underline = true })
