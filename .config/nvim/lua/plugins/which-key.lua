return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	config = function(_, opts)
		vim.o.timeoutlen = 300
		vim.o.timeout = true

		local remap = vim.api.nvim_set_keymap

		-- unmap space
		remap("n", "<Space>", "", {})

		-- set space as leader
		vim.g.mapleader = " "

		local wk = require("which-key")

		wk.setup(opts)

		-- normal mode mappings
		wk.register({
			["<LEADER>"] = {
				["<LEADER>"] = { "<CMD>WhichKey<CR>", "Show bindings" },
				w = {
					name = "Window",
					v = { "<CMD>vsplit<CR>", "Create vertical split" },
					s = { "<CMD>split<CR>", "Create orizontal split" },
				},
				s = { "<CMD>update!<CR>", "Save" },
				q = { "<CMD>q<CR>", "Close window" },
				Q = { require("utils").close_tab_or_nvim, "Close current tab" },
				X = { "<CMD>cquit<CR>", "Close current tab" },
				c = { "<PLUG>(comment_toggle_linewise_current)", "Toggle line comment" },
				f = {
					name = "Find",
				},
				t = {
					name = "Trouble",
				},
				g = {
					name = "Git",
					b = { "<CMD>Git blame<CR>", "Blame" },
				},
			},
			["<C-h>"] = { "<CMD>wincmd h <CR>", "Focus window left" },
			["<C-j>"] = { "<CMD>wincmd j <CR>", "Focus window down" },
			["<C-k>"] = { "<CMD>wincmd k <CR>", "Focus window up" },
			["<C-l>"] = { "<CMD>wincmd l <CR>", "Focus window right" },
			["H"] = { "^", "Start of line" },
			["L"] = { "$", "End of line" },
			["<Left>"] = { "<CMD>vertical resize +1<CR>", "Grow window left" },
			["<Down>"] = { "<CMD>resize +1<CR>", "Grow window down" },
			["<Up>"] = { "<CMD>resize -1<CR>", "Shrink window up" },
			["<Right>"] = { "<CMD>vertical resize -1<CR>", "Shrink window left" },
			["<ESC>"] = { "<CMD>nohlsearch<Bar>:echo<CR>", "Cancel search" },
			["<C-t>"] = { "<CMD>tabnew<CR>", "New tab" },
			["<C-tab>"] = { "<CMD>tabnext<CR>", "Next tab" },
			["<C-s-tab>"] = { "<CMD>tabprevious<CR>", "Previous tab" },
			-- ["-"] = { "<CMD>Telescope file_browser path=%:p:h<CR>", "Open file browser" },
		}, {
			mode = "n",
		})

		-- insert mode mappings
		wk.register({
			["jk"] = { "<ESC>", "" },
			["<ESC>"] = { "<ESC>", "" },
			["<C-h>"] = { "<Left>", "Left" },
			["<C-j>"] = { "<Down>", "Down" },
			["<C-k>"] = { "<Up>", "Up" },
			["<C-l>"] = { "<Right>", "Right" },
			["<Up>"] = { "<NOP>", "which_key_ignore" },
			["<Down>"] = { "<NOP>", "which_key_ignore" },
			["<Left>"] = { "<NOP>", "which_key_ignore" },
			["<Right>"] = { "<NOP>", "which_key_ignore" },
		}, {
			mode = "i",
		})

		-- visual mode mappings
		wk.register({
			["jk"] = { "<ESC>", "" },
			["<ESC>"] = { "<ESC>", "" },
		}, {
			mode = "v",
		})

		-- terminal mode mappings
		wk.register({
			["jk"] = { "<C-\\><C-n>", "" },
			["<C-h>"] = { "<Left>", "Left" },
			["<C-j>"] = { "<Down>", "Down" },
			["<C-k>"] = { "<Up>", "Up" },
			["<C-l>"] = { "<Right>", "Right" },
		}, {
			mode = "t",
		})
	end,
	opts = {},
}
