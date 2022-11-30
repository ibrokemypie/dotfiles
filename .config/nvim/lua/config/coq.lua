-- coq.lua

vim.g.coq_settings = {
  auto_start = 'shut-up',
  keymap = {
    bigger_preview = "<C-P>",
    jump_to_mark = "<C-M>",
  }
}

local coq = require('coq')
local lsp = require('lspconfig')
local lsp_signature = require('lsp_signature')
local util = require('lspconfig/util')
local navic = require("nvim-navic")

local path = util.path

lsp_signature.setup({
  bind = true, -- This is mandatory, otherwise border config won't get registered.
  handler_opts = {
    border = "rounded"
  }
})

local function get_python_path(workspace)
  -- Use activated virtualenv.
  if vim.env.VIRTUAL_ENV then
    return path.join(vim.env.VIRTUAL_ENV, 'bin', 'python')
  end


  -- Find and use virtualenv in workspace directory.
  for _, pattern in ipairs({ '*', '.*' }) do
    local match = vim.fn.glob(path.join(workspace, pattern, 'pyvenv.cfg'))
    if match ~= '' then
      return path.join(path.dirname(match), 'bin', 'python')
    end
  end

  -- Fallback to system Python.
  return vim.fn.exepath('python3') or vim.fn.exepath('python') or 'python'
end

local on_attach = function(client, bufnr)
  navic.attach(client, bufnr)
end

--[[ lsp.pyright.setup(coq.lsp_ensure_capabilities({
  on_init = function(client)
    client.config.settings.python.pythonPath = get_python_path(client.config.root_dir)
  end,
  on_attach = on_attach,
  settings = {
    python = {
      analysis = {
        typeCheckingMode = "off"
      }
    }
  }
})) ]]

lsp.terraformls.setup(coq.lsp_ensure_capabilities({
  on_attach = on_attach
}))

lsp.pylsp.setup(coq.lsp_ensure_capabilities({
  settings = {
    pylsp = {
      plugins = {
        autopep8 = {
          enabled = false
        },
        black = {
          enabled = true
        }
      }
    }
  },
  on_init = function(client)
    client.config.settings.python.pythonPath = get_python_path(client.config.root_dir)
  end,
  on_attach = on_attach
}))

lsp.sumneko_lua.setup(coq.lsp_ensure_capabilities({
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { 'vim' },
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
  on_attach = on_attach
}))
