local M = {}

M.general = {
  n = {
    ["<Esc>"] = {
      function()
        vim.cmd.noh()
      end,
      "Clear Highlights",
    },
  },
}

M.spectre = {
  n = {
    ["<leader>st"] = {
      function()
        require("spectre").toggle()
      end,
      "Toggle Spectre",
    },
    ["<leader>sw"] = {
      function()
        require("spectre").open_visual { select_word = true }
      end,
      "Search Current Word",
    },
    ["<leader>sp"] = {
      function()
        require("spectre").open_file_search { select_word = true }
      end,
      "Search Current File",
    },
  },

  v = {
    ["<leader>sw"] = {
      function()
        require("spectre").open_visual()
      end,
      "Search Current Word",
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

M.lspconfig = {
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
