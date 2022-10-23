-- project.lua

local project = require('project_nvim')

project.setup {
	patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json", ">.config", ">git" },
}
