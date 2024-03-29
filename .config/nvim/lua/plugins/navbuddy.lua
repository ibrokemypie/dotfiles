return {
	"SmiteshP/nvim-navbuddy",
	dependencies = {
		"SmiteshP/nvim-navic",
		"MunifTanjim/nui.nvim",
	},
	cmd = { "Navbuddy" },
	config = true,
	opts = {
		lsp = {
			auto_attach = true,
			-- preference = { "pyright" },
		},
	},
	keys = {
		{ "<leader>fo", "<cmd>Navbuddy<cr>", desc = "Find Symbol" },
	},
}
