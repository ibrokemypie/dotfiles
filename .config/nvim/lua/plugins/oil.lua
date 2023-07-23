return {
	"stevearc/oil.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	keys = {
		{ "-", '<cmd>lua require("oil").open()<cr>', "Open file browser" },
	},
	opts = {},
}
