return {
	"folke/trouble.nvim",
	cmd = { "TroubleToggle", "Trouble" },
	keys = {
		{ "<leader>tt", "<cmd>TroubleToggle<cr>",                       desc = "Toggle" },
		{ "<leader>tw", "<cmd>TroubleToggle workspace_diagnostics<cr>", desc = "Workspace" },
		{ "<leader>to", "<cmd>TroubleToggle document_diagnostics<cr>",  desc = "Document" },
		{ "<leader>td", "<cmd>TroubleToggle lsp_definitions<cr>",       desc = "Definitions" },
		{ "<leader>tr", "<cmd>TroubleToggle lsp_references<cr>",        desc = "References" },
		{ "<leader>ti", "<cmd>TroubleToggle lsp_implementations<cr>",   desc = "Implementations" },
	},
}
