local formatters = require "lvim.lsp.null-ls.formatters"

formatters.setup {
  { exe = "black", filetypes = { "python" } },
  { exe = "isort", filetypes = { "python" } },
}

