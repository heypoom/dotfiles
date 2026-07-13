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
    init = function()
      -- nvim-treesitter's markdown injection directive crashes on Neovim 0.12.4
      -- for some fenced blocks. Use Neovim's simpler runtime query instead.
      vim.treesitter.query.set(
        "markdown",
        "injections",
        [[
          (fenced_code_block
            (info_string
              (language) @injection.language)
            (code_fence_content) @injection.content)

          ((html_block) @injection.content
            (#set! injection.language "html")
            (#set! injection.combined)
            (#set! injection.include-children))

          ((minus_metadata) @injection.content
            (#set! injection.language "yaml")
            (#offset! @injection.content 1 0 -1 0)
            (#set! injection.include-children))

          ((plus_metadata) @injection.content
            (#set! injection.language "toml")
            (#offset! @injection.content 1 0 -1 0)
            (#set! injection.include-children))

          ([
            (inline)
            (pipe_table_cell)
          ] @injection.content
            (#set! injection.language "markdown_inline"))
        ]]
      )
    end,
    opts = {
      checkbox = {
        unchecked = {
          icon = "󰄱",
          highlight = "RenderMarkdownUnchecked",
        },
        checked = {
          icon = "󰄵",
          highlight = "RenderMarkdownChecked",
        },
        custom = {
          in_progress = {
            raw = "[.]",
            rendered = "󰄗",
            highlight = "RenderMarkdownWarn",
          },
        },
      },
    },
  },

  {
    "stevearc/oil.nvim",
    lazy = false,
    keys = {
      { "-", "<cmd>Oil<cr>", desc = "Open parent directory" },
      { "<leader>o", "<cmd>Oil --float<cr>", desc = "Open Oil float" },
    },
    opts = {
      default_file_explorer = true,
      columns = {
        "icon",
      },
      view_options = {
        show_hidden = true,
      },
      keymaps = {
        ["n"] = {
          callback = function()
            vim.cmd "normal! o"
            vim.cmd "startinsert"
          end,
          desc = "Create new entry",
          mode = "n",
        },
      },
    },
  },

  {
    "mikavilpas/yazi.nvim",
    version = "*",
    event = "VeryLazy",
    dependencies = {
      { "nvim-lua/plenary.nvim", lazy = true },
    },
    keys = {
      {
        "<leader>y",
        mode = { "n", "v" },
        "<cmd>Yazi<cr>",
        desc = "Open yazi at current file",
      },
      {
        "<leader>Y",
        "<cmd>Yazi cwd<cr>",
        desc = "Open yazi at cwd",
      },
      {
        "<C-Up>",
        "<cmd>Yazi toggle<cr>",
        desc = "Resume yazi session",
      },
    },
    opts = {
      open_for_directories = false,
      keymaps = {
        show_help = "<f1>",
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
