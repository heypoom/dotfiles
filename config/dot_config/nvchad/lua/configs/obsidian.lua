local obsidian = require "obsidian"

obsidian.setup {
  workspaces = {
    {
      name = "Notes",
      path = "~/Notes",
    },
  },

  daily_notes = {
    folder = "Journal",
    date_format = "%Y-%m-%d",
    alias_format = nil,
    template = nil,
  },

  disable_frontmatter = true,

  mappings = {
    ["gf"] = {
      action = function()
        return obsidian.util.gf_passthrough()
      end,
      opts = { noremap = false, expr = true, buffer = true },
    },
    ["<leader>ch"] = {
      action = function()
        return obsidian.util.toggle_checkbox()
      end,
      opts = { buffer = true },
    },
  },

  backlinks = {
    height = 10,
    wrap = true,
  },

  finder = "telescope.nvim",
  sort_by = "modified",
  sort_reversed = true,
  open_notes_in = "current",

  ui = {
    enable = true,
    update_debounce = 200,
    checkboxes = {
      [" "] = { char = "󰄱", hl_group = "ObsidianTodo" },
      ["x"] = { char = "", hl_group = "ObsidianDone" },
      [">"] = { char = "", hl_group = "ObsidianRightArrow" },
      ["~"] = { char = "󰰱", hl_group = "ObsidianTilde" },
    },
    external_link_icon = { char = "", hl_group = "ObsidianExtLinkIcon" },
    reference_text = { hl_group = "ObsidianRefText" },
    highlight_text = { hl_group = "ObsidianHighlightText" },
    tags = { hl_group = "ObsidianTag" },
    hl_groups = {
      ObsidianTodo = { bold = true, fg = "#f78c6c" },
      ObsidianDone = { bold = true, fg = "#89ddff" },
      ObsidianRightArrow = { bold = true, fg = "#f78c6c" },
      ObsidianTilde = { bold = true, fg = "#ff5370" },
      ObsidianRefText = { underline = true, fg = "#c792ea" },
      ObsidianExtLinkIcon = { fg = "#c792ea" },
      ObsidianTag = { italic = true, fg = "#89ddff" },
      ObsidianHighlightText = { bg = "#89ddff" },
    },
  },

  attachments = {
    img_folder = "Resources/Assets", -- This is the default
  },

  yaml_parser = "native",
}
