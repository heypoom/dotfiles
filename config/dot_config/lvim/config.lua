-- Vim configuration
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.relativenumber = true

-- LunarVim configuration
lvim.log.level = "info"
lvim.format_on_save = true
lvim.use_icons = true
lvim.leader = "space"
lvim.colorscheme = "catppuccin"
lvim.builtin.alpha.active = false
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false

-- Keymappings <https://www.lunarvim.org/docs/configuration/keybindings>
-- lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"

-- Use which-key to add extra bindings with the leader-key prefix
-- lvim.builtin.which_key.mappings["W"] = { "<cmd>noautocmd w<cr>", "Save without formatting" }

-- LSP keymappings
lvim.lsp.buffer_mappings.normal_mode['gd'] = {
  vim.lsp.buf.definition,
  "Show documentation"
}

lvim.lsp.buffer_mappings.normal_mode['K'] = {
  vim.lsp.buf.hover,
  "Show hover"
}

lvim.lsp.buffer_mappings.normal_mode['<leader>vws'] = {
  vim.lsp.buf.workspace_symbol,
  "View workspace symbol"
}

lvim.lsp.buffer_mappings.normal_mode['<leader>vd'] = {
  vim.diagnostic.open_float,
  "View diagnostics"
}

lvim.lsp.buffer_mappings.normal_mode['[d'] = {
  vim.diagnostic.goto_next,
  "Go to next diagnostics"
}

lvim.lsp.buffer_mappings.normal_mode[']d'] = {
  vim.diagnostic.goto_prev,
  "Go to previous diagnostics"
}

lvim.lsp.buffer_mappings.normal_mode['<leader>vca'] = {
  vim.lsp.buf.code_action,
  "View code action"
}

lvim.lsp.buffer_mappings.normal_mode['<leader>vrr'] = {
  vim.lsp.buf.references,
  "View references"
}

lvim.lsp.buffer_mappings.normal_mode['<leader>vrn'] = {
  vim.lsp.buf.rename,
  "Rename symbol"
}

lvim.lsp.buffer_mappings.insert_mode['<C-h>'] = {
  vim.lsp.buf.signature_help,
  "Signature help"
}

-- Automatically install tresitter plugins and language servers.
lvim.builtin.treesitter.auto_install = true
lvim.lsp.installer.setup.automatic_installation = true

