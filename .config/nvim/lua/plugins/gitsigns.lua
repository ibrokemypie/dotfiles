return {
	"lewis6991/gitsigns.nvim",
	dependenceies = {
		"petertriho/nvim-scrollbar",
		"nvim-tree/nvim-web-devicons",
	},
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		numhl = true,
		current_line_blame = true,
		current_line_blame_opts = {
			virt_text = true,
			virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
			delay = 200,
			ignore_whitespace = false,
		},
		yadm = {
			enable = true,
		},
	},
	config = function(_, opts)
		require("gitsigns").setup(opts)
		require("scrollbar.handlers.gitsigns").setup()
	end,
}
