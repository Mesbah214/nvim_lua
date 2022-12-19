local M = {}

local function keymappings(client, bufnr)
  local bufopts = { noremap = true, silent = true, buffer = bufnr }

  -- Key mappings
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', '<leader>k', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)

  if client.server_capabilities.document_formatting then
    vim.keymap.set('n', '<space>f', vim.lsp.buf.format, bufopts)
  end
end

function M.setup(client, bufnr)
  keymappings(client, bufnr)
end

return M
