return {
	"lukas-reineke/indent-blankline.nvim",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
	},
	event = { "BufReadPost", "BufNewFile" },
	main = "ibl",
	opts = {
		exclude = {
			filetypes = {
				"help",
				"terminal",
				"lazy",
				"lspinfo",
				"TelescopePrompt",
				"TelescopeResults",
				"mason",
				"nvdash",
				"nvcheatsheet",
				"alpha",
				"",
			},
			buftypes = {
				"terminal",
			},
		},
		scope = {
				enabled = false,
			show_start = false,
			show_end = false,
		},
	},
}
