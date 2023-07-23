return {
	"SmiteshP/nvim-navic",
	dependencies = { "nvim-tree/nvim-web-devicons", "onsails/lspkind.nvim" },

	opts = function()
		local options = {
			highlight = true,
			lsp = {
				auto_attach = true,
				-- preference = {
				-- 	"pyright",
				-- },
			},
			-- icons = require("lspkind").symbol_map,
		}

		return options
	end,
}
