return {
	"nvimdev/lspsaga.nvim",
	event = "LspAttach",
	dependencies = { "nvim-tree/nvim-web-devicons", "neovim/nvim-lspconfig", "nvim-treesitter/nvim-treesitter" },
	config = function(_, opts)
		require("lspsaga").setup(opts)
	end,
	keys = {
		{ "gd",        "<cmd>Lspsaga finder<cr>",           desc = "Lspsaga lsp finder" },
		{ "gr",        "<cmd>Lspsaga rename ++project<cr>", desc = "Lspsaga rename in file" },
		{ "ga",        "<cmd>Lspsaga code_action<cr>",      desc = "Lspsaga code action" },
		{ "<leader>t", "<cmd>Lspsaga term_toggle<cr>",      desc = "Lspsaga toggle terminal" },
		{
			"<leader>dl",
			"<cmd>Lspsaga show_line_diagnostics<cr>",
			desc = "Lspsaga show line diagnostics",
		},
		{
			"<leader>df",
			"<cmd>Lspsaga show_buf_diagnostics<cr>",
			desc = "Lspsaga show buffer/file diagnostics",
		},
		{
			"<leader>dw",
			"<cmd>Lspsaga show_workspace_diagnostics<cr>",
			desc = "Lspsaga show workspace diagnostics",
		},
	},
	opts = {
		symbol_in_winbar = {
			enable = false,
		},
		rename = {
			in_select = false,
		},
		finder = {
			keys = {
				toggle_or_open = "<CR>",
				quit = "<Esc>",
			},
		},
		-- lightbulb = {
		-- 	enable = false,
		-- },
	},
}
