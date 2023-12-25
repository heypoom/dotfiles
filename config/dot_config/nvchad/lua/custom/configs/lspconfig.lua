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
  "eslint",
  "gopls",
  "jsonls",
  "kotlin_language_server",
  "pyright",
  "unocss",
  "svelte",
  "nil_ls",
  "mdx_analyzer",
  "autotools_ls",
  "htmx",
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

lspconfig.emmet_language_server.setup {
  filetypes = {
    "css",
    "eruby",
    "html",
    "javascriptreact",
    "less",
    "sass",
    "scss",
    "pug",
    "typescriptreact",
    "vue",
    "svelte"
  },

  init_options = {
    excludeLanguages = {},
    extensionsPath = {},
    preferences = {},
    showAbbreviationSuggestions = true,
    showExpandedAbbreviation = "always",
    showSuggestionsAsSnippets = false,
    syntaxProfiles = {},
    variables = {},
  },
}

lspconfig.tailwindcss.setup {
  settings = {
    tailwindCSS = {
      validate = true,
      classAttributes = {
        "class",
        "className",
        "class:list",
        "classList",
        "ngClass",
      },
      lint = {
        cssConflict = "warning",
        invalidApply = "error",
        invalidConfigPath = "error",
        invalidScreen = "error",
        invalidTailwindDirective = "error",
        invalidVariant = "error",
        recommendedVariantOrder = "warning",
      },
    },
  },
}

lspconfig.lua_ls.setup {
  plugins = {
    plugins = {
      lua_ls = {
        enabled = true,
      },
    },
  },
}

