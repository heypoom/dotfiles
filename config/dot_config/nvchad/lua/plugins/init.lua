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
    opts = {
      checkbox = {
        custom = {
          in_progress = { raw = "[.]", rendered = "⊡ ", highlight = "RenderMarkdownWarn" },
        },
      },
    },
  },

  {
    "epilande/checkbox-cycle.nvim",
    ft = "markdown",
    opts = {
      states = { "[ ]", "[.]", "[x]" },
    },
    keys = {
      { "<CR>", "<cmd>CheckboxCycleNext<cr>", ft = "markdown", desc = "Cycle checkbox" },
      { "<S-CR>", "<cmd>CheckboxCyclePrev<cr>", ft = "markdown", desc = "Cycle checkbox (reverse)" },
    },
  },
}