-- Additional Plugins
lvim.plugins = {
  -- Fast navigation. Alternative to Hop, Sneak and EasyMotion.
  {
    "ggandor/lightspeed.nvim",
    event = "BufRead",
    keys = { "s", "S" }
  },

  -- Catppuccin color scheme.
  {
    "catppuccin/nvim",
    name = "catppuccin"
  },

  -- Change surrounding pairs.
  {
    "tpope/vim-surround",
    keys = { "c", "d", "y" }
  },

  -- Repeat mapped commands.
  {
    "tpope/vim-repeat",
    keys = { "." }
  },

  -- Interactive, live-evaluated scratchpad.
  {
    "metakirby5/codi.vim",
    cmd = "Codi"
  },

  -- Pretty diagnostics view.
  {
    "folke/trouble.nvim",
    cmd = "TroubleToggle",
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },

  -- GitHub Copilot.
  {
    "github/copilot.vim",
    name = "copilot",
    lazy = false
  },

  -- ThePrimeagen's Vim Be Good game.
  {
    "ThePrimeagen/vim-be-good",
    cmd = "VimBeGood"
  },

  -- Undo Tree
  {
    "mbbill/undotree",
    cmd = "UndotreeToggle"
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

  -- Move lines and selections.
  -- { "matze/vim-move",               event = "CursorMoved" },

  -- Clojure
  -- { "Olical/conjure",               ft = { "clojure", "julia", "lua", "rust", "python" } },

  -- Diff View.
  -- { "sindrets/diffview.nvim",       cmd = { "DiffviewOpen" } },

  -- Measures the startup time.
  -- { "tweekmonster/startuptime.vim", enabled = false },
  -- {"dstein64/vim-startuptime", disable = true},

  -- {
  --   "aserowy/tmux.nvim",
  --   config = function()
  --     return require("tmux").setup()
  --   end
  -- },

  -- Zen mode for writing.
  -- {
  --   "folke/zen-mode.nvim",
  --   cmd = { "ZenMode" },

  --   config = function()
  --     require("zen-mode").setup({
  --       window = {
  --         backdrop = 0.95,
  --         width = 0.60,

  --         options = {
  --           signcolumn = "no",      -- disable signcolumn
  --           number = false,         -- disable number column
  --           relativenumber = false, -- disable relative numbers
  --           cursorline = false,     -- disable cursorline
  --           cursorcolumn = false,   -- disable cursor column
  --           foldcolumn = "0",       -- disable fold column
  --           list = false,           -- disable whitespace characters
  --         },
  --       },

  --       plugins = {
  --         kitty = { enabled = false },
  --         gitsigns = { enabled = false },
  --         tmux = { enabled = false },
  --         twilight = { enabled = false },
  --       },
  --     })
  --   end,
  -- },

  -- Prisma syntax highlighting (not tree-sitter)
  -- { "pantharshit00/vim-prisma",      ft = { "prisma" } },

  -- Matchup (navigate to matching text, e.g. if-elseif-else-end)
  -- {
  --   "andymass/vim-matchup",
  --   event = "CursorMoved",

  --   config = function()
  --     vim.g.matchup_matchparen_offscreen = { method = "popup" }
  --   end,
  -- },

  -- Minimap.
  -- {
  --   "wfxr/minimap.vim",
  --   build = "cargo install --locked code-minimap",
  --   cmd = { "Minimap", "MinimapClose", "MinimapToggle", "MinimapRefresh", "MinimapUpdateHighlight" },

  --   config = function()
  --     vim.cmd("let g:minimap_width = 10")
  --     vim.cmd("let g:minimap_auto_start = 1")
  --     vim.cmd("let g:minimap_auto_start_win_enter = 1")
  --   end,
  -- },

  -- Peek at Line
  -- {
  --   "nacro90/numb.nvim",
  --   event = "BufRead",

  --   config = function()
  --     require("numb").setup({
  --       show_numbers = true,    -- Enable 'number' for the window while peeking
  --       show_cursorline = true, -- Enable 'cursorline' for the window while peeking
  --     })
  --   end,
  -- },

  -- Improved quick-fix window.
  -- {
  --   "kevinhwang91/nvim-bqf",
  --   -- event = { "BufRead", "BufNew" },
  --   ft = { "qf" },

  --   config = function()
  --     require("bqf").setup({
  --       auto_enable = true,
  --       preview = {
  --         win_height = 12,
  --         win_vheight = 12,
  --         delay_syntax = 80,
  --         border_chars = { "┃", "┃", "━", "━", "┏", "┓", "┗", "┛", "█" },
  --       },
  --       func_map = {
  --         vsplit = "",
  --         ptogglemode = "z,",
  --         stoggleup = "",
  --       },
  --       filter = {
  --         fzf = {
  --           action_for = { ["ctrl-s"] = "split" },
  --           extra_opts = { "--bind", "ctrl-o:toggle-all", "--prompt", "> " },
  --         },
  --       },
  --     })
  --   end,
  -- },

  -- Ranger Integration
  -- {
  --   "kevinhwang91/rnvimr",
  --   cmd = "RnvimrToggle",

  --   config = function()
  --     vim.g.rnvimr_draw_border = 1
  --     vim.g.rnvimr_pick_enable = 1
  --     vim.g.rnvimr_bw_enable = 1
  --   end,
  -- },

  -- Snap Finder
  -- {
  --   "camspiers/snap",
  --   rocks = "fzy",
  --   cmd = "Snap",

  --   config = function()
  --     local snap = require("snap")
  --     local layout = snap.get("layout").bottom
  --     local file = snap.config.file:with({ consumer = "fzy", layout = layout })
  --     local vimgrep = snap.config.vimgrep:with({ layout = layout })

  --     snap.register.command("find_files", file({ producer = "ripgrep.file" }))
  --     snap.register.command("buffers", file({ producer = "vim.buffer" }))
  --     snap.register.command("oldfiles", file({ producer = "vim.oldfile" }))
  --     snap.register.command("live_grep", vimgrep({}))
  --   end,
  -- },

  -- Git Blame
  -- {
  --   "f-person/git-blame.nvim",
  --   cmd = { "GitBlameEnable", "GitBlameToggle" },

  --   config = function()
  --     vim.cmd("highlight default link gitblame SpecialComment")
  --     vim.g.gitblame_enabled = 0
  --   end,
  -- },

  -- Telescope Project Manager
  -- {
  --   "nvim-telescope/telescope-project.nvim",
  --   event = "BufWinEnter",

  --   config = function()
  --     require("telescope").load_extension("project")
  --   end,
  -- },

  -- Colorizer
  -- {
  --   "norcalli/nvim-colorizer.lua",
  --   event = "BufRead",

  --   config = function()
  --     require("colorizer").setup({ "*" }, {
  --       RGB = true,      -- #RGB hex codes
  --       RRGGBB = true,   -- #RRGGBB hex codes
  --       RRGGBBAA = true, -- #RRGGBBAA hex codes
  --       rgb_fn = true,   -- CSS rgb() and rgba() functions
  --       hsl_fn = true,   -- CSS hsl() and hsla() functions
  --       css = true,      -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
  --       css_fn = true,   -- Enable all CSS *functions*: rgb_fn, hsl_fn
  --     })
  --   end,
  -- },

  -- Go to Definition/Implementation Preview Window
  -- {
  --   "rmagatti/goto-preview",

  --   config = function()
  --     require("goto-preview").setup({
  --       width = 70,               -- Width of the floating window
  --       height = 10,              -- Height of the floating window
  --       default_mappings = false, -- Bind default mappings
  --       debug = false,            -- Print debug information
  --       opacity = nil,            -- 0-100 opacity level of the floating window where 100 is fully transparent.
  --       post_open_hook = nil,     -- A function taking two arguments, a buffer and a window to be ran as a hook.
  --     })

  --     vim.cmd("nnoremap gP <cmd>lua require('goto-preview').close_all_win()<CR>")
  --     vim.cmd("nnoremap gpd <cmd>lua require('goto-preview').goto_preview_definition()<CR>")
  --     vim.cmd("nnoremap gpi <cmd>lua require('goto-preview').goto_preview_implementation()<CR>")
  --     vim.cmd("nnoremap gpr <cmd>lua require('goto-preview').goto_preview_references()<CR>")
  --   end,
  -- },

  -- Symbols Outline
  -- { "simrat39/symbols-outline.nvim", cmd = "SymbolsOutline" },
}
