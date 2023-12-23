---@type ChadrcConfig
local M = {}

M.ui = {
  theme = 'catppuccin',
  transparency = true,

  statusline = {
    theme = 'default',
    separator_style = 'default',
    overriden_modules = nil
  },

  tabufline = {
    lazyload = true,
    overriden_modules = nil
  }
}

M.plugins = "custom.plugins"
M.mappings = require "custom.mappings"

return M
