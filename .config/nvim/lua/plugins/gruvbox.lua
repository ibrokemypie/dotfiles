return {
	"ellisonleao/gruvbox.nvim",
	lazy = false, -- make sure we load this during startup if it is your main colorscheme
	version = false,
	priority = 1000, -- make sure to load this before all the other start plugins
	opts = {
		overrides = {
			SignColumn = { link = "Normal" },
			GruvboxGreenSign = { bg = "" },
			GruvboxOrangeSign = { bg = "" },
			GruvboxPurpleSign = { bg = "" },
			GruvboxYellowSign = { bg = "" },
			GruvboxRedSign = { bg = "" },
			GruvboxBlueSign = { bg = "" },
			GruvboxAquaSign = { bg = "" },
		},
	},
	config = function(_, opts)
		require("gruvbox").setup(opts)
		vim.cmd.colorscheme("gruvbox")
	end,
}
