-- init.lua

require("options")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins", {
	install = {
		colorscheme = { "gruvbox" },
	},
	defaults = {
		version = "*",
		lazy = true,
	},
	change_detection = {
		notify = false,
	},
})

require("autocmds")
