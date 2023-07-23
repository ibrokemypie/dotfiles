return {
	"lewis6991/hover.nvim",
	keys = {
		{
			"gh",
			function()
				require("hover").hover_select()
			end,
			desc = "Select hover source",
		},
	},
	config = function(_, opts)
		require("hover").setup(opts)
	end,
	opts = {
		init = function()
			-- Require providers
			require("hover.providers.lsp")
			-- require('hover.providers.gh')
			-- require('hover.providers.gh_user')
			-- require('hover.providers.jira')
			require("hover.providers.man")
			require("hover.providers.dictionary")
		end,
		preview_opts = {
			border = nil,
		},
		-- Whether the contents of a currently open hover window should be moved
		-- to a :h preview-window when pressing the hover keymap.
		preview_window = false,
		title = true,
	},
	init = function()
		vim.opt.updatetime = 1000
		-- vim.api.nvim_create_autocmd("CursorHold", {
		-- 	callback = function()
		-- 		require("hover").hover()
		-- 	end,
		-- })
	end,
}
