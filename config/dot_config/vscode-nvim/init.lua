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

-- setup lazyvim
require("lazy").setup(plugins, opts)

-- setup unnamed clipboard
-- https://github.com/vscode-neovim/vscode-neovim/issues/298
vim.opt.clipboard:append("unnamedplus")

if vim.g.vscode then
  --- vscode-only configuration
end
