return {
  "nvim-neo-tree/neo-tree.nvim",
  cmd="Neotree",
  branch = "v2.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
  },
  keys = {
    {"<leader>e", "<cmd>Neotree toggle<CR>"},
  },
  config = function()
    require("neo-tree").setup({
      popup_border_style = "rounded",
      window = {
        width = 30,
        mappings = {
        ["h"] = function(state)
          local node = state.tree:get_node()
            if node.type == 'directory' and node:is_expanded() then
              require'neo-tree.sources.filesystem'.toggle_directory(state, node)
            else
              require'neo-tree.ui.renderer'.focus_node(state, node:get_parent_id())
            end
          end,
        ["l"] = function(state)
          local node = state.tree:get_node()
            if node.type == 'directory' then
              if not node:is_expanded() then
                require'neo-tree.sources.filesystem'.toggle_directory(state, node)
              elseif node:has_children() then
                require'neo-tree.ui.renderer'.focus_node(state, node:get_child_ids()[1])
              end
            end
          end,
        }
      }
    })
  end,
}
