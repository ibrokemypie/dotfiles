return {
	"kylechui/nvim-surround",
	dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },
	event = { "BufReadPost", "BufNewFile" },
	config = true,
}
