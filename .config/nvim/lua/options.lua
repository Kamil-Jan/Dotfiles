local set = vim.opt

-- Syntax Highlighting
set.syntax = 'on'

-- Indentation
set.tabstop = 4
set.softtabstop = 4
set.shiftwidth = 4
set.expandtab = true
set.smartindent = true
set.autoindent = true

-- Dark Colors
set.termguicolors = true
set.bg = 'dark'

-- No Annoying Sound
set.belloff = 'all'

-- Fast Scrolling
set.scrolljump = 5

-- Split Settings
set.splitright = true
set.splitbelow = true

-- Search Settings
set.incsearch = true
set.ignorecase = true
set.hls = false

-- Encoding And Spelling
set.encoding = 'utf-8'
set.spelllang = 'en_us,ru'
set.spell = true
set.keymap = 'russian-jcukenwin'
set.iminsert = 0

-- Text Width
set.textwidth = 79

-- Folding
set.foldmethod = "expr"
set.foldexpr = "nvim_treesitter#foldexpr()"

-- Left Column
set.nu = true
set.ruler = true
set.relativenumber = true
set.cursorline = true
set.signcolumn = "yes"

