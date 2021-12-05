--[[
lvim is the global options object

Linters should be
filled in as strings with either
a global executable or a path to
an executable
]]

-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT

-- general
lvim.log.level = "warn"
lvim.format_on_save = true
lvim.colorscheme = "dracula"
lvim.transparent_window = true

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"

-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
-- unmap a default keymapping
-- lvim.keys.normal_mode["<C-Up>"] = ""
-- edit a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>"

-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- we use protected-mode (pcall) just in case the plugin wasn't loaded yet.
-- local _, actions = pcall(require, "telescope.actions")
-- lvim.builtin.telescope.defaults.mappings = {
--   -- for input mode
--   i = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--     ["<C-n>"] = actions.cycle_history_next,
--     ["<C-p>"] = actions.cycle_history_prev,
--   },
--   -- for normal mode
--   n = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--   },
-- }

-- Use which-key to add extra bindings with the leader-key prefix

lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }

lvim.builtin.which_key.mappings["t"] = {
  name = "Diagnostics",

  t = { "<cmd>TroubleToggle<cr>", "Trouble" },
  r = { "<cmd>TroubleToggle lsp_references<cr>", "References" },
  f = { "<cmd>TroubleToggle lsp_definitions<cr>", "Definitions" },
  d = { "<cmd>TroubleToggle lsp_document_diagnostics<cr>", "Document" },
  q = { "<cmd>TroubleToggle quickfix<cr>", "Quick Fix" },
  l = { "<cmd>TroubleToggle loclist<cr>", "Location List" },
  w = { "<cmd>TroubleToggle lsp_workspace_diagnostics<cr>", "Workspace" },
}

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.dashboard.active = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.show_icons.git = 0

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "javascript",
  "json",
  "lua",
  "python",
  "typescript",
  "css",
  "rust",
  "java",
  "yaml",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true

-- generic LSP settings

-- ---@usage disable automatic installation of servers
-- lvim.lsp.automatic_servers_installation = false

-- ---@usage Select which servers should be configured manually. Requires `:LvimCacheRest` to take effect.
-- See the full default list `:lua print(vim.inspect(lvim.lsp.override))`
-- vim.list_extend(lvim.lsp.override, { "pyright" })

-- ---@usage setup a server -- see: https://www.lunarvim.org/languages/#overriding-the-default-configuration
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pylsp", opts)

-- you can set a custom on_attach function that will be used for all the language servers
-- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end
-- you can overwrite the null_ls setup table (useful for setting the root_dir function)
-- lvim.lsp.null_ls.setup = {
--   root_dir = require("lspconfig").util.root_pattern("Makefile", ".git", "node_modules"),
-- }
-- or if you need something more advanced
-- lvim.lsp.null_ls.setup.root_dir = function(fname)
--   if vim.bo.filetype == "javascript" then
--     return require("lspconfig/util").root_pattern("Makefile", ".git", "node_modules")(fname)
--       or require("lspconfig/util").path.dirname(fname)
--   elseif vim.bo.filetype == "php" then
--     return require("lspconfig/util").root_pattern("Makefile", ".git", "composer.json")(fname) or vim.fn.getcwd()
--   else
--     return require("lspconfig/util").root_pattern("Makefile", ".git")(fname) or require("lspconfig/util").path.dirname(fname)
--   end
-- end

-- -- set a formatter, this will override the language server formatting capabilities (if it exists)
-- local formatters = require "lvim.lsp.null-ls.formatters"
-- formatters.setup {
--   { exe = "black", filetypes = { "python" } },
--   { exe = "isort", filetypes = { "python" } },
--   {
--     exe = "prettier",
--     ---@usage arguments to pass to the formatter
--     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
--     args = { "--print-with", "100" },
--     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
--     filetypes = { "typescript", "typescriptreact" },
--   },
-- }

-- -- set additional linters
-- local linters = require "lvim.lsp.null-ls.linters"
-- linters.setup {
--   { exe = "flake8", filetypes = { "python" } },
--   {
--     exe = "shellcheck",
--     ---@usage arguments to pass to the formatter
--     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
--     args = { "--severity", "warning" },
--   },
--   {
--     exe = "codespell",
--     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
--     filetypes = { "javascript", "python" },
--   },
-- }

