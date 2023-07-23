return {
	"ibhagwan/fzf-lua",
	-- optional for icon support
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		files = {
			fd_opts = "--color=never --type f --hidden --follow --exclude .git --no-ignore-vcs",
		},
	},
	config = function(opts)
		local fzf = require("fzf-lua")
		local profile = fzf.load_profile("telescope")

		local feedkeys = function(keys, mode)
			vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(keys, true, true, true), mode, true)
		end

		opts = vim.tbl_extend("keep", opts, profile)
		opts["keymap"] = vim.tbl_deep_extend("force", opts.keymap, {
			fzf = {
				["tab"] = "up",
				["shift-tab"] = "down",
				["ctrl-d"] = "toggle",
			},
		})
		opts["winopts"] = vim.tbl_deep_extend("force", opts.winopts, {
			on_create = function()
				vim.cmd([[normal! V]])
				feedkeys("<C-g>", "n")
			end,
		})

		fzf.setup(opts)
	end,
	keys = {
		{
			"<leader>ff",
			"<cmd>lua require('fzf-lua').files( {continue_last_search = true} )<cr>",
			desc = "Find File",
		},
		{
			"<leader>fs",
			"<cmd>lua require('fzf-lua').live_grep({ continue_last_search = true })<cr>",
			desc = "Find String",
		},
		{
			"<leader>fp",
			require("utils").fzf_projects,
			desc = "Find Project",
		},
		{
			"<leader>fb",
			"<cmd>FzfLua buffers<cr>",
			desc = "Find Buffer",
		},
	},
}
