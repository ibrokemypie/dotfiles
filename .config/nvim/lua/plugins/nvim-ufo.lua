return {
	"kevinhwang91/nvim-ufo",
	event = { "BufReadPost", "BufNewFile" },
	dependencies = {
		"kevinhwang91/promise-async",
		"neovim/nvim-lspconfig",
		{
			"luukvbaal/statuscol.nvim",
			opts = function()
				local builtin = require("statuscol.builtin")

				return {
					segments = {
						{ text = { "%s" },             click = "v:lua.ScSa" },
						{ text = { builtin.lnumfunc }, click = "v:lua.ScLa" },
						{
							text = { " ", builtin.foldfunc, " " },
							condition = { builtin.not_empty, true, builtin.not_empty },
							click = "v:lua.ScFa",
						},
					},
				}
			end,
		},
	},
	config = function()
		-- Fold options

		-- https://github.com/kevinhwang91/nvim-ufo#minimal-configuration
		vim.o.foldcolumn = "1" -- '0' is not bad
		vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
		vim.o.foldlevelstart = 99
		vim.o.foldenable = true
		vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]

		require("ufo").setup()
	end,
}
