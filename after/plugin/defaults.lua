local set = vim.opt

set.hidden = true                       --Required to keep multiple buffers open
set.ruler = true                  		  --Show the cursor position all the time
set.undofile = true
set.splitbelow = true                   --Horizontal splits will automatically be below
set.splitright = true                   --Vertical splits will automatically be to the right
set.cursorline = true                   --Enable highlighting of the current line
set.ignorecase = true
set.number = true
set.relativenumber = true               --Line numbers
set.autochdir = true                    --Your working directory will always be the same as your working directory
-- set.termguicolors = true

set.smarttab = true                     --Makes tabbing smarter will realize you have 2 vs 4
set.expandtab = true                    --Converts tabs to spaces
set.smartindent = true                  --Makes indenting smart
set.autoindent = true                   --Good auto indent
set.tabstop = 2                         --Insert 2 spaces for a tab
set.shiftwidth = 4                      --Change the number of space characters inserted for indentation
set.foldenable = true
set.foldmethod = "indent"
set.foldlevel = 2

set.backup = false
set.wrap = false                        --Display long lines as just one line
set.swapfile = false
-- set.showmode = false                    --We don't need to see things like -- INSERT -- anymore
set.writebackup = false                 --This is recommended by coc

set.fileencoding = "utf-8"              --The encoding displayed 
set.mouse = "a"                             --Enable your mouse 
set.numberwidth = 4 
set.scrolloff = 8
set.conceallevel = 0                    --So that I can see `` in markdown files
set.pumheight = 10                      --Makes popup menu smaller
-- set.cmdheight = 2                       --More space for displaying messages

-- set.laststatus = 0                      --Always display the status line
-- set.background = "dark"                 --tell vim what the background color looks like
set.showtabline = 2                     --Always show tabs 
set.updatetime = 300                    --Faster completion
-- set.foldnestmax=5
set.timeoutlen = 500                    --By default timeoutlen is 1000 ms
set.clipboard = "unnamedplus"           --Copy paste between vim and everything else
set.colorcolumn = "80"
