return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.1",
	cmd = "Telescope",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope-live-grep-args.nvim",
		"natecraddock/telescope-zf-native.nvim",
		"nvim-telescope/telescope-file-browser.nvim",
		"gnikdroy/projections.nvim",
		-- "ahmedkhalf/project.nvim",
	},
	keys = {
		{ "<leader>ff", "<cmd>Telescope find_files<cr>",                desc = "Find File" },
		{ "<leader>fs", "<cmd>Telescope grep_string search=<cr>",       desc = "Find String" },
		-- { "<leader>fp", "<cmd>Telescope projects<cr>",                  desc = "Find Project" },
		{ "<leader>fp", "<cmd>Telescope projections<cr>",               desc = "Find Project" },
		{ "<leader>fc", "<cmd>Telescope registers<cr>",                 desc = "Find Register" },
		{ "<leader>fh", "<cmd>Telescope help_tags<cr>",                 desc = "Find Help" },
		{ "<leader>fr", "<cmd>Telescope lsp_references<cr>",            desc = "Find Reference" },
		{ "<leader>fb", "<cmd>Telescope buffers<cr>",                   desc = "Find Buffer" },
		{ "<leader>f/", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Fuzzy search file" },
	},
	opts = function()
		local fb_actions = require("telescope").extensions.file_browser.actions
		return {
			defaults = {
				mappings = {
					i = {
						["<C-l>"] = false,
						["<c-t>"] = require("trouble").open_with_trouble,
					},
					n = {
						["<c-t>"] = require("trouble").open_with_trouble,
					},
				},
			},
			pickers = {
				find_files = {
					find_command = { "rg", "--files", "--no-ignore-vcs" },
				},
			},
			extensions = {
				file_browser = {
					initial_mode = "normal",
					hijack_netrw = true,
					hide_parent_dir = true,
					grouped = true,
					mappings = {
						["n"] = {
							["-"] = fb_actions.goto_parent_dir,
						},
					},
				},
				live_grep_args = {
					mappings = {
						i = {
							["<C-i>"] = require("telescope-live-grep-args.actions").quote_prompt({
								postfix = " --iglob ",
							}),
						},
					},
				},
			},
		}
	end,
	config = function(_, opts)
		local telescope = require("telescope")

		telescope.setup(opts)
		telescope.load_extension("file_browser")
		-- telescope.load_extension("projects")
		telescope.load_extension("projections")
		telescope.load_extension("zf-native")
		telescope.load_extension("live_grep_args")
	end,
}
