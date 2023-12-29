local M = {}

M.general = {
  n = {
    ["<Esc>"] = {
      function()
        vim.cmd.noh()
        require("notify").dismiss {}
      end,
      "Clear Highlights",
    },
  },
}

M.trouble = {
  n = {
    ["<leader>tt"] = {
      ":TroubleToggle<CR>",
      "Trouble",
    },
  },
}

M.code_actions = {
  n = {
    ["<leader>ca"] = {
      function()
        require("actions-preview").code_actions()
      end,
      "Code Actions",
    },
  },
  v = {
    ["<leader>ca"] = {
      function()
        require("actions-preview").code_actions()
      end,
      "Code Actions",
    },
  },
}

M.undotree = {
  n = {
    ["<leader>u"] = {
      ":UndotreeToggle<CR>",
      "Show undo tree",
    },
  },
}

M.telescope = {
  n = {
    ["<leader>fp"] = {
      function()
        require("telescope").extensions.project.project {
          display_type = "full",
        }
      end,
      "Find projects",
    },
  },
}

M.cmp = {
  i = {
    ["<Up>"] = {
      function()
        local cmp = require "cmp"

        if cmp.visible() then
          cmp.select_prev_item()
        end
      end,
      "Select previous item",
    },

    ["<Down>"] = {
      function()
        local cmp = require "cmp"

        if cmp.visible() then
          cmp.select_next_item()
        end
      end,
      "Select next item",
    },
  },
}

return M
