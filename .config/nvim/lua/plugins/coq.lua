return {
	"ms-jpq/coq_nvim",
	event = { "InsertEnter", "CmdlineEnter" },
	build = ":COQdeps",
	version = false,
	enabled = false,
	init = function()
		vim.g.coq_settings = { auto_start = true }
	end,
}
