return {
	"petertriho/nvim-scrollbar",
	-- event = "VeryLazy",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		handle = {
			color = require("gruvbox.palette").get_base_colors().grey,
		},
		handlers = {
			cursor = false,
		},
	},
}
