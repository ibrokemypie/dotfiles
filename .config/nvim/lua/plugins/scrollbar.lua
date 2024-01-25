return {
	"petertriho/nvim-scrollbar",
	-- event = "VeryLazy",
	event = { "BufReadPost", "BufNewFile" },
	opts = {
		handle = {
			color = require("gruvbox").palette.gray,
		},
		handlers = {
			cursor = false,
		},
	},
}
