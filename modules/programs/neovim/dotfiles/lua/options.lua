vim.opt.mouse = ""
vim.opt.clipboard = "unnamedplus"
vim.opt.autowriteall = true

-- ==== line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- ==== tabs / indenting
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.wrap = false

-- ==== search
vim.opt.incsearch = true
vim.opt.hlsearch = false
vim.opt.smartcase = true

-- ==== theming / gui
vim.opt.termguicolors = true
vim.opt.showtabline = 0

vim.opt.smoothscroll = true;

vim.cursorline = true

vim.opt.splitbelow = true
vim.opt.splitright = true



-- ==== normal mode only
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("n", "<leader>th", "<cmd>set hlsearch!<CR>")
vim.keymap.set("i", "<C-h>", "<Left>")
vim.keymap.set("i", "<C-l>", "<Right>")
