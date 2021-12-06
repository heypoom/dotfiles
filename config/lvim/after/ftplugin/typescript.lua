local linters = require("lvim.lsp.null-ls.linters")
local formatters = require("lvim.lsp.null-ls.formatters")

linters.setup({
	{
		exe = "eslint_d",

		filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "vue" },
	},
})

formatters.setup({
	{
		exe = "prettierd",

		filetypes = {
			"javascript",
			"javascriptreact",
			"typescript",
			"typescriptreact",
			"vue",
			"css",
			"scss",
			"less",
			"html",
			"json",
			"yaml",
			"markdown",
			"graphql",
		},
	},
})
