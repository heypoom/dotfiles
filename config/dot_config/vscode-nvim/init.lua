-- ensure lazyvim is downloaded
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

-- set leader key to <space>
vim.g.mapleader = " "

-- setup lazy
require("lazy").setup({
  "folke/which-key.nvim",
  { "folke/neoconf.nvim", cmd = "Neoconf" },
  "folke/neodev.nvim",
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {},
    keys = {
      { "s",     mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash" },
      { "S",     mode = { "n", "x", "o" }, function() require("flash").treesitter() end,        desc = "Flash Treesitter" },
      { "r",     mode = "o",               function() require("flash").remote() end,            desc = "Remote Flash" },
      { "R",     mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
      { "<c-s>", mode = { "c" },           function() require("flash").toggle() end,            desc = "Toggle Flash Search" },
    }
  },
  {
    'vscode-neovim/vscode-multi-cursor.nvim',
    event = 'VeryLazy',
    cond = not not vim.g.vscode,
    config = function()
      -- setup vscode multi cursor
      local C = require('vscode-multi-cursor')

      C.setup {
        default_mappings = true,
        no_selection = false
      }

      -- vim.keymap.set({ "n", "x", "i" }, "<C-d>", function()
      --   C.addSelectionToNextFindMatch()
      -- end)

      vim.keymap.set('n', '<C-d>', 'mciw*<Cmd>nohl<CR>', { remap = true })
    end
  }
})

-- setup unnamed clipboard
-- https://github.com/vscode-neovim/vscode-neovim/issues/298
vim.opt.clipboard:append("unnamedplus")

if vim.g.vscode then
  --- vscode-only configuration
end
