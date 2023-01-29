local status_ok, nvim_treesitter = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  return
end

local M = {}

M.setup = function()
  nvim_treesitter.setup {
    ensure_installed = { "python", "css", "html", "lua", "c", "javascript", "tsx", "sql" },
    auto_install = true,
    sync_install = false,
    autotag = {
        enable = true
    },
    highlight = {
      enable = true,
      -- disable = { "html" }
    },
  }
end

return M
