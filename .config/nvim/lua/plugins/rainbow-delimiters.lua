return {
	url = "https://gitlab.com/HiPhish/rainbow-delimiters.nvim",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
	},
	event = { "BufReadPost", "BufNewFile" },
	opts = function()
		local rainbow_delimiters = require("rainbow-delimiters")

		return {
			strategy = {
				[""] = rainbow_delimiters.strategy["global"],
				vim = rainbow_delimiters.strategy["local"],
			},
			query = {
				[""] = "rainbow-delimiters",
				lua = "rainbow-blocks",
			},
			highlight = {
				"TSRainbowRed",
				"TSRainbowYellow",
				"TSRainbowBlue",
				"TSRainbowOrange",
				"TSRainbowGreen",
				"TSRainbowViolet",
				"TSRainbowCyan",
			},
			-- highlight = {
			-- 	"RainbowDelimiterRed",
			-- 	"RainbowDelimiterYellow",
			-- 	"RainbowDelimiterBlue",
			-- 	"RainbowDelimiterOrange",
			-- 	"RainbowDelimiterGreen",
			-- 	"RainbowDelimiterViolet",
			-- 	"RainbowDelimiterCyan",
			-- },
		}
	end,
	config = function(_, opts)
		require("rainbow-delimiters.setup").setup(opts)
	end,
}