-- Additional Plugins
lvim.plugins = {
  {"dracula/vim"},
  {"pantharshit00/vim-prisma", ft = {"prisma"}},
  {"metakirby5/codi.vim", cmd = "Codi"},
  {"tpope/vim-surround", keys = {"c", "d", "y"}},
  {"p00f/nvim-ts-rainbow"},
  {"sindrets/diffview.nvim", event = "BufRead"},

  -- Alternative: Hop, Sneak, EasyMotion
  {"ggandor/lightspeed.nvim", event = "BufRead", keys = {"s"}},

  -- Minimap
  {
    'wfxr/minimap.vim',
    run = "cargo install --locked code-minimap",
    cmd = {"Minimap", "MinimapClose", "MinimapToggle", "MinimapRefresh", "MinimapUpdateHighlight"},

    config = function ()
      vim.cmd ("let g:minimap_width = 10")
      vim.cmd ("let g:minimap_auto_start = 1")
      vim.cmd ("let g:minimap_auto_start_win_enter = 1")
    end,
  },

  -- Peek at Line
  {
    "nacro90/numb.nvim",
    event = "BufRead",

    config = function()
      require("numb").setup {
        show_numbers = true, -- Enable 'number' for the window while peeking
        show_cursorline = true, -- Enable 'cursorline' for the window while peeking
      }
    end,
  },

  -- Quickfix Window
  {
    "kevinhwang91/nvim-bqf",
    event = { "BufRead", "BufNew" },
    ft = "qf",

    config = function()
      require("bqf").setup({
        auto_enable = true,
        preview = {
          win_height = 12,
          win_vheight = 12,
          delay_syntax = 80,
          border_chars = { "┃", "┃", "━", "━", "┏", "┓", "┗", "┛", "█" },
        },
        func_map = {
          vsplit = "",
          ptogglemode = "z,",
          stoggleup = "",
        },
        filter = {
          fzf = {
            action_for = { ["ctrl-s"] = "split" },
            extra_opts = { "--bind", "ctrl-o:toggle-all", "--prompt", "> " },
          },
        },
      })
    end,
  },

  -- Ranger Integration
  {
    "kevinhwang91/rnvimr",
    cmd = "RnvimrToggle",

    config = function()
      vim.g.rnvimr_draw_border = 1
      vim.g.rnvimr_pick_enable = 1
      vim.g.rnvimr_bw_enable = 1
    end,
  },

  -- Snap Finder
  {
    "camspiers/snap",
    rocks = "fzy",
    cmd = "Snap",

    config = function()
      local snap = require "snap"
      local layout = snap.get("layout").bottom
      local file = snap.config.file:with { consumer = "fzy", layout = layout }
      local vimgrep = snap.config.vimgrep:with { layout = layout }

      snap.register.command("find_files", file { producer = "ripgrep.file" })
      snap.register.command("buffers", file { producer = "vim.buffer" })
      snap.register.command("oldfiles", file { producer = "vim.oldfile" })
      snap.register.command("live_grep", vimgrep {})
    end,
  },

  -- Matchup (navigate to matching text, e.g. if-elseif-else-end)
  {
    "andymass/vim-matchup",
    event = "CursorMoved",

    config = function()
      vim.g.matchup_matchparen_offscreen = { method = "popup" }
    end,
  },

  -- Git Blame
  {
    "f-person/git-blame.nvim",
    cmd = {"GitBlameEnable", "GitBlameToggle"},

    config = function()
      vim.cmd "highlight default link gitblame SpecialComment"
      vim.g.gitblame_enabled = 0
    end,
  },

  -- Git Wrapper
  {
    "tpope/vim-fugitive",
    ft = {"fugitive"},

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
      "Gedit"
    },
  },

  -- Telescope Project Manager
  {
    "nvim-telescope/telescope-project.nvim",
    event = "BufWinEnter",

    setup = function()
      vim.cmd [[packadd telescope.nvim]]
    end,
  },

  -- Colorizer
  {
    "norcalli/nvim-colorizer.lua",

    config = function()
      require("colorizer").setup({ "*" }, {
        RGB = true, -- #RGB hex codes
        RRGGBB = true, -- #RRGGBB hex codes
        RRGGBBAA = true, -- #RRGGBBAA hex codes
        rgb_fn = true, -- CSS rgb() and rgba() functions
        hsl_fn = true, -- CSS hsl() and hsla() functions
        css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
        css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
      })
    end,
  },

  -- Go to Definition/Implementation Preview Window
  {
    "rmagatti/goto-preview",

    config = function()
      require('goto-preview').setup {
        width = 70; -- Width of the floating window
        height = 10; -- Height of the floating window
        default_mappings = false; -- Bind default mappings
        debug = false; -- Print debug information
        opacity = nil; -- 0-100 opacity level of the floating window where 100 is fully transparent.
        post_open_hook = nil -- A function taking two arguments, a buffer and a window to be ran as a hook.
      }

      vim.cmd("nnoremap gP <cmd>lua require('goto-preview').close_all_win()<CR>")
      vim.cmd("nnoremap gpd <cmd>lua require('goto-preview').goto_preview_definition()<CR>")
      vim.cmd("nnoremap gpi <cmd>lua require('goto-preview').goto_preview_implementation()<CR>")
      vim.cmd("nnoremap gpr <cmd>lua require('goto-preview').goto_preview_references()<CR>")
    end
  },

  -- LSP Signature
  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",

    config = function()
      require "lsp_signature".setup()
    end
  },

  -- Symbols Outline
  {
    "simrat39/symbols-outline.nvim",
    cmd = "SymbolsOutline",
  },

  -- Trouble Diagnostics
  {
    "folke/trouble.nvim",
    cmd = "TroubleToggle",
  },
}

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- lvim.autocommands.custom_groups = {
--   { "BufWinEnter", "*.lua", "setlocal ts=8 sw=8" },
-- }

