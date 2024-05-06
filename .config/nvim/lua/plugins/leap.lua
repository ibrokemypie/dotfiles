return {
	"ggandor/leap.nvim",
	event = { "WinEnter", "WinNew", "BufWinEnter" },
	dependencies = {
		-- { "ggandor/flit.nvim", setup = true },
	},
	enabled = false,
	config = function()
		require("leap").create_default_mappings()
	end,
}
