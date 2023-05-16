return {
	"ahmedkhalf/project.nvim",
	event = "VeryLazy",
	opts = {
		patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json", ">.config", ">git" },
		exclude_dirs = { "~/git/livepreso/livepreso/*", "~/git/livepreso/api/core/hq" },
		scope_chdir = "win",
		-- silent_chdir = false,
		detection_methods = { "pattern", "lsp" },
	},
	main = "project_nvim",
	enabled = false,
}
