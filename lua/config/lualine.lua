local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
  return
end

local M = {}

function M.setup()

  local config = {
    options = {
      theme = 'nord',
      component_separators = { left = '', right = '' },
      section_separators = { left = '', right = '' },
      globalstatus = true
    }
  }

  lualine.setup(config)
end

return M
