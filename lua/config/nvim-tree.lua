local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
  return
end

local M = {}

function M.setup()

  local lib = require("nvim-tree.lib")

  local git_add = function()
    local node = lib.get_node_at_cursor()
    local gs = node.git_status

    -- If the file is untracked, unstaged or partially staged, we stage it
    if gs == "??" or gs == "MM" or gs == "AM" or gs == " M" then
      vim.cmd("silent !git add " .. node.absolute_path)

      -- If the file is staged, we unstage
    elseif gs == "M " or gs == "A " then
      vim.cmd("silent !git restore --staged " .. node.absolute_path)
    end

    lib.refresh_tree()
  end

  nvim_tree.setup {
    update_cwd = true,
    view = {
      adaptive_size = true,
      mappings = {
        list = {
          { key = '<BS>', action = 'dir_up' },
          { key = "ga", action = "git_add", action_cb = git_add },
        },
      },
    },
    renderer = {
      indent_markers = {
        enable = true
      },
      icons = {
        glyphs = {
          default = "",
          symlink = "",
          git = {
            unstaged = "",
            staged = "S",
            unmerged = "",
            renamed = "➜",
            deleted = "",
            untracked = "U",
            ignored = "◌",
          },
        },
      },
    },
    diagnostics = {
      enable = true,
      show_on_dirs = true,
      debounce_delay = 50,
      icons = {
        hint = "",
        info = "",
        warning = "",
        error = "",
      },
    },
    filters = {
      dotfiles = true,
    },
  }
end

return M
