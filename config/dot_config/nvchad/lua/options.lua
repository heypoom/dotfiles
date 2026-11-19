require "nvchad.options"

-- add yours here!

-- Over SSH (the devbox), copy to the Mac's clipboard with OSC 52. Neovim only
-- picks OSC 52 by itself when $SSH_TTY is set, and herdr panes don't have it.
-- Paste reads Neovim's own register, because an OSC 52 read makes the terminal
-- prompt or hang; paste from the Mac with Cmd+V instead.
if vim.env.SSH_CONNECTION and vim.fn.has "mac" == 0 then
  local osc52 = require "vim.ui.clipboard.osc52"
  local function paste()
    return { vim.split(vim.fn.getreg "", "\n"), vim.fn.getregtype "" }
  end
  vim.g.clipboard = {
    name = "OSC 52",
    copy = { ["+"] = osc52.copy "+", ["*"] = osc52.copy "*" },
    paste = { ["+"] = paste, ["*"] = paste },
  }
end

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!
