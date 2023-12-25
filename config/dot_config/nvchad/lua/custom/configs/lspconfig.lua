local configs = require "plugins.configs.lspconfig"
local lspconfig = require "lspconfig"

local on_attach = configs.on_attach
local capabilities = configs.capabilities

local servers = {
  "html",
  "cssls",
  "clangd",
  "tsserver",
  "astro",
  "bashls",
  "clangd",
  "clojure_lsp",
  "cssls",
  "cssmodules_ls",
  "docker_compose_language_service",
  "dockerls",
  "elixirls",
  "emmet_language_server",
  "eslintd",
  "gopls",
  "jsonls",
  "kotlin_language_server",
  "pyright",
  "unocss",
  "svelte",
  "nil_ls",
  "lua_ls",
  "mdx_analyzer",
  "autotools_ls",
  -- "biome"
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

lspconfig.yamlls.setup {
  settings = {
    yaml = {
      schemas = {
        ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
      }
    }
  }
}

