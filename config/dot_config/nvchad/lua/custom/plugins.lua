local plugins = {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "html",
        "css",
        "javascript",
        "typescript",
        "tsx",
        "json",
        "vue",
        "svelte",
        "c",
        "rust",
        "ruby",
      },
    },
  },

  {
    "neovim/nvim-lspconfig",

     dependencies = {
       "jose-elias-alvarez/null-ls.nvim",
       config = function()
         require "custom.configs.null-ls"
       end,
     },

     config = function()
        require "plugins.configs.lspconfig"
        require "custom.configs.lspconfig"
     end,
  },

  -- Manage Language Servers
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server",
        "luacheck",
        "luaformatter",
        "html-lsp",
        "prettier",
        "stylua",
        "typescript-language-server",
        "biome",
        "rust-analyzer",
        "astro-language-server",
        "autotools-language-server",
        "bash-language-server",
        "black",
        "chrome-debug-adapter",
        "clang-format",
        "clojure-lsp",
        "codelldb",
        "commitlint",
        "cpplint",
        "css-lsp",
        "cssmodules-language-server",
        "delve",
        "docker-compose-language-service",
        "dockerfile-language-server",
        "editorconfig-checker",
        "elixir-ls",
        "emmet-ls",
        "eslint_d",
        "prettierd",
        "flake8",
        "gh",
        "goimports",
        "gopls",
        "htmx-lsp",
        "isort",
        "jq",
        "json-lsp",
        "kotlin-language-server",
        "llm-ls",
        "markdownlint",
        "mdx-analyzer",
        "nil",
        "pest-language-server",
        "pyright",
        "python-lsp-server",
        "ruby-lsp",
        "shellcheck",
        "svelte-language-server",
        "tailwindcss-language-server",
        "unocss-language-server",
        "vue-language-server",
        "yaml-language-server",
        "htmx-lsp",
      },
    },
  },

  -- Change surrounding pairs.
  {
    "tpope/vim-surround",
    keys = { "c", "d", "y" }
  },

  -- Repeat mapped commands.
  {
    "tpope/vim-repeat",
    keys = { "." },
  },

  -- GitHub Copilot.
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",

    config = function()
      require("copilot").setup({
        suggestion = {
          auto_trigger = true,
          keymap = {
            accept = "<Right>"
          }
        }
      })
    end
  },

  -- Pretty LSP diagnostics view.
  {
    "folke/trouble.nvim",
    cmd = "TroubleToggle",
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },

  -- Fast navigation.
  -- Alternative to Leap, Sneak and EasyMotion.
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {},

    keys = {
      {
        "s",
        mode = { "n", "x", "o" },
        function() require("flash").jump() end,
        desc = "Flash"
      },

      {
        "S",
        mode = { "n", "x", "o" },
        function() require("flash").treesitter() end,
        desc = "Flash Treesitter"
      },

      {
        "r",
        mode = "o",
        function() require("flash").remote() end,
        desc = "Remote Flash"
      },

      {
        "R",
        mode = { "o", "x" },
        function() require("flash").treesitter_search() end,
        desc = "Treesitter Search"
      },

      {
        "<c-s>",
        mode = { "c" },
        function() require("flash").toggle() end,
        desc = "Toggle Flash Search"
      },
    },
  },

  -- Git Integration
  {
    "tpope/vim-fugitive",
    ft = { "fugitive" },

    cmd = {
      "G",
      "Git",
      "Gdiffsplit",
      "Gread",
      "Gwrite",
      "Ggrep",
      "GMove",
      "GDelete",
      "GBrowse",
      "GRemove",
      "GRename",
      "Glgrep",
      "Gedit",
    },
  },

  -- Tmux integration
  {
    "aserowy/tmux.nvim",

    config = function()
      local tmux = require("tmux")

      tmux.setup()
    end
  },

  -- Telescope Project integration
  {
    "nvim-telescope/telescope-project.nvim",

    config = function()
      local telescope = require("telescope")

      telescope.load_extension("project")
    end,
  },

  -- Vim Move
  {
    "matze/vim-move",
  },

  -- Multi Cursor
  {
    "mg979/vim-visual-multi",
  },

  -- Expand Region
  {
    "terryma/vim-expand-region",
  }
}

return plugins
