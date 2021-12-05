local linters = require "lvim.lsp.null-ls.linters"

linters.setup {
  {
    exe = "shellcheck",
    filetypes = {"sh"},

    ---@usage arguments to pass to the formatter
    -- these cannot contain whitespaces.
    args = { "--severity", "warning" },
  },
}

