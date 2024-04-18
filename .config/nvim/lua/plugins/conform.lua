return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	opts = function()
		return {
			formatters_by_ft = {
				python = { "ruff_format", "reorder-python-imports" },
				lua = { "stylua" },
				javascript = { "prettierd" },
			},
			-- If this is set, Conform will run the formatter on save.
			-- It will pass the table to conform.format().
			-- This can also be a function that returns the table.
			format_on_save = {
				-- I recommend these options. See :help conform.format for details.
				lsp_fallback = "always",
				timeout_ms = 1000,
				-- async = true,

				-- timeout_ms = 10000,
			},
			formatters = {
				["reorder-python-imports"] = {
					cwd = function(ctx)
						return require("utils").get_python_root(ctx.filename)
					end,
				},
			},
		}
	end,
	-- idk what this does but its here if something to do with comment formats breaks
	-- init = function()
	-- 	-- If you want the formatexpr, here is the place to set it
	-- 	vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
	-- end,
}
