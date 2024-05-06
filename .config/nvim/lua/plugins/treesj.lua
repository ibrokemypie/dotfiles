return {
	"Wansmer/treesj",
	keys = {
		{
			"J",
			function()
				require("treesj").join()
			end,
		},
		{
			"K",
			function()
				require("treesj").split()
			end,
		},
	},
	dependencies = { "nvim-treesitter/nvim-treesitter" },
	config = function()
		require("treesj").setup({ use_default_keymaps = false })
	end,
}
