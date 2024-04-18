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
		with_sync = true,
		-- Install parsers synchronously (only applied to `ensure_installed`)
		sync_install = false,

		highlight = {
			enable = true,
			disable = function(lang, buf)
				local max_filesize = 1000 * 1024 -- 1000 KB
				local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
				if ok and stats and stats.size > max_filesize then
					return true
				end
			end,
			-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
			-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
			-- Using this option may slow down your editor, and you may see some duplicate highlights.
			-- Instead of true it can also be a list of languages
			additional_vim_regex_highlighting = false,
		},

		indent = {
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
