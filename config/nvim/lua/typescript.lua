local nvim_lsp = require("lspconfig")

nvim_lsp.tsserver.setup {
	on_attach = function(client, bufnr)
		local ts_utils = require("nvim-lsp-ts-utils")

		ts_utils.setup {}
		ts_utils.setup_client(client)
	end
}

