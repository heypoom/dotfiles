-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.ui = {
	theme = "catppuccin",
	transparency = true,

	statusline = {
		theme = "vscode",
		separator_style = "default",
		overriden_modules = nil,
	},

	tabufline = {
		lazyload = true,
		overriden_modules = function(modules)
			table.remove(modules, 4)
		end,
	},

	-- refer to [nvchad.com/docs/config/theming]
	hl_override = {},
	changed_themes = {},
	extended_integrations = { "trouble", "alpha", "dap" },
}

-- M.base46 = {
-- 	theme = "onedark",

-- 	-- hl_override = {
-- 	-- 	Comment = { italic = true },
-- 	-- 	["@comment"] = { italic = true },
-- 	-- },
-- }

-- M.nvdash = { load_on_startup = true }
-- M.ui = {
--       tabufline = {
--          lazyload = false
--      }
--}

return M
