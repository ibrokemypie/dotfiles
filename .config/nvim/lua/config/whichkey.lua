-- whichkey.lua

-- unmap space
vim.api.nvim_set_keymap('n', '<Space>', '', {})
-- set space as leader
vim.g.mapleader = ' '

local wk = require("which-key")

wk.setup {}

-- normal mode mappings
wk.register(
  {
    ["<leader>"] = {
      w = { "<cmd>update!<cr>", "Write" },
      q = { "<cmd>q<cr>", "Close pane" },
      c = { "<plug>(comment_toggle_linewise_current)", "Toggle line comment" },
      f = {
        name = "Find",
        f = { "<cmd>Telescope find_files<cr>", "Find File" },
        s = { "<cmd>Telescope live_grep<cr>", "Find String" },
        p = { "<cmd>Telescope projects<cr>", "Find Project" },
        c = { "<cmd>Telescope commands<cr>", "Find Command" },
      },
      u = {
        name = "Packer",
        c = { "<cmd>PackerCompile<cr>", "Compile" },
        s = { "<cmd>PackerSync<cr>", "Sync" },
        S = { "<cmd>PackerStatus<cr>", "Status" },
        u = { "<cmd>PackerUpdate<cr>", "Update" },
      }
    },
    ["<c-h>"] = { "<cmd>wincmd h <cr>", "Focus pane left" },
    ["<c-j>"] = { "<cmd>wincmd j <cr>", "Focus pane down" },
    ["<c-k>"] = { "<cmd>wincmd k <cr>", "Focus pane up" },
    ["<c-l>"] = { "<cmd>wincmd l <cr>", "Focus pane right" },
  },
  {
    mode = "n"
  }
)

-- visual mode mappings
wk.register(
  {
    ["<leader>"] = {
      c = { "<plug>(comment_toggle_blockwise_visual)", "Toggle line comment" },
    },
  },
  {
    mode = "v"
  }
)
