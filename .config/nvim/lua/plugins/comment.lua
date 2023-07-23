return {
	"numToStr/Comment.nvim",
	-- event = { "BufReadPre", "BufNewFile" },
	config = true,
	keys = {
		{ "<LEADER>c", "<PLUG>(comment_toggle_linewise_current)", desc = "Toggle comment (normal)", mode = "n" },
		{ "<LEADER>c", "<PLUG>(comment_toggle_linewise_visual)",  desc = "Toggle comment (visual)", mode = "x" },
	},
}
