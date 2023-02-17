-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
local opts = { noremap = true, silent = true }
local keymap = vim.keymap.set

keymap({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

--write buffer
keymap("n", "<leader>w", ":w<CR>", opts)

--quit nvim
keymap("n", "<leader>q", ":q<CR>", opts)

--cycle through previously opened buffer
keymap("n", "<leader><leader>", "<c-^><S-h>", opts)

--close a buffer
keymap("n", "<leader>c", ":bw<CR>", opts)

--close all open buffer
keymap("n", "<leader>ba", ":bufdo bd!<CR>", opts)

-- buffer navigation
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

--Instead of esc
keymap("i", "jk", "<ESC>", opts)

--indentation
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

--open explorer
-- keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts)
-- keymap("n", "<leader>e", vim.cmd.Ex)
-- keymap("n", "<leader>e", ":Lex 30<CR>", opts)

--paste consistemtly what copied
keymap("v", "p", '"_dP', opts)

--move lines ur and down
keymap("n", "<S-Up>", ":m .-2<CR>", opts)
keymap("n", "<S-Down>", ":m .+1<CR>", opts)

keymap("i", "<S-Up>", "<ESC>:m .-2<CR>", opts)
keymap("i", "<S-Down>", "<ESC>:m .+1<CR>", opts)

keymap("v", "<S-Up>", ":m '<-2<CR>gv", opts)
keymap("v", "<S-Down>", ":m '>+1<CR>gv", opts)

-- Remap for dealing with word wrap
keymap('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
keymap('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

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

-- call dashboard
keymap("n", "<leader>;", ":Dashboard<cr>", opts)

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})
