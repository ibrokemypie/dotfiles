return {
	"folke/flash.nvim",
	-- enabled = false,
	event = "VeryLazy",
	opts = {
		modes = { char = { jump_labels = true } },
	},
	-- stylua: ignore
	keys = {
		-- { "/",     mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash" },
		{ "r",     mode = { "n", "x", "o" }, function() require("flash").treesitter() end,        desc = "Select treesitter nodes" },
		-- { "r",     mode = "o",               function() require("flash").remote() end,            desc = "Remote Flash" },
		{ "R",     mode = { "n", "o", "x" }, function() require("flash").treesitter_search() end, desc = "Search and select treesitter nodes" },
		{ "<c-s>", mode = { "c" },           function() require("flash").toggle() end,            desc = "Toggle Flash Search" },
	},
}
