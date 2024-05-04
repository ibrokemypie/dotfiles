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
				-- sql = { "sql_formatter" },
				sql = { "prettier" },
			},
			format_on_save = function(bufnr)
				-- Disable with a global or buffer-local variable
				if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
					return
				end
				-- local bufnr = vim.api.nvim_get_current_buf()
				local errors = vim.diagnostic.get(0,
					{ severity = { min = vim.diagnostic.severity.ERROR } })

				if #errors > 0 then
					return
				end

				return { timeout_ms = 500, lsp_fallback = "always" }
			end,
			formatters = {
				prettierd = {
					env = {
						NODE_PATH = "/usr/lib/node_modules",
					},
				},
				prettier = {
					-- command = "env",
					-- args = { "NODE_PATH=/usr/lib/node_modules/", "prettier", "--stdin-filepath", "$FILENAME" },
					env = {
						NODE_PATH = "/usr/lib/node_modules/",
					},
				},
				["reorder-python-imports"] = {
					cwd = function(ctx)
						return require("utils").get_python_root(ctx.filename)
					end,
				},
				sql_formatter = {
					args = {
						"-l",
						"postgresql",
						"--config",
						"{ "
						.. '"keywordCase": "upper", '
						.. '"paramTypes": { '
						.. '"custom": ['
						.. "{ "
						.. [["regex": "%\\(.+\\)s"]]
						-- .. '"key": "(text) => text.slice(2, -2)"'
						.. " },"
						.. "{ "
						.. [["regex": "%s"]]
						.. " }"
						.. "] "
						.. "} "
						.. "}",
					},
				},
			},
		}
	end,
	-- idk what this does but its here if something to do with comment formats breaks
	-- init = function()
	-- 	-- If you want the formatexpr, here is the place to set it
	-- 	vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
	-- end,
	init = function()
		vim.api.nvim_create_user_command("FormatDisable", function(args)
			if args.bang then
				-- FormatDisable! will disable formatting just for this buffer
				vim.b.disable_autoformat = true
			else
				vim.g.disable_autoformat = true
			end
		end, {
			desc = "Disable autoformat-on-save",
			bang = true,
		})
		vim.api.nvim_create_user_command("FormatEnable", function()
			vim.b.disable_autoformat = false
			vim.g.disable_autoformat = false
		end, {
			desc = "Re-enable autoformat-on-save",
		})
	end,
}
