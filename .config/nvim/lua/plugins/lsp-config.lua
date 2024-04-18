return {
	"neovim/nvim-lspconfig",
	version = false,
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		-- "lukas-reineke/lsp-format.nvim",
		"ray-x/lsp_signature.nvim",
		{ "b0o/schemastore.nvim", version = false },
		"SmiteshP/nvim-navbuddy",
	},
	config = function()
		local util = require("lspconfig/util")

		-- virtualenv support for python
		-- cmp capabilities for lsp_config
		local base_capabilities = vim.tbl_deep_extend(
			"force",
			util.default_config.capabilities,
			require("cmp_nvim_lsp").default_capabilities(),
			-- nvim ufo support https://github.com/kevinhwang91/nvim-ufo#minimal-configuration
			{
				textDocument = {
					foldingRange = {
						dynamicRegistration = false,
						lineFoldingOnly = true,
					},
				},
			}
		)

		-- see https://github.com/lukas-reineke/lsp-format.nvim#how-do-i-use-format-options
		-- to add extra formatters etc
		local on_attach = function(client, bufnr)
			require("lsp_signature").on_attach({}, bufnr)
			-- require("lsp-format").on_attach(client)
		end

		local default_config = {
			capabilities = base_capabilities,
			on_attach = on_attach,
			flags = {
				debounce_text_changes = 150,
			},
		}

		-- local venv = util.path.join(os.getenv("HOME"), ".pyenv/versions/nvim")

		local enabled_servers = {
			terraformls = {},
			tsserver = {},
			html = {},
			eslint = {},
			sqlls = {},
			taplo = {
				cmd = { "taplo", "lsp", "stdio" },
			},
			jsonls = {
				settings = {
					json = {
						schemas = require("schemastore").json.schemas(),
						validate = { enable = true },
					},
				},
			},
			yamlls = {
				settings = {
					yaml = {
						schemas = require("schemastore").yaml.schemas(),
						format = { enable = true },
						validate = true,
						hover = true,
						completion = true,
					},
				},
				on_attach = function(client, bufnr)
					client.server_capabilities.documentFormattingProvider = true
					on_attach(client, bufnr)
				end,
			},
			pyright = {
				on_attach = function(client, bufnr)
					on_attach(client, bufnr)
					if client.config.settings.python == nil then
						client.config.settings.python = {}
					end
					client.config.settings.python.pythonPath = require("utils").get_python_path(
					client.config.root_dir)
				end,
				root_dir = require("utils").get_python_root,
				settings = {
					pyright = {
						-- handled by conform - reorder-python-imports
						disableOrganizeImports = true,
					},
					python = {
						venvPath = require("utils").get_pyenv_root(),
						-- venv = "",
						analysis = {
							-- turn off warnings about missing types!
							typeCheckingMode = "off",
							functionReturnTypes = false,
						},
					},
				},
			},
			-- pylsp = {
			-- 	cmd = { "/bin/pylsp", "--log-file=/tmp/pylsp.log", "-v" },
			-- 	root_dir = require("utils").get_python_root,
			-- 	on_attach = function(client, bufnr)
			-- 		on_attach(client, bufnr)
			--
			-- 		local python_path = require("utils").get_python_venv(client.config.root_dir)
			--
			-- 		-- client.config.settings.pylsp.plugins.rope.python_path = { python_path }
			-- 		client.config.settings.pylsp.plugins.rope_autoimport.python_path = { python_path }
			-- 	end,
			-- 	settings = {
			-- 		pylsp = {
			-- 			plugins = {
			-- 				rope_autoimport = {
			-- 					enabled = true,
			-- 					python_path = {},
			-- 				},
			-- 				black = {
			-- 					enabled = false,
			-- 				},
			-- 			},
			-- 		},
			-- 	},
			-- },
			-- ruff_lsp = {
			-- 	on_attach = function(client, bufnr)
			-- 		if client.name == "ruff_lsp" then
			-- 			-- Disable hover in favor of Pyright
			-- 			client.server_capabilities.hoverProvider = false
			-- 		end
			-- 		client.server_capabilities.documentFormattingProvider = true
			-- 		on_attach(client, bufnr)
			-- 	end,
			-- 	root_dir = require("utils").get_python_root,
			-- 	init_options = {
			-- 		settings = {
			-- 			organizeImports = false,
			-- 			lint = {
			-- 				args = { "--ignore", "F401" },
			-- 			},
			-- 		},
			-- 	},
			-- },
			lua_ls = {
				single_file_support = true,
				settings = {
					runtime = {
						-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
						version = "LuaJIT",
					},
					diagnostics = {
						-- Get the language server to recognize the `vim` global
						globals = { "vim" },
					},
					workspace = {
						-- Make the server aware of Neovim runtime files
						library = vim.api.nvim_get_runtime_file("", true),
					},
					-- Do not send telemetry data containing a randomized but unique identifier
					telemetry = {
						enable = false,
					},
				},
			},
		}

		for server, config in pairs(enabled_servers) do
			config = vim.tbl_deep_extend("force", default_config, config)
			require("lspconfig")[server].setup(config)
		end
	end,
}
