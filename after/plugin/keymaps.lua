local opts = { noremap = true, silent = true }

local keymap = vim.keymap.set

--set leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

--open explorer
keymap("n", "<leader>e", vim.cmd.Ex)
-- keymap("n", "<leader>e", ":Lex 30<CR>", opts)

--write buffer
keymap("n", "<leader>w", ":w<CR>", opts)

--quit nvim
keymap("n", "<leader>q", ":q<CR>", opts)

--close a buffer
keymap("n", "<leader>c", ":bw<CR>", opts)

--close all open buffer
keymap("n", "<leader>ba", ":bufdo bd!<CR>", opts)

--Instead of esc
keymap("i", "jk", "<ESC>", opts)

--cycle through previously opened buffer
keymap("n", "<leader><leader>", "<c-^><S-h>", opts)

--indentation
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

--paste consistemtly what copied
keymap("v", "p", '"_dP', opts)

--move lines ur and down
keymap("n", "<S-Up>", ":m .-2<CR>", opts)
keymap("n", "<S-Down>", ":m .+1<CR>", opts)

keymap("i", "<S-Up>", "<ESC>:m .-2<CR>", opts)
keymap("i", "<S-Down>", "<ESC>:m .+1<CR>", opts)

keymap("v", "<S-Up>", ":m '<-2<CR>gv", opts)
keymap("v", "<S-Down>", ":m '>+1<CR>gv", opts)

--Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- window resize
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize +2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize -2<CR>", opts)

-- buffer navigation
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

--[[ -- telescope functions
keymap("n", "<leader>ff", "<cmd>lua require('telescope.builtin').find_files()<cr>", opts)
keymap("n", "<leader>fg", "<cmd>lua require('telescope.builtin').live_grep()<cr>", opts)
keymap("n", "<leader>fb", "<cmd>lua require('telescope.builtin').buffers()<cr>", opts)
keymap("n", "<leader>fh", "<cmd>lua require('telescope.builtin').help_tags()<cr>", opts)
keymap("n", "<leader>fr", "<cmd>lua require('telescope.builtin').oldfiles()<cr>", opts)
]]

-- call dashboard
keymap("n", "<leader>;", ":Dashboard<cr>", opts)

-- keymaps for bufferline
keymap("n", "<leader>1", "<Cmd>BufferLineGoToBuffer 1<CR>", opts)
keymap("n", "<leader>2", "<Cmd>BufferLineGoToBuffer 2<CR>", opts)
keymap("n", "<leader>3", "<Cmd>BufferLineGoToBuffer 3<CR>", opts)
keymap("n", "<leader>4", "<Cmd>BufferLineGoToBuffer 4<CR>", opts)
keymap("n", "<leader>5", "<Cmd>BufferLineGoToBuffer 5<CR>", opts)
keymap("n", "<leader>6", "<Cmd>BufferLineGoToBuffer 6<CR>", opts)
keymap("n", "<leader>7", "<Cmd>BufferLineGoToBuffer 7<CR>", opts)

