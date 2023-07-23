return {
	"akinsho/toggleterm.nvim",
	opts = {
		start_in_insert = true,
		auto_scroll = false,
		persist_mode = false,
		float_opts = {
			height = math.ceil(vim.o.lines * 0.7),
			width = math.ceil(vim.o.columns * 0.7),
			border = "none",
		},
	},
	config = true,
	keys = {
		{ "<leader>t", "<cmd>ToggleTerm direction=float<cr>", desc = "Toggle floating terminal" },
	},
}
