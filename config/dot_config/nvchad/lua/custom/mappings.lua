local M = {}

M.telescope = {
  n = {
    ["<leader>fp"] = {
      function()
        require'telescope'.extensions.project.project {
          display_type = "full"
        }
      end,
      "Find projects"
    }
  }
}

M.cmp = {
  i = {
    ["<Up>"] = {
      function()
        local cmp = require("cmp")

        if cmp.visible() then
          cmp.select_prev_item()
        end
      end,
      "Select previous item",
    },

    ["<Down>"] = {
      function()
        local cmp = require("cmp")

        if cmp.visible() then
          cmp.select_next_item()
        end
      end,
      "Select next item",
    },
  },
}

return M
