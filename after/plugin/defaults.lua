-- [[ Setting options ]]
-- See `:help vim.o`

local set = vim.o

-- Set highlight on search
set.hlsearch = false

-- Make line numbers default
vim.wo.number = true
vim.wo.relativenumber = true
-- set.numberwidth = 4

-- Enable mouse mode
set.mouse = 'a'

-- Enable break indent
set.breakindent = true

-- Save undo history
set.undofile = true

-- Case insensitive searching UNLESS /C or capital in search
set.ignorecase = true
set.smartcase = true

-- Decrease update time
set.updatetime = 250
vim.wo.signcolumn = 'yes'

-- Required to keep multiple buffer open
set.hidden = true

--Copy paste between vim and everything else
set.clipboard = "unnamedplus"

--Show the cursor position all the time
set.ruler = true

--Horizontal splits will automatically be below
set.splitbelow = true

--Vertical splits will automatically be to the right
set.splitright = true

--Enable highlighting of the current line
set.cursorline = true

--Your working directory will always be the same as your working directory
-- set.autochdir = true

--Makes tabbing smarter will realize you have 2 vs 4
set.smarttab = true

--Converts tabs to spaces
set.expandtab = true

--Makes indenting smart
set.smartindent = true

--Good auto indent
set.autoindent = true

--Insert 2 spaces for a tab
set.tabstop = 2

--Change the number of space characters inserted for indentation
set.shiftwidth = 4

--This is recommended by coc
set.backup = false
set.writebackup = false
set.swapfile = false

--Display long lines as just one line
set.wrap = false

--The encoding displayed 
set.fileencoding = "utf-8"

-- Restrict pointer go above or below by 8 lines
set.scrolloff = 8

--So that I can see `` in markdown files
set.conceallevel = 0

--Makes popup menu smaller
set.pumheight = 10

--Always show tabs 
set.showtabline = 2

--By default timeoutlen is 1000 ms
set.timeoutlen = 500

-- Vertical bar
set.colorcolumn = "80"

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

--We don't need to see things like -- INSERT -- anymore
-- set.showmode = false

-- set.foldenable = true
-- set.foldmethod = "indent"
-- set.foldlevel = 2
-- set.foldnestmax=5

-- set.cmdheight = 2                       --More space for displaying messages
-- set.laststatus = 0                      --Always display the status line
-- set.background = "dark"                 --tell vim what the background color looks like
