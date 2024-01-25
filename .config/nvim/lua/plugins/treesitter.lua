return {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufNewFile", "BufReadPost" },
	build = ":TSUpdate",
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
			"hcl",
			"terraform",
		},

		highlight = {
			enable = true,
		},
	},
	config = function(_, opts)
		require("nvim-treesitter.configs").setup(opts)

		-- local parser_configs = require("nvim-treesitter.parsers").get_parser_configs()
		--
		-- parser_configs.hcl = {
		-- 	filetype = "hcl",
		-- 	"terraform",
		-- }
	end,
}
