-- Setup nvim-cmp.
local cmp = require'cmp'

cmp.setup({
	completion = {
    completeopt = 'menu,menuone,noinsert',
		autocomplete = true
	},

	snippet = {
		expand = function(args)
			-- For `vsnip` user.
			-- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` user.

			-- For `luasnip` user.
			-- require('luasnip').lsp_expand(args.body)

			-- For `ultisnips` user.
			-- vim.fn["UltiSnips#Anon"](args.body)
		end,
	},

	mapping = {
		-- ['<C-d>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.close(),
		["<C-d>"] = cmp.mapping(function(fallback)
			if not require("cmp").confirm({select = true, behavior = cmp.ConfirmBehavior.Replace}) then
				fallback()
			end
		end),
	},

	sources = {
		{ name = 'nvim_lsp' },
		{ name = 'buffer' },
	}
})

local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = vim.fn.col('.') - 1
    if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
        return true
    else
        return false
    end
end

_G.tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-n>"
  elseif check_back_space() then
    return t "<Tab>"
  else
    return cmp.mapping.complete()
  end
end

_G.on_enter = function()
	cmp.mapping.confirm({select = true, behavior = cmp.ConfirmBehavior.Replace})
	cmp.mapping.close()
end

vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
-- vim.api.nvim_set_keymap("i", "<CR>", "v:lua.on_enter()", {expr = true})

