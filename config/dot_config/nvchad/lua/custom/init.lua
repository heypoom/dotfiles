vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.relativenumber = true
vim.opt.backup = false
vim.opt.swapfile = false
vim.opt.termguicolors = true
vim.opt.updatetime = 50
vim.opt.timeoutlen = 500

vim.opt.incsearch = true
vim.opt.hlsearch = true

-- lua snippets
vim.g.lua_snippets_path = vim.fn.stdpath "config" .. "/lua/custom/snippets/lua"

