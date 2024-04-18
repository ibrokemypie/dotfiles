local M = {}

M.get_python_root = function(filename)
	local util = require("lspconfig/util")
	local root_files = {
		"pyproject.toml",

		-- kill this for hq/views/setup.py
		-- 'setup.py',
		"setup.cfg",
		"requirements.txt",
		"pipfile",
		"pyrightconfig.json",
	}
	return util.root_pattern(unpack(root_files))(filename)
	    or util.find_git_ancestor(filename)
	    or util.path.dirname(filename)
end

M.get_pyenv_root = function()
	local handle = io.popen("pyenv root")
	if handle then
		local output = handle:read("*a")
		handle:close()
		return string.gsub(output, "\n", "")
	end
end

M.get_pyenv_versions = function()
	return M.get_pyenv_root() .. "/versions"
end

M.get_pyenv_version = function()
	local handle = io.popen("pyenv version-name")
	if handle then
		local output = handle:read("*a")
		handle:close()
		return string.gsub(output, "\n", "")
	end
end

M.get_pyenv_prefix = function()
	local handle = io.popen("pyenv prefix")
	if handle then
		local output = handle:read("*a")
		handle:close()
		return string.gsub(output, "\n", "")
	end
end

M.get_python_venv = function(workspace)
	local util = require("lspconfig/util")

	local pyenv_path = M.get_pyenv_prefix()
	if pyenv_path ~= "" then
		return pyenv_path
	end

	-- Use activated virtualenv.
	if vim.env.VIRTUAL_ENV then
		return vim.env.VIRTUAL_ENV
	end

	-- Find and use virtualenv in workspace directory.
	for _, pattern in ipairs({ "*", ".*" }) do
		local match = vim.fn.glob(util.path.join(workspace, pattern, "pyvenv.cfg"))
		if match ~= "" then
			return util.path.dirname(match)
		end
	end
end

M.get_python_path = function(workspace)
	local util = require("lspconfig/util")

	local venv_path = M.get_python_venv(workspace)
	if venv_path ~= "" then
		return util.path.join(M.get_python_venv(workspace), "bin", "python")
	end

	-- Fallback to system Python.
	return vim.fn.exepath("python3") or vim.fn.exepath("python") or "python"
end

M.close_tab_or_nvim = function()
	local tabs = vim.api.nvim_list_tabpages()
	local tabcount = #tabs

	if tabcount == 1 then
		vim.cmd("cquit")
	else
		vim.cmd("tabclose")
	end
end

M.get_projections_projects = function()
	local workspaces = require("projections.workspace").get_workspaces()
	local projects = {}

	for _, workspace in ipairs(workspaces) do
		for _, project in ipairs(workspace:projects()) do
			table.insert(projects, project)
		end
	end

	return projects
end

M.recent_projections_projects = function(number)
	if number == nil then
		number = 10
	end

	local get_session_filename = require("projections.session").session_filename
	local sessions_directory = require("projections.config").config.sessions_directory

	local projects = M.get_projections_projects()

	local function get_session_mod_time(project)
		-- gets the modified time of the project's session file

		local workspace_path = project["workspace"]["path"]
		local project_name = project["name"]

		local session_filename = get_session_filename(tostring(workspace_path), project_name)
		local session_file_path = tostring(sessions_directory .. session_filename)
		local session_mod_time = vim.fn.getftime(session_file_path)

		return session_mod_time
	end

	local function compare_projects(project1, project2)
		-- compares the modification time of two project sessions

		return get_session_mod_time(project1) > get_session_mod_time(project2)
	end

	table.sort(projects, compare_projects)

	local returned_projects = {}
	for _, project in ipairs(projects) do
		if number ~= -1 and #returned_projects >= number then
			break
		end

		table.insert(returned_projects, project)
	end

	return returned_projects
end

M.recent_projections_sessions = function(number)
	local projects = M.recent_projections_projects(number)

	local sessions = {}
	for _, project in ipairs(projects) do
		local session = tostring(project["workspace"]["path"]) .. "/" .. project["name"]
		table.insert(sessions, session)
	end

	return sessions
end

M.fzf_projects = function(opts)
	local fzf_lua = require("fzf-lua")
	opts = opts or {}
	opts.prompt = "Projects> "
	opts.actions = {
		["default"] = function(selected, _)
			-- extract the session without the icon using a lua pattern
			local session = selected[1]:match("%s+(.*)")
			require("projections.switcher").switch(session)
		end,
	}
	local contents = function(cb)
		for _, s in ipairs(M.recent_projections_sessions(-1)) do
			cb(string.format("%s  %s", fzf_lua.utils.ansi_codes.green(""), fzf_lua.path.HOME_to_tilde(s)))
		end
		cb(nil) -- signal EOF, ends fzf “loading” indicator
	end
	fzf_lua.fzf_exec(contents, opts)
end

return M
