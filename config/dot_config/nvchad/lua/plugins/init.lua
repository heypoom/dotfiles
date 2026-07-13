return {
  {
    "stevearc/conform.nvim",
    opts = require "configs.conform",
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "MeanderingProgrammer/render-markdown.nvim",
    lazy = false,
    opts = {
      checkbox = {
        unchecked = {
            icon = '󰄱',
            highlight = 'RenderMarkdownUnchecked',
        },
        checked = {
            icon = '󰄵',
            highlight = 'RenderMarkdownChecked',
        },
        custom = {
          in_progress = {
            raw = "[.]",
            rendered = "󰄗",
            highlight = "RenderMarkdownWarn"
          },
        },
      },
    },
  },

  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {
      labels = "asdfghjklqwertyuiopzxcvbnm",
      search = {
        multi_window = true,
        mode = "exact",
        wrap = true,
      },
      jump = {
        autojump = false,
        jumplist = true,
      },
      modes = {
        search = {
          enabled = true,
        },
        char = {
          enabled = true,
          jump_labels = false,
        },
      },
    },
    keys = {
      { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
      { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
      { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
      { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
      { "<C-s>", mode = "c", function() require("flash").toggle() end, desc = "Toggle Flash Search" },
    },
  },

  {
    "epilande/checkbox-cycle.nvim",
    ft = "markdown",
    opts = {
      states = { "[ ]", "[.]", "[x]" },
    },
  },
}
