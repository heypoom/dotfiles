---@type ChadrcConfig
local M = {}

M.ui = {
  theme = 'catppuccin',
  transparency = true,

  statusline = {
    theme = 'vscode',
    separator_style = 'default',
    overriden_modules = nil
  },

  tabufline = {
    lazyload = true,
    overriden_modules = function(modules)
     table.remove(modules, 4)
    end,
  }
}

M.plugins = "custom.plugins"
M.mappings = require "custom.mappings"

return M
