return {
	"jose-elias-alvarez/null-ls.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"lukas-reineke/lsp-format.nvim",
	},
	opts = function()
		local null_ls = require("null-ls")
		return {
			debug = true,
			on_attach = require("lsp-format").on_attach,
			sources = {
				-- null_ls.builtins.diagnostics.cspell,
				-- null_ls.builtins.code_actions.cspell,
				-- null_ls.builtins.completion.spell,
				-- null_ls.builtins.formatting.black.with({
				-- command = "pyenv",
				-- args = vim.list_extend({ "exec", "black" }, null_ls.builtins.formatting.black._opts.args),
				-- }),
				--[[ null_ls.builtins.diagnostics.ruff.with({
					command = "pyenv",
					args = vim.list_extend(
						-- disable unused import check - covered by pyright
						{ "exec", "ruff", "--ignore", "F401" },
						null_ls.builtins.diagnostics.ruff._opts.args
					),
				}), ]]
				--[[ null_ls.builtins.formatting.ruff.with({
					command = "pyenv",
					args = vim.list_extend({ "exec", "ruff" }, null_ls.builtins.formatting.ruff._opts.args),
				}), ]]
				null_ls.builtins.formatting.reorder_python_imports.with({
					-- command = "pyenv",
					cwd = function(params)
						return require("utils").get_python_root(params.bufname)
					end,
					--[[ args = vim.list_extend(
						{ "exec", "reorder-python-imports" },
						null_ls.builtins.formatting.reorder_python_imports._opts.args
					), ]]
				}),
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.code_actions.eslint,
			},
		}
	end,
}
