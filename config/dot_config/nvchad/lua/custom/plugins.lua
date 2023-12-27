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

  -- LSP Config
  {
    "neovim/nvim-lspconfig",

     dependencies = {
      -- NeoDev
      {
        "folke/neodev.nvim",
        config = function()
          require("neodev").setup {}
        end,
      },

      -- NeoConf
      {
        "folke/neoconf.nvim",
        opts = {},
      },

      -- Null Language Server
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
    },

    -- LSP Configurations
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
        "emmet-language-server",
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

  -- Mason LSP Config
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "williamboman/mason.nvim",
    },
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

    opts = {
      icons = true,
      mode = "workspace_diagnostics",
      cycle_results = true,
    }
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
    event = "VeryLazy",

    config = function()
      local tmux = require("tmux")

      tmux.setup({})
    end
  },

  -- Zellij Integration
  {
    "Lilja/zellij.nvim",
    event = "VeryLazy",

    config = function()
      local zellij = require("zellij")

      zellij.setup({
        vimTmuxNavigatorKeybinds = true,
      })
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
    event = "VeryLazy"
  },

  -- Expand Region
  {
    "terryma/vim-expand-region",
    event = "VeryLazy"
  },

  -- Oil
  {
    'stevearc/oil.nvim',
    opts = {
      default_file_explorer = false,
      columns = { "icon" }
    },
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },

  -- Treesitter Autotag
  {
    'windwp/nvim-ts-autotag',
    event = "InsertEnter",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("nvim-treesitter.configs").setup({
        autotag = {
          enable = true,
          enable_rename = true,
          enable_close = true,
          enable_close_on_slash = true,
        },
      })

      require("nvim-ts-autotag").setup({
        filetypes = {
          "html",
          "xml",
          "typescriptreact",
          "javascriptreact",
          "svelte",
          "vue",
          "tsx",
          "jsx",
          "astro",
          "markdown",
        },
      })
    end,
  },

  -- Surround
  {
      "kylechui/nvim-surround",
      version = "*", -- Use for stability; omit to use `main` branch for the latest features
      event = "VeryLazy",
      config = function()
        require("nvim-surround").setup({})
      end
  },

  -- Autopairs
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    opts = {}
  },

  -- Otter
  {
    'jmbuhr/otter.nvim',
    event = "VeryLazy",
  },

  -- Golang
  {
    "ray-x/go.nvim",
    dependencies = {
      "ray-x/guihua.lua",
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("go").setup()
    end,
    event = {"CmdlineEnter"},
    ft = {"go", 'gomod'},
    build = ':lua require("go.install").update_all_sync()' -- if you need to install/update all binaries
  },

  -- True Zen
  {
    "Pocco81/true-zen.nvim",
    event = {"VeryLazy"},
    opts = {
      integrations = {
        tmux = true,
        kitty = {
          enabled = true,
        },
      },
    },
  },

  -- Interactive scratchpad
  {
    "metakirby5/codi.vim",
    cmd = "Codi"
  },

  -- Diff View.
  {
    "sindrets/diffview.nvim",
    cmd = { "DiffviewOpen" }
  },

  -- Symbols Outline
  {
    "simrat39/symbols-outline.nvim",
    cmd = "SymbolsOutline",
  },

  -- Harpoon
  {
    "ThePrimeagen/harpoon",
    event = "VeryLazy",
    branch = "harpoon2",
    requires = {"nvim-lua/plenary.nvim"},
  },

  -- Visual Multi Cursor
  -- Use the CTRL+D shortcut to add cursors.
  {
    "mg979/vim-visual-multi",
    event = "VeryLazy",
    keys = {
      "<C-d>",
      "<M-C-Down>",
      "<M-C-Up>",
      "\\",
    },
    init = function()
      vim.g.VM_Leader = "\\"
      vim.g.VM_default_mappings = 0
      vim.g.VM_mouse_mappings = 1
      vim.g.VM_maps = {
        ["Find Under"] = "<C-d>",
        ["Find Subword Under"] = "<C-d>",
        ["Add Cursor Down"] = "<M-C-Down>",
        ["Add Cursor Up"] = "<M-C-Up>",
      }
    end
  },
}

return plugins
