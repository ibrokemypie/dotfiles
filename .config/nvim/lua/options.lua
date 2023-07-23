-- options.lua

local opt = vim.opt

opt.colorcolumn = "80"
opt.undofile = true
opt.mouse = ""
opt.background = "dark"
opt.smartcase = true
opt.ignorecase = true
opt.smartindent = true
opt.number = true
opt.cursorline = true
opt.undofile = true
opt.spelllang = "en_au"
opt.spell = true
-- opt.sessionoptions = "blank,buffers,curdir,folds,help,winsize,winpos,terminal,localoptions"
opt.guifont = "Iosevka Nerd Font:h10"
opt.tabstop = 4

vim.g.python3_host_prog = os.getenv("HOME") .. "/.pyenv/versions/nvim/bin/python"
-- vim.lsp.set_log_level(vim.lsp.log_levels.INFO)
--
-- set space as leader
vim.g.mapleader = " "

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
