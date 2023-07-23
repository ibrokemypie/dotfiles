return {
	"goolord/alpha-nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	event = "VimEnter",
	config = function()
		local alpha = require("alpha")
		local startify = require("alpha.themes.startify")

		local function project_button(shortcut, project)
			local session = tostring(project["workspace"]["path"]) .. "/" .. project["name"]
			local short_session = vim.fn.fnamemodify(session, ":~")

			local fn_start = short_session:match(".*[/\\]")
			local sesssion_restore_cmd = "<CMD>lua require('projections.session').restore('" ..
			session .. "')<CR>"

			local icon = ""
			local icon_text = icon .. "  "

			local button = startify.button(shortcut, icon_text .. short_session, sesssion_restore_cmd)

			local button_highlight = {}
			table.insert(button_highlight, { "NERDTreeDir", 0, #icon })

			if fn_start ~= nil then
				table.insert(button_highlight, { "Comment", #icon_text, #fn_start + #icon_text })
			end

			button.opts.hl = button_highlight

			return button
		end

		local function recent_projects(start, items_number)
			local projects = require("utils").recent_projections_projects(items_number)

			local buttons = {}
			for i, project in ipairs(projects) do
				table.insert(buttons, project_button(tostring(i + start - 1), project))
			end

			return {
				type = "group",
				val = buttons,
				opts = {},
			}
		end

		startify.section.projects = {
			type = "group",
			val = {
				{ type = "padding", val = 1 },
				{ type = "text",    val = "Projects", opts = { hl = "SpecialComment" } },
				{ type = "padding", val = 1 },
				{
					type = "group",
					val = function()
						return { recent_projects(0) }
					end,
				},
			},
		}
		startify.config.layout = {
			{ type = "padding", val = 1 },
			startify.section.header,
			{ type = "padding", val = 2 },
			startify.section.projects,
			startify.section.mru,
			{ type = "padding", val = 1 },
			startify.section.bottom_buttons,
			startify.section.footer,
		}
		alpha.setup(startify.config)
	end,
}
