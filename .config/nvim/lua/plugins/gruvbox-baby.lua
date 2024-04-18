return {
	"luisiacc/gruvbox-baby",
	-- lazy = false,
	version = false,
	config = function(_, _)
		vim.g.gruvbox_baby_background_color = "soft"
		vim.cmd.colorscheme("gruvbox-baby")
	end,
}
