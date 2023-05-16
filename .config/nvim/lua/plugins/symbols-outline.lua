return {
	"simrat39/symbols-outline.nvim",
	cmd = { "SymbolsOutline", "SymbolsOutlineOpen", "SymbolsOutlineClose" },
	keys = {
		{ "<leader>fo", "<cmd>SymbolsOutline<cr>", desc = "Find Symbol" },
	},
	opts = {
		auto_preview = true,
	},
	enabled = false,
}
