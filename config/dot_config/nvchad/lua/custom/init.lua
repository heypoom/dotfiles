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

-- Lua snippets
vim.g.vscode_snippets_path = vim.fn.expand("$HOME/.local/share/chezmoi/config/vscode/snippets")
vim.g.snipmate_snippets_path = vim.fn.stdpath "config" .. "/lua/custom/snippets"
vim.g.lua_snippets_path = vim.fn.stdpath "config" .. "/lua/custom/lua-snippets"

-- Neovide
if vim.g.neovide then
  vim.o.guifont = "Zed Mono Extended:h18"
  vim.opt.linespace = 0
  vim.g.neovide_scale_factor = 1.0
  vim.g.neovide_padding_top = 0
  vim.g.neovide_padding_bottom = 0
  vim.g.neovide_padding_right = 0
  vim.g.neovide_padding_left = 0
  vim.g.neovide_floating_blur_amount_x = 2.0
  vim.g.neovide_floating_blur_amount_y = 2.0
  vim.g.neovide_scroll_animation_length = 0.3
  vim.g.neovide_cursor_vfx_mode = ""
  vim.g.neovide_cursor_vfx_opacity = 200.0
  vim.g.neovide_hide_mouse_when_typing = false
  vim.g.neovide_theme = 'auto'
  vim.g.neovide_unlink_border_highlights = true

  local alpha = function()
    return string.format("%x", math.floor(255 * (vim.g.transparency or 0.8)))
  end

  -- g:neovide_transparency should be 0 if you want to unify transparency of content and title bar.
  vim.g.neovide_transparency = 0.0
  vim.g.transparency = 0.8
  vim.g.neovide_background_color = "#0f1117" .. alpha()
end

