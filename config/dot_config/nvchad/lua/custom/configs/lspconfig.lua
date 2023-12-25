local configs = require "plugins.configs.lspconfig"
local lspconfig = require "lspconfig"

local on_attach = configs.on_attach
local capabilities = configs.capabilities

local servers = {
  "html",
  "cssls",
  "clangd",
  "tsserver",
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

lspconfig.rust_analyzer.setup {
  settings = {
    ["rust-analyzer"] = {},
  },
  on_attach = on_attach,
  capabilities = capabilities,
}

lspconfig.volar.setup{
  filetypes = {
    'typescript',
    'javascript',
    'javascriptreact',
    'typescriptreact',
    'vue',
    'json'
  }
}

