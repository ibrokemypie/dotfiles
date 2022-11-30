-- options.lua

local opt = vim.opt

opt.colorcolumn = "80"
opt.timeoutlen = 300
opt.undofile = true
opt.mouse = ''
opt.background = 'dark'
opt.smartcase = true
opt.ignorecase = true
opt.smartindent = true
opt.number = true
opt.cursorline = true
opt.undofile = true

vim.g.python3_host_prog = os.getenv("HOME") .. "/.pyenv/versions/nvim/bin/python"
