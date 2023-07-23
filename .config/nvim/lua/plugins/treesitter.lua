return {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufNewFile", "BufReadPost" },
	dependencies = {
		"HiPhish/nvim-ts-rainbow2",
	},
	build = function()
		require("nvim-treesitter.install").update({ with_sync = true })
	end,
	config = function(_, opts)
		require("nvim-treesitter.configs").setup(opts)
	end,
	opts = {
		ensure_installed = {
			"python",
			"lua",
			"vim",
			"vimdoc",
			"git_rebase",
			"git_config",
			"gitcommit",
			"gitignore",
			"html",
			"htmldjango",
			"javascript",
			"json",
			"scss",
			"css",
			"comment",
			"bash",
			"markdown",
			"markdown_inline",
		},

		highlight = {
			enable = true,
		},

		--[[ indent = {
			enable = true,
		}, ]]

		rainbow = {
			enable = true,
		},
	},
}
