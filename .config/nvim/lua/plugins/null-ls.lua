return {
	"jose-elias-alvarez/null-ls.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"nvim-lua/plenary.nvim",
		"lukas-reineke/lsp-format.nvim",
	},
	opts = function()
		local null_ls = require("null-ls")
		return {
			debug = true,
			on_attach = require("lsp-format").on_attach,
			sources = {
				null_ls.builtins.formatting.black,
				null_ls.builtins.formatting.reorder_python_imports.with({
					cwd = function(params)
						return require("utils").get_python_root(params.bufname)
					end,
				}),
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.prettierd,
			},
		}
	end,
}
