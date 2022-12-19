local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
    return
end


local on_attach = function(client, bufnr)

    if client.server_capabilities.documentHighlightProvider then
        vim.cmd [[
    hi! LspReferenceRead cterm=bold ctermbg=red guibg='#4C566A'
    hi! LspReferenceText cterm=bold ctermbg=red guibg='#4C566A'
    hi! LspReferenceWrite cterm=bold ctermbg=red guibg='#4C566A'
  ]]
        vim.api.nvim_create_augroup('lsp_document_highlight', {
            clear = false
        })
        vim.api.nvim_clear_autocmds({
            buffer = bufnr,
            group = 'lsp_document_highlight',
        })
        vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
            group = 'lsp_document_highlight',
            buffer = bufnr,
            callback = vim.lsp.buf.document_highlight,
        })
        vim.api.nvim_create_autocmd('CursorMoved', {
            group = 'lsp_document_highlight',
            buffer = bufnr,
            callback = vim.lsp.buf.clear_references,
        })
    end
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
    -- Mappings.
    require("config.lsp.keymaps").setup(client, bufnr)
end
-- works for cmp
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

-- diagnostic signs
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- diagnostic settings
vim.diagnostic.config({
    virtual_text = true,
    signs = true,
    underline = false,
    update_in_insert = false,
    severity_sort = false,
})

--[[ local lsp_flags = {
    -- This is the default in Nvim 0.7+
    debounce_text_changes = 150,
} ]]

require('lspconfig')['pyright'].setup {
    capabilities = capabilities,
    on_attach = on_attach,
    -- flags = lsp_flags,
}

require('lspconfig')['clangd'].setup {
    capabilities = capabilities,
    on_attach = on_attach,
    -- flags = lsp_flags,
}

require('lspconfig')['sumneko_lua'].setup {
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' },
            },
        },
    },
    capabilities = capabilities,
    on_attach = on_attach,
    -- flags = lsp_flags,
}

require 'lspconfig'.emmet_ls.setup {}

--Enable (broadcasting) snippet capability for completion
capabilities.textDocument.completion.completionItem.snippetSupport = true

require 'lspconfig'.cssls.setup {
    capabilities = capabilities,
}

--Enable (broadcasting) snippet capability for completion
capabilities.textDocument.completion.completionItem.snippetSupport = true

require 'lspconfig'.html.setup {
    capabilities = capabilities,
}

require 'lspconfig'.tsserver.setup {}
require 'lspconfig'.efm.setup {}
require("config.lsp.cmp")
