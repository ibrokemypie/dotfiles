return {
	"echasnovski/mini.completion",
	event = { "InsertEnter", "CmdlineEnter" },
	-- https://github.com/echasnovski/mini.completion?tab=readme-ov-file#installation
	version = false,
	enabled = false,
	config = function(opts)
		require("mini.completion").setup(opts)

		vim.keymap.set("i", "<Tab>", [[pumvisible() ? "\<C-n>" : "\<Tab>"]], { expr = true })
		vim.keymap.set("i", "<S-Tab>", [[pumvisible() ? "\<C-p>" : "\<S-Tab>"]], { expr = true })
	end,
	opts = {},
}
