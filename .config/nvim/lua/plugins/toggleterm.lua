return {
	"akinsho/toggleterm.nvim",
	opts = {
		start_in_insert = true,
		auto_scroll = false,
		persist_mode = false,
		float_opts = {
			-- height = math.ceil(vim.o.lines * 0.7),
			-- width = math.ceil(vim.o.columns * 0.7),
			-- akinsho/toggleterm.nvim
			width = function()
				return math.floor(vim.o.columns * 0.7)
			end,

			height = function()
				return math.floor((vim.o.lines - vim.o.cmdheight) * 0.7)
			end,

			row = function()
				return math.floor(0.05 * (vim.o.lines - vim.o.cmdheight))
			end,
			border = "none",
		},
	},
	config = true,
	keys = {
		{ "<leader>t", "<cmd>ToggleTerm direction=float<cr>", desc = "Toggle floating terminal" },
	},
}
