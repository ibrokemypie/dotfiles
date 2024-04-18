return {
	"gnikdroy/projections.nvim",
	event = "VeryLazy",
	branch = "pre_release",
	opts = function()
		return {
			workspaces = {
				"~/git",
				{ "~/.config",                  {} },
				"~/git/livepreso",
				"~/git/lgs_grower",
				{ "~/.config/yadm/alt/.config", {} },
			},
		}
	end,
	config = function(_, opts)
		require("projections").setup(opts)

		-- Autostore session on VimExit
		local Session = require("projections.session")
		vim.api.nvim_create_autocmd({ "VimLeavePre" }, {
			callback = function()
				Session.store(vim.loop.cwd())
			end,
		})

		-- Switch to project if vim was started in a project dir
		local switcher = require("projections.switcher")
		vim.api.nvim_create_autocmd({ "VimEnter" }, {
			callback = function()
				if vim.fn.argc() == 0 then
					switcher.switch(vim.loop.cwd())
				end
			end,
		})

		-- vim.opt.sessionoptions:append("localoptions") -- Save localoptions to session file
		vim.opt.sessionoptions:remove("terminal") -- we don't care about terminal state really
		vim.opt.sessionoptions:remove("buffers") -- only really care about visible buffers
		vim.opt.sessionoptions:remove("options") -- dont know what this means!
	end,
}
