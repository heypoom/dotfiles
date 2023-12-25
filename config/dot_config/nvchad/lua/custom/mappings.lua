local M = {}

M.cmp = {
  i = {
    ["<Up>"] = {
      function()
        local cmp = require("cmp")

        if cmp.visible() then
          cmp.select_prev_item()
        end
      end,
      "select previous item",
    },

    ["<Down>"] = {
      function()
        local cmp = require("cmp")

        if cmp.visible() then
          cmp.select_next_item()
        end
      end,
      "select next item",
    },
  }
}

return M
