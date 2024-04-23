return {
	"nvim-lualine/lualine.nvim",
	event = "VeryLazy",
	dependencies = {
		"lewis6991/gitsigns.nvim",
		"SmiteshP/nvim-navic",
		"dhruvasagar/vim-zoom",
		"nvim-tree/nvim-web-devicons",
		"ellisonleao/gruvbox.nvim",
	},
	opts = function()
		local function diff_source()
			local gitsigns = vim.b.gitsigns_status_dict
			if gitsigns then
				return {
					added = gitsigns.added,
					modified = gitsigns.changed,
					removed = gitsigns.removed,
				}
			end
		end

		return {
			options = {
				theme = "gruvbox_dark",
				disabled_filetypes = {
					winbar = {
						"alpha",
					},
					statusline = {
						"alpha",
					},
				},
			},
			extensions = {
				"fugitive",
				"toggleterm",
				"trouble",
			},
			sections = {
				lualine_a = { "vim.fn['zoom#statusline']()", "mode" },
				lualine_b = { "filename" },
				lualine_c = {
					{ "b:gitsigns_head", icon = "" },
					{ "diff", source = diff_source },
				},
				lualine_x = { "encoding", "filetype" },
				lualine_y = {
					{ "diagnostics", update_in_insert = true },
				},
			},
			inactive_sections = {
				lualine_c = { { "filename", path = 1 } },
			},
			tabline = {
				lualine_a = { "tabs" },
				lualine_b = {},
				lualine_x = {},
				lualine_y = {},
				lualine_z = { { "datetime", style = "%d/%m" }, { "datetime", style = "%I:%M%p" } },
			},
			winbar = {
				lualine_a = {
					{ "filename", path = 1 },
				},
				lualine_b = {
					{
						"navic",
						color_correction = "static",
						navic_opts = {
							separator = " " ..
							require("lualine").get_config().options.component_separators
							.left .. " ",
						},
						padding = { left = 1, right = 0 },
					},
				},
				lualine_x = {},
				lualine_y = {},
				lualine_z = {},
			},
			inactive_winbar = {
				lualine_a = {
					{ "filename", path = 1 },
				},
				lualine_b = {},
				lualine_x = {},
				lualine_y = {},
				lualine_z = {},
			},
		}
	end,
}
