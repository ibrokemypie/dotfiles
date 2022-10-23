-- coq.lua

vim.g.coq_settings = {
	auto_start = 'shut-up',
	keymap = {
		jump_to_mark = "<C-M>"
	}
}

local coq = require('coq')
local lsp = require('lspconfig')

lsp.terraformls.setup{}
lsp.pyright.setup{}
lsp.sumneko_lua.setup {
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
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
